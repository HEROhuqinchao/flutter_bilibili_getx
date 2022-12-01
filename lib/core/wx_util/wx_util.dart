// 接入微信，准备实现分享到微信的功能，支付的功能，微信授权登录功能（微信开放平台申请移动应用申请不下来）
// https://zhuanlan.zhihu.com/p/454111586
// https://github.com/OpenFlutter/fluwx/blob/master/doc/SHARE.md
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:fluwx_no_pay/fluwx_no_pay.dart';

const wechatThumbImage =
    "https://ts1.cn.mm.bing.net/th/id/R-C.171e8fe1aa1544a1868ab710eed82d82?rik=FLPxvVVL9C9bnQ&riu=http%3a%2f%2fwww.pp3.cn%2fuploads%2fallimg%2f200710%2f14-200G00Z321.jpg&ehk=Lb0IHCCZIdqYQOi28m%2borU8c1ARGbTEC%2f8WYzfwRuHo%3d&risl=&pid=ImgRaw&r=0";
const wechatShareImage =
    "https://tse1-mm.cn.bing.net/th/id/OIP-C.zK_D_msJjzmYsCjccOaT5wHaNK?pid=ImgDet&rs=1";
const wechatShareMp3 =
    "http://downsc.chinaz.net/Files/DownLoad/sound1/201906/11582.mp3";
const wechatShareVideo = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";
const wechatShareFile = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4";

///微信分享、跳转小程序(需要关联）
class WxUtil {
  ///注册微信API
  static void wxRegisterWxApi() {
    registerWxApi(
        appId: "wx86eb77cb06e94932",
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
        username: "gh_03fb2e5e6c78",
        path: "pages/main/main",
        miniProgramType: WXMiniProgramType.PREVIEW);
  }

  ///weChatShareWebPageModelModel
  static void weChatShareWebPageModelModel() {
    var model = WeChatShareWebPageModel(
      "www.baidu.com",
      title: "百度",
      scene: WeChatScene.SESSION,
      thumbnail: WeChatImage.network(wechatThumbImage),
    );
    shareToWeChat(model);
  }

  ///weChatShareTextModel
  static void weChatShareTextModel() {
    var model = WeChatShareTextModel(
      "www.baidu.com",
      title: "百度",
      scene: WeChatScene.SESSION,
      description: "这是一个链接分享",
    );
    shareToWeChat(model);
  }

  ///WeChatShareMiniProgramModel
  static void weChatShareMiniProgramModel() {
    var model = WeChatShareMiniProgramModel(
      path: "pages/poem/poem",
      userName: "gh_03fb2e5e6c78",
      thumbnail: WeChatImage.network(wechatThumbImage),
      title: "小程序",
      description: "小程序描述",
      webPageUrl: "www.baidu.com",
      miniProgramType: WXMiniProgramType.PREVIEW,
    );
    shareToWeChat(model);
  }

  ///weChatShareImageModel
  static void weChatShareImageModel() {
    var model = WeChatShareImageModel(
      WeChatImage.network(wechatShareImage),
      thumbnail: WeChatImage.network(wechatThumbImage),
      title: "图片",
      description: "图片描述",
    );
    shareToWeChat(model);
  }

  ///weChatShareMusicModel
  static void weChatShareMusicModel() {
    var model = WeChatShareMusicModel(
      musicUrl: wechatShareMp3,
      thumbnail: WeChatImage.network(wechatThumbImage),
      title: "音乐",
      description: "音乐描述",
    );
    shareToWeChat(model);
  }

  ///weChatShareVideoModel
  static void weChatShareVideoModel() {
    var model = WeChatShareVideoModel(
      videoUrl: wechatShareVideo,
      thumbnail: WeChatImage.network(wechatThumbImage),
      title: "视频",
      description: "视频描述",
    );
    shareToWeChat(model);
  }

  ///weChatShareFileModel
  static void weChatShareFileModel() {
    var model = WeChatShareFileModel(
      title: "一个文件",
      WeChatFile.network(wechatShareFile),
      thumbnail: WeChatImage.network(wechatThumbImage),
    );
    shareToWeChat(model);
  }

  static void wechatShare2Favorite() {
    var model = WeChatShareTextModel(
      "www.baidu.com",
      title: "百度",
      scene: WeChatScene.FAVORITE,
      description: "这是一个链接分享",
    );
    shareToWeChat(model);
  }

  static void wechatShare2TimeLine() {
    var model = WeChatShareTextModel(
      "www.baidu.com",
      title: "百度",
      scene: WeChatScene.TIMELINE,
      description: "这是一个链接分享",
    );
    shareToWeChat(model);
  }
}
