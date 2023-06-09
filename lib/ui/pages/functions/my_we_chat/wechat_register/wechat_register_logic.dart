import 'package:bilibili_getx/core/service/request/wechat_request.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/wechat_login/wechat_login_view.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/wechat_register/wechat_register_view.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'wechat_register_state.dart';

class WechatRegisterLogic extends GetxController {
  final WechatRegisterState state = WechatRegisterState();

  ///输入昵称
  updateUserName(String text) {
    state.userName = text;
    update();
  }

  ///输入电话号
  updateTel(String text) {
    state.tel = text;
    update();
  }

  ///输入密码
  updatePassword(String text) {
    state.password = text;
    update();
  }

  ///注册账号
  registerUser() {
    Map<String, dynamic> params = {
      "tel": state.tel,
      "userName": state.userName,
      "password": state.password,
    };
    if (state.tel.isNotEmpty &&
        state.userName.isNotEmpty &&
        state.password.isNotEmpty) {
      WechatRequest.registerUser(params).then((value) {
        if (value.code == 0) {
          Get.offAndToNamed(WechatLoginView.routeName);
        }
        SmartDialog.showToast(value.message!);
      });
    }
  }
}
