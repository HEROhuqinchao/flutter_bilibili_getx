import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../core/qq_util/qq_util.dart';
import 'qq_share_logic.dart';

class QqShareView extends StatelessWidget {
  static String routeName = "/qq_share";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<QqShareLogic>();
    final state = Get.find<QqShareLogic>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text("分享至QQ"),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ElevatedButton(
            //     onPressed: () {
            //       QQUtil.shareText();
            //     },
            //     child: Text("分享文本")),
            // ElevatedButton(
            //     onPressed: () {
            //       QQUtil.shareShuoShuo();
            //     },
            //     child: Text("分享说说")),
            // ElevatedButton(
            //     onPressed: () {
            //       QQUtil.sharePhotos();
            //     },
            //     child: Text("分享图片")),
            // ElevatedButton(
            //     onPressed: () {
            //       QQUtil.shareWebPage();
            //     },
            //     child: Text("分享网址")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // QQUtil.checkQQInstalled().then((value) {
          //   if (value == true) {
          //     QQUtil.initPermissionGranted();
          //     QQUtil.registerApp();
          //   } else {
          //     SmartDialog.showToast("请先安装QQ");
          //   }
          // });
        },
      ),
    );
  }
}
