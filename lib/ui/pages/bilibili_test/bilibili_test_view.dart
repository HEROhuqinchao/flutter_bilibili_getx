import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bilibili_test_logic.dart';

///只用于测试的界面!!!!
///到main.dart切换初始路由
class BilibiliTestScreen extends StatelessWidget {
  final logic = Get.find<BilibiliTestLogic>();
  final state = Get.find<BilibiliTestLogic>().state;
  static String routeName = "/bilibili_test";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BilibiliTestLogic>(
      builder: (logic) {
        return Scaffold(
          backgroundColor: Colors.blueGrey,
          body: Center(
            child: Text("这是界面B"),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              logic.createFloatingView(context);
            },
            child: Text("小窗"),
          ),
        );
      },
    );
  }
}
