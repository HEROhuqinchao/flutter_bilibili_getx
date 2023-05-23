import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../my_we_chat_state.dart';

class ChatRoomState {
  late UserModel userModel;
  late String inputText;
  late WebSocketChannel webSocketChannel;
  late List<ReceiveDataModel> chatRoomMessageList;
  late ScrollController messageListScrollController;
  late TextEditingController textEditingController;

  ///登录人的id
  late String loginUserId;
  late FocusNode focusNode;

  ChatRoomState() {
    inputText = "";
    chatRoomMessageList = [
      ReceiveDataModel(
          sender: 'user002',
          msg:
              '模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user001',
          msg:
          '模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息',
          date: '10001',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg:
              '模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg:
              '模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
    ];
    messageListScrollController = ScrollController();
    textEditingController = TextEditingController();
    loginUserId = "user001";
    focusNode = FocusNode();
  }
}
