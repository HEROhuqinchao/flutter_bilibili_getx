import 'package:bilibili_getx/core/shared_preferences/bilibili_shared_preference.dart';
import 'package:bilibili_getx/core/shared_preferences/shared_preference_util.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_main/wechat_main_logic.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_mine/wechat_mine_logic.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/wechat_login/wechat_login_view.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../../core/service/request/wechat_request.dart';
import 'my_we_chat_state.dart';

class MyWeChatLogic extends GetxController {
  final MyWeChatState state = MyWeChatState();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    loginWechat();
    super.onReady();
  }

  @override
  void onClose() {
    state.streamController.close();
    super.onClose();
  }

  updateCurrentIndex(int index) {
    state.currentIndex = index;
    update();
  }

  ///登录账户
  loginWechat() {
    String wechatTel =
        SharedPreferenceUtil.getString(BilibiliSharedPreference.wechatTel) ??
            "";
    String wechatPassword = SharedPreferenceUtil.getString(
            BilibiliSharedPreference.wechatPassword) ??
        "";
    if (wechatTel.isNotEmpty && wechatPassword.isNotEmpty) {
      Map<String, dynamic> params = {
        "tel": wechatTel,
        "password": wechatPassword,
      };
      WechatRequest().loginUser(params).then((value) {
        if (value.code == 0) {
          ///初始化子页面数据
          WechatMainLogic wechatMainLogic = Get.find<WechatMainLogic>();
          wechatMainLogic.state.isLoginUserId = value.data!.userId!;
          WechatMineLogic wechatMineLogic = Get.find<WechatMineLogic>();
          wechatMineLogic.state.wechatLoginData = value.data!;
          state.loading = false;
          update();
        }
        SmartDialog.showToast(value.message!);
      });
    } else {
      Get.toNamed(WechatLoginView.routeName);
    }
  }
}
