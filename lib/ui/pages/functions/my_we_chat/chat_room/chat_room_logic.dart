import 'dart:convert';

import 'package:flutter/animation.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../my_we_chat_state.dart';
import 'chat_room_state.dart';

class ChatRoomLogic extends GetxController {
  final ChatRoomState state = ChatRoomState();

  @override
  void onReady() {
    state.focusNode.addListener(() {
      if (state.focusNode.hasFocus) {
        ///延迟计算最大滑动距离，配合resizeToAvoidBottomInset，键盘顶住布局
        Future.delayed(Duration(milliseconds: 500), () {
          double max =
              state.messageListScrollController.position.maxScrollExtent;
          state.messageListScrollController.animateTo(
            max,
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
          );
        });
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    state.messageListScrollController.dispose();
    state.focusNode.dispose();
    super.onClose();
  }

  ///发送信息
  sendMessage() {
    if (state.inputText.isNotEmpty) {
      int sendTime = DateTime.now().millisecondsSinceEpoch;
      String data =
          "{\"users\": [\"${state.loginUserId}\",\"${state.userModel.userId}\"],"
          "\"msg\": \"${state.inputText}\","
          "\"date\": \"$sendTime\","
          "\"avatar\": \"https://static.runoob.com/images/demo/demo2.jpg\","
          "\"sender\": \"${state.loginUserId}\"}";
      state.webSocketChannel.sink.add(data);
      state.inputText = "";
      state.textEditingController.text = "";
      update();
    } else {
      SmartDialog.showToast("内容为空");
    }
  }

  updateInputText(String str) {
    state.inputText = str;
    update();
  }
}
