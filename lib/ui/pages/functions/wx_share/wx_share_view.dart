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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
                onPressed: () {
                  WxUtil.shareWx();
                },
                child: Text("分享文本")),
            ElevatedButton(
                onPressed: () {
                  WxUtil.go2WechatMiniProgram();
                },
                child: Text("打开小程序")),
            ElevatedButton(
                onPressed: () {
                  WxUtil.weChatShareWebPageModelModel();
                },
                child: Text("weChatShareWebPageModelModel")),
            ElevatedButton(
                onPressed: () {
                  WxUtil.weChatShareTextModel();
                },
                child: Text("weChatShareTextModel")),
            ElevatedButton(
                onPressed: () {
                  WxUtil.weChatShareMiniProgramModel();
                },
                child: Text("weChatShareMiniProgramModel")),
            ElevatedButton(
                onPressed: () {
                  WxUtil.weChatShareImageModel();
                },
                child: Text("weChatShareImageModel")),
            ElevatedButton(
                onPressed: () {
                  WxUtil.weChatShareMusicModel();
                },
                child: Text("weChatShareMusicModel")),
            ElevatedButton(
                onPressed: () {
                  WxUtil.weChatShareVideoModel();
                },
                child: Text("weChatShareVideoModel")),
            ElevatedButton(
                onPressed: () {
                  WxUtil.weChatShareFileModel();
                },
                child: Text("weChatShareFileModel")),
            ElevatedButton(
                onPressed: () {
                  WxUtil.wechatShare2Favorite();
                },
                child: Text("wechatShare2Favorite")),
            ElevatedButton(
                onPressed: () {
                  WxUtil.wechatShare2TimeLine();
                },
                child: Text("wechatShare2TimeLine")),
          ],
        ),
      ),
    );
  }
}
