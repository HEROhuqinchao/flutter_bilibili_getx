import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'we_chat_contacts_logic.dart';

class WeChatContactsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(WeChatContactsLogic());
    final state = Get.find<WeChatContactsLogic>().state;

    return Container();
  }
}
