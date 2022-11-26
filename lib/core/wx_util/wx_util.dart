// 接入微信，准备实现分享到微信的功能，支付的功能，微信授权登录功能（微信开放平台申请移动应用申请不下来）
// https://zhuanlan.zhihu.com/p/454111586
// https://github.com/OpenFlutter/fluwx/blob/master/doc/SHARE.md
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluwx_no_pay/fluwx_no_pay.dart';

class WxUtil {
  ///注册微信API
  static void wxRegisterWxApi() {
    registerWxApi(
        appId: "wx30d603cbdb550098",
        universalLink: "https://your.univerallink.com/link/");
  }

  ///监听回调结果
  static void wxDebugResult() {
    weChatResponseEventHandler.listen((res) {
      if (res is WeChatPaymentResponse) {
        print("监听返回结果");
        print(res.errStr);
      }
    });
  }

  ///打开微信支付
  Future<void> openWxPay() async {
    bool isInstalled = await isWeChatInstalled;
    if (!isInstalled) {
      SmartDialog.showToast("请先安装微信");
      return;
    }
    payWithWeChat(
      appId: "wx30d603cbdb550098",
      partnerId: "partnerId",
      prepayId: "prepayId",
      packageValue: "packageValue",
      nonceStr: "nonceStr",
      timeStamp: 1000000,
      sign: "sign",
    );
    weChatResponseEventHandler.listen((event) {
      if (event.isSuccessful) {
        SmartDialog.showToast("微信支付成功");
      } else {
        SmartDialog.showToast(event.errStr ?? "微信支付失败");
      }
    });
  }

  ///分享文本至微信
  static void shareWx() {
    shareToWeChat(
        WeChatShareTextModel("你好，我是Flutter", scene: WeChatScene.SESSION));
  }

  ///分享图片
  static void shareImage() async {
    String imagePath;
  }

  ///跳转至小程序
  static void go2WechatMiniProgram() {
    launchWeChatMiniProgram(
        username: "wxe62ff5986cbf5a5d",
        path: "pages/main/main",
        miniProgramType: WXMiniProgramType.RELEASE);
  }

  ///weChatShareWebPageModelModel
  static void weChatShareWebPageModelModel() {
    var model = WeChatShareWebPageModel(
      "www.baidu.com",
      title: "百度",
      scene: WeChatScene.SESSION,
      thumbnail: WeChatImage.network(
          "https://ts1.cn.mm.bing.net/th/id/R-C.171e8fe1aa1544a1868ab710eed82d82?rik=FLPxvVVL9C9bnQ&riu=http%3a%2f%2fwww.pp3.cn%2fuploads%2fallimg%2f200710%2f14-200G00Z321.jpg&ehk=Lb0IHCCZIdqYQOi28m%2borU8c1ARGbTEC%2f8WYzfwRuHo%3d&risl=&pid=ImgRaw&r=0"),
    );
    shareToWeChat(model);
  }

  ///weChatShareTextModel
  static void weChatShareTextModel() {
    var model = WeChatShareTextModel("www.baidu.com",
        title: "百度", scene: WeChatScene.SESSION, description: "这是一个文本分享");
    shareToWeChat(model);
  }

  ///WeChatShareMiniProgramModel
  static void weChatShareMiniProgramModel() {
    var model = WeChatShareMiniProgramModel(
        webPageUrl: "pages/main/main", userName: "wxe62ff5986cbf5a5d");
    shareToWeChat(model);
  }

  ///weChatShareImageModel
  static void weChatShareImageModel() {
    var model = WeChatShareImageModel(
      WeChatImage.network(
          "https://ts1.cn.mm.bing.net/th/id/R-C.171e8fe1aa1544a1868ab710eed82d82?rik=FLPxvVVL9C9bnQ&riu=http%3a%2f%2fwww.pp3.cn%2fuploads%2fallimg%2f200710%2f14-200G00Z321.jpg&ehk=Lb0IHCCZIdqYQOi28m%2borU8c1ARGbTEC%2f8WYzfwRuHo%3d&risl=&pid=ImgRaw&r=0"),
    );
    shareToWeChat(model);
  }

  ///weChatShareMusicModel
  static void weChatShareMusicModel() {
    var model = WeChatShareMusicModel(
        musicUrl:
            "http://m701.music.126.net/20221126094914/f6974087e4d809f91c012e543ac28566/jdyyaac/obj/w5rDlsOJwrLDjj7CmsOj/21901549053/d71a/478e/3df5/856f3f94d4e27c4a735c21fc3ce24da2.m4a");
    shareToWeChat(model);
  }

  ///weChatShareVideoModel
  static void weChatShareVideoModel() {
    var model = WeChatShareVideoModel(
        videoUrl:
        "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4");
    shareToWeChat(model);
  }

  ///weChatShareFileModel
  static void weChatShareFileModel() {
    var model = WeChatShareFileModel(
        WeChatFile.network("https://ts1.cn.mm.bing.net/th/id/R-C.466bb61cd7cf4e8b7d9cdf645add1d6e?rik=YRZKRLNWLutoZA&riu=http%3a%2f%2f222.186.12.239%3a10010%2fwmxs_161205%2f002.jpg&ehk=WEy01YhyfNzzQNe1oIqxwgbTnzY7dMfmZZHkqpZB5WI%3d&risl=&pid=ImgRaw&r=0"),);
    shareToWeChat(model);
  }
}
