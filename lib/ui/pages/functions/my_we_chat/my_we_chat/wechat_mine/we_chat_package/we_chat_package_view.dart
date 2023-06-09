import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'we_chat_package_logic.dart';

class WeChatPackageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logic = Get.put(WeChatPackageLogic());
    final state = Get.find<WeChatPackageLogic>().state;

    return Container();
  }
}
