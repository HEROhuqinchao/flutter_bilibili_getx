import 'package:bilibili_getx/core/service/request/wechat_request.dart';
import 'package:bilibili_getx/core/shared_preferences/bilibili_shared_preference.dart';
import 'package:bilibili_getx/core/shared_preferences/shared_preference_util.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_mine/wechat_mine_logic.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../my_we_chat/my_we_chat_logic.dart';
import '../my_we_chat/my_we_chat_view.dart';
import '../my_we_chat/wechat_main/wechat_main_logic.dart';
import 'wechat_login_state.dart';

class WechatLoginLogic extends GetxController {
  final WechatLoginState state = WechatLoginState();

  ///登录账户
  loginWechat() {
    Map<String, dynamic> params = {
      "tel": state.tel,
      "password": state.password,
    };
    WechatRequest().loginUser(params).then((value) {
      if (value.code == 0) {
        ///初始化子页面数据
        WechatMainLogic wechatMainLogic = Get.find<WechatMainLogic>();
        wechatMainLogic.state.isLoginUserId = value.data!.userId!;
        WechatMineLogic wechatMineLogic = Get.find<WechatMineLogic>();
        wechatMineLogic.state.wechatLoginData = value.data!;
        MyWeChatLogic myWeChatLogic = Get.find<MyWeChatLogic>();
        myWeChatLogic.state.loading = false;
        ///保存密码和账号
        SharedPreferenceUtil.setString(
            BilibiliSharedPreference.wechatTel, state.tel);
        SharedPreferenceUtil.setString(
            BilibiliSharedPreference.wechatPassword, state.password);
        Get.toNamed(MyWeChatView.routeName);
      }
      SmartDialog.showToast(value.message!);
    });
  }

  ///电话号
  updateTel(String value) {
    state.tel = value;
    update();
  }

  ///密码
  updatePassword(String value) {
    state.password = value;
    update();
  }
}
