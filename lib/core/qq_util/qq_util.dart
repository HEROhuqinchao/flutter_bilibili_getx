import 'dart:async';
import 'dart:io';
import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:tencent_kit/tencent_kit.dart';

///参考 https://github.com/RxReader/tencent_kit
class QQUtil {
  ///3.1.0版本之后的授予权限
  static void initPermissionGranted() async {
    await Tencent.instance.setIsPermissionGranted(granted: true);
  }

  ///注册APP
  static void registerApp() async {
    await Tencent.instance.registerApp(appId: Constant.tencentAppId);
  }

  ///检测是否安装QQ
  static Future<String> checkQQInstalled() async {
    final String content = '${await Tencent.instance.isQQInstalled()}';
    return content;
  }

  ///QQ授权登录
  static void tencentLogin() async {
    Tencent.instance.login(
      scope: <String>[TencentScope.GET_SIMPLE_USERINFO],
    );
  }

  ///获取用户信息
  static void fetchUserInfo() async {}

  ///分享说说
  static void shareShuoShuo() async {
    Tencent.instance.shareMood(
      scene: TencentScene.SCENE_QZONE,
      summary: '分享说明Summary',
    );
  }

  ///文本分享
  static void shareText() async {
    Tencent.instance.shareText(
      scene: TencentScene.SCENE_QQ,
      summary: '分享文本',
    );
  }

  ///分享图片
  static void sharePhotos() async {
    final File file = await DefaultCacheManager()
        .getSingleFile('https://www.baidu.com/img/bd_logo1.png?where=super');
    await Tencent.instance.shareImage(
      scene: TencentScene.SCENE_QQ,
      imageUri: Uri.file(file.path),
    );
  }

  ///网页分享
  static void shareWebPage() async {
    await Tencent.instance.shareWebpage(
      scene: TencentScene.SCENE_QQ,
      title: '网页分享',
      targetUrl: 'https://www.bilibili.com',
    );
  }
}
