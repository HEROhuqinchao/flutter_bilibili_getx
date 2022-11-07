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
      appBar: AppBar(
        title: Text("推送消息"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                logic.startService();
              },
              child: Text("开启后台任务"),
            ),
            ElevatedButton(
              onPressed: () {
                logic.startJPush();
              },
              child: Text("开启极光推送"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          logic.settingPermission();
        },
      ),
    );
  }
}
