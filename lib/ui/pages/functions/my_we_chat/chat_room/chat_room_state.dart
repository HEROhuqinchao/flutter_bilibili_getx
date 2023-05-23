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
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
      ReceiveDataModel(
          sender: 'user002',
          msg: '模拟消息',
          date: '10002',
          avatar: 'https://static.runoob.com/images/demo/demo2.jpg'),
    ];
    messageListScrollController = ScrollController();
    textEditingController = TextEditingController();
    loginUserId = "user001";
    focusNode = FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        ///延迟计算最大滑动距离，配合resizeToAvoidBottomInset，键盘顶住布局
        Future.delayed(Duration(milliseconds: 500), () {
          double max = messageListScrollController.position.maxScrollExtent;
          messageListScrollController.animateTo(
            max,
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        });
      }
    });
  }
}
