import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'chat_logic.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = "/chat";
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ChatLogic>();
    final state = Get.find<ChatLogic>().state;

    return Container();
  }
}
