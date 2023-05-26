import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

import '../../../../core/web_socket_channel/web_socket_util.dart';
import 'chat_room/chat_room_logic.dart';
import 'chat_room/chat_room_view.dart';
import 'my_we_chat_state.dart';

class MyWeChatLogic extends GetxController {
  final MyWeChatState state = MyWeChatState();

  @override
  void onReady() {
    ///连接webSocket
    state.webSocketChannel = IOWebSocketChannel.connect(
      Uri.parse(WebSocketUtil.wssUrl),
      pingInterval: const Duration(seconds: 10),
      headers: {
        "token": "{\"userId\": \"user001\"}",
      },
    );
    ///监听消息接受
    state.webSocketChannel.stream.listen((event) {
      print(event);
      try {
        final receiveData = ReceiveDataModel.fromJson(json.decode(event));
        state.latestMsgData[receiveData.sender] = receiveData;
        update();

        ///将消息发送给聊天室
        ChatRoomLogic chatRoomLogic = Get.find<ChatRoomLogic>();
        // chatRoomLogic.state.chatRoomMessageList.insert(0, receiveData);
        chatRoomLogic.state.chatRoomMessageList.add(receiveData);
        chatRoomLogic.update();

        ///延迟计算最大滑动距离
        Future.delayed(Duration(milliseconds: 500)).then((value) {
          double max = chatRoomLogic
              .state.messageListScrollController.position.maxScrollExtent;
          chatRoomLogic.state.messageListScrollController.animateTo(
            max,
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        });
      } catch (e) {
        print(event);
        print(e);
      }
    });
    super.onReady();
  }

  ///进入聊天
  go2ChatRoom(int index) {
    ChatRoomLogic chatRoomLogic = Get.find<ChatRoomLogic>();
    chatRoomLogic.state.userModel = state.userList[index];
    chatRoomLogic.state.webSocketChannel = state.webSocketChannel;
    Get.toNamed(ChatRoomView.routeName);
  }
}
