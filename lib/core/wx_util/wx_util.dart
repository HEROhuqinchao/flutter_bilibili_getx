// 接入微信，准备实现分享到微信的功能，支付的功能，微信授权登录功能（微信开放平台申请移动应用申请不下来）
// https://zhuanlan.zhihu.com/p/454111586
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluwx_no_pay/fluwx_no_pay.dart';

class WxUtil {
  ///注册微信API
  static void wxRegisterWxApi() {
    registerWxApi(
        appId: "wxd930ea5d5a228f5f",
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
      appId: "appId",
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

  void wxImageUtil() {
    // fluwx.WeChatImage.network(String source, {String suffix});
    // fluwx.WeChatImage.file(File source, {String suffix = ".jpeg"});
    // fluwx.WeChatImage.asset(String source, {String suffix});
    // fluwx.WeChatImage.binary(Uint8List source, {String suffix = ".jpeg"});
  }
  
  static void shareWx() {
    shareToWeChat(WeChatShareTextModel("source text", scene: WeChatScene.SESSION));
  }

  static void shareImage() async{
    String imagePath;

  }
}
