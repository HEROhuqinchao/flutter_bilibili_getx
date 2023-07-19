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
import 'wechat_main_state.dart';

class WechatMainLogic extends GetxController {
  final WechatMainState state = WechatMainState();

  ///初始化数据
  iniWeChat() {
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
    chatRoomLogic.state.chatRoomMessageList.clear();
    for (Map map in messageList) {
      chatRoomLogic.state.chatRoomMessageList.add(
        ReceiveDataModel(
          sender: map[SqliteUtil.columnSenderId],
          receiver: map[SqliteUtil.columnReceiverId],
          msg: map[SqliteUtil.columnMessageContent],
          date: map[SqliteUtil.columnMessageDate],
          avatar: map[SqliteUtil.columnUserAvatar],
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
      },
    );
  }

  ///拉取所有本地消息
  Future<void> getMessageHistoryFromDatabase() async {
    final messageList = await SqliteUtil.queryTable(
      tableName: SqliteUtil.tableWechatMessageHistory,
      orderBy: SqliteUtil.columnMessageDate,
    );
    state.messageHistoryList.clear();
    state.messageHistoryList.addAll(messageList);
    for (Map map in messageList) {
      state.latestMsgData[map[SqliteUtil.columnSenderId]] = ReceiveDataModel(
        sender: map[SqliteUtil.columnSenderId],
        receiver: map[SqliteUtil.columnReceiverId],
        msg: map[SqliteUtil.columnMessageContent],
        date: map[SqliteUtil.columnMessageDate],
        avatar: map[SqliteUtil.columnUserAvatar],
      );
    }
    update();
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
        final receiveData = ReceiveDataModel.fromJson(json.decode(event));
        saveMessageToDatabase(receiveData);
        state.latestMsgData[receiveData.sender] = receiveData;
        update();

        ///将消息发送给聊天室
        ChatRoomLogic chatRoomLogic = Get.find<ChatRoomLogic>();
        chatRoomLogic.state.chatRoomMessageList.add(receiveData);
        chatRoomLogic.update();

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
