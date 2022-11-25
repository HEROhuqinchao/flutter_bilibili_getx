import 'package:bilibili_getx/core/wx_util/wx_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'wx_share_logic.dart';

class WxShareView extends StatelessWidget {
  static const String routeName = "/wx_share";
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<WxShareLogic>();
    final state = Get.find<WxShareLogic>().state;

    return Scaffold(
      body: Center(
        child: Text("微信分享"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          WxUtil.shareWx();
        },
        child: Text("分享"),
      ),
    );
  }
}
