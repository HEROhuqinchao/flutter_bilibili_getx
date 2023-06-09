import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'we_chat_service_logic.dart';

class WeChatServiceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(WeChatServiceLogic());
    final state = Get.find<WeChatServiceLogic>().state;

    return Container();
  }
}
