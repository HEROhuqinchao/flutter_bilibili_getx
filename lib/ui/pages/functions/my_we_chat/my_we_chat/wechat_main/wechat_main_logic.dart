import 'dart:convert';

import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/my_we_chat_logic.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

import '../../../../../../core/model/wechat/receive_data_model.dart';
import '../../../../../../core/service/request/wechat_request.dart';
import '../../../../../../core/sqlite/sqlite_util.dart';
import '../../../../../../core/web_socket_channel/web_socket_util.dart';
import '../../chat_room/chat_room_logic.dart';
import '../../chat_room/chat_room_view.dart';
import '../message_change_notifier/message_change_notifier.dart';
import 'wechat_main_state.dart';

class WechatMainLogic extends GetxController {
  final WechatMainState state = WechatMainState();

  ///初始化数据
  iniWeChatMain() {
    state.latestMsgData = {};
    state.userList = [];
    state.messageHistoryList = [];

    ///拉取最近消息
    getMessageHistoryFromDatabase();

    ///连接webSocket
    connectToServer();

    ///获取用户列表
    getWechatUsers();
  }

  ///获取用户列表
  getWechatUsers() {
    WechatRequest().getWechatUsers().then((value) {
      if (value.code == 0) {
        state.userList.clear();
        state.userList.addAll(value.data!);
        update();

        ///更新朋友数量
        MyWeChatLogic myWeChatLogic = Get.find<MyWeChatLogic>();
        myWeChatLogic.state.friendsNumber = state.userList.length;
        myWeChatLogic.update();
      }
    });
  }

  ///进入聊天室
  go2ChatRoom(int index) async {
    ChatRoomLogic chatRoomLogic = Get.find<ChatRoomLogic>();
    chatRoomLogic.initChatRoom();
    chatRoomLogic.state.userModel = state.userList[index];
    chatRoomLogic.state.webSocketChannel = state.webSocketChannel;
    chatRoomLogic.state.isLoginUserId = state.isLoginUserId;

    ///拉取某个人本地消息历史数据（包括发送者的消息和本人发的消息）
    final messageList = await SqliteUtil.queryTable(
      tableName: SqliteUtil.tableWechatMessageHistory,
      orderBy: SqliteUtil.columnMessageDate,
      where:
          "(${SqliteUtil.columnSenderId} = ? AND ${SqliteUtil.columnReceiverId} = ?) "
          "OR (${SqliteUtil.columnReceiverId} = ? AND ${SqliteUtil.columnSenderId} = ?)",
      whereArgs: [
        state.userList[index].userId!,
        state.isLoginUserId,
        state.userList[index].userId!,
        state.isLoginUserId,
      ],
    );

    ///更新消息阅读的时间
    await SqliteUtil.updateTable(
      tableName: SqliteUtil.tableWechatMessageHistory,
      map: {
        SqliteUtil.columnMessageReadTime: DateTime.now().millisecondsSinceEpoch
      },
      where:
          "${SqliteUtil.columnSenderId} = ? AND ${SqliteUtil.columnReceiverId} = ? "
          "AND ${SqliteUtil.columnMessageReadTime} = 0",
      whereArgs: [
        state.userList[index].userId!,
        state.isLoginUserId,
      ],
    );
    MessageChangeNotifier.getInstance()
        .readMessage(state.userList[index].userId!);

    ///更新聊天室内的聊天记录
    chatRoomLogic.state.chatRoomMessageList.clear();
    for (Map map in messageList) {
      chatRoomLogic.state.chatRoomMessageList.add(
        ReceiveDataModel(
          sender: map[SqliteUtil.columnSenderId],
          receiver: map[SqliteUtil.columnReceiverId],
          msg: map[SqliteUtil.columnMessageContent],
          date: map[SqliteUtil.columnMessageDate],
          avatar: map[SqliteUtil.columnUserAvatar],
          isRead: true,
        ),
      );
    }
    chatRoomLogic.update();

    ///延迟计算最大滑动距离，配合resizeToAvoidBottomInset，键盘顶住布局
    Future.delayed(const Duration(milliseconds: 500), () {
      double max = chatRoomLogic
          .state.messageListScrollController.position.maxScrollExtent;
      chatRoomLogic.state.messageListScrollController.animateTo(
        max,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
    });

    ///进入聊天室
    chatRoomLogic.state.isStay = true;
    Get.toNamed(ChatRoomView.routeName);
  }

  ///保存记录到本地数据库
  saveMessageToDatabase(ReceiveDataModel receiveData) {
    SqliteUtil.insertTable(
      tableName: SqliteUtil.tableWechatMessageHistory,
      map: {
        SqliteUtil.columnSenderId: receiveData.sender,
        SqliteUtil.columnReceiverId: receiveData.receiver,
        SqliteUtil.columnMessageContent: receiveData.msg,
        SqliteUtil.columnMessageDate: receiveData.date,
        SqliteUtil.columnUserAvatar: receiveData.avatar,
        SqliteUtil.columnMessageReadTime: 0, //读消息的时间
      },
    );
  }

  ///拉取所有本地消息（同时统计所有未读消息）
  Future<void> getMessageHistoryFromDatabase() async {
    final messageList = await SqliteUtil.queryTable(
      tableName: SqliteUtil.tableWechatMessageHistory,
      orderBy: SqliteUtil.columnMessageDate,
    );
    state.messageHistoryList.clear();
    state.messageHistoryList.addAll(messageList);
    Map<String, int> unReadMessageMap = {};
    for (Map map in messageList) {
      bool isRead = judgeReadState(map[SqliteUtil.columnMessageDate],
          map[SqliteUtil.columnMessageReadTime]);
      state.latestMsgData[map[SqliteUtil.columnSenderId]] = ReceiveDataModel(
        sender: map[SqliteUtil.columnSenderId],
        receiver: map[SqliteUtil.columnReceiverId],
        msg: map[SqliteUtil.columnMessageContent],
        date: map[SqliteUtil.columnMessageDate],
        avatar: map[SqliteUtil.columnUserAvatar],
        isRead: isRead,
      );

      ///记录未读消息
      if (!isRead) {
        String senderId = map[SqliteUtil.columnSenderId];
        int? value = unReadMessageMap[senderId];
        if (value != null) {
          unReadMessageMap[senderId] = value + 1;
        } else {
          unReadMessageMap[senderId] = 1;
        }
      }
    }
    MessageChangeNotifier.getInstance()
        .initLocalUnreadMessage(unReadMessageMap);
    update();
  }

  bool judgeReadState(int receiveDate, int? readDate) {
    if (readDate == null) return false;
    return receiveDate <= readDate;
  }

  ///连接服务
  connectToServer() {
    state.webSocketChannel = IOWebSocketChannel.connect(
      Uri.parse(WebSocketUtil.wssUrl),
      pingInterval: const Duration(seconds: 10),
      headers: {
        "token": "{\"userId\": \"${state.isLoginUserId}\"}",
      },
    );

    ///监听消息接受
    state.webSocketChannel.stream.listen((event) {
      // print(event);
      try {
        ///将消息发送给聊天室
        final receiveData = ReceiveDataModel.fromJson(json.decode(event));
        ChatRoomLogic chatRoomLogic = Get.find<ChatRoomLogic>();
        chatRoomLogic.state.chatRoomMessageList.add(receiveData);
        chatRoomLogic.update();

        ///存储信息到本地(同时更新已读未读状态)
        if (chatRoomLogic.state.isStay) {
          if (chatRoomLogic.state.userModel != null) {
            String chatRoomUserId = chatRoomLogic.state.userModel!.userId!;
            if (chatRoomUserId == receiveData.sender) {
              receiveData.isRead = true;
            }
          }
        } else {
          ///更新未读消息数量
          MessageChangeNotifier.getInstance()
              .receiveMessage(receiveData.sender);
        }
        saveMessageToDatabase(receiveData);
        state.latestMsgData[receiveData.sender] = receiveData;
        update();

        ///延迟计算最大滑动距离
        if (chatRoomLogic.state.messageListScrollController.hasClients) {
          Future.delayed(const Duration(milliseconds: 500)).then((value) {
            double max = chatRoomLogic
                .state.messageListScrollController.position.maxScrollExtent;
            chatRoomLogic.state.messageListScrollController.animateTo(
              max,
              duration: const Duration(milliseconds: 200),
              curve: Curves.linear,
            );
          });
        }
      } catch (e) {
        if (kDebugMode) {
          print("$e-$event");
        }
      }
    });
  }
}
