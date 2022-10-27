import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'push_message_logic.dart';

class PushMessageScreen extends StatelessWidget {
  final logic = Get.find<PushMessageLogic>();
  final state = Get.find<PushMessageLogic>().state;
  static String routeName = "/push_message";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logic.settingPermission();
        },
      ),
    );
  }
}
