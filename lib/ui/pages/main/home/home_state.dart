import 'package:get/get.dart';

import '../../../../core/shared_preferences/bilibili_shared_preference.dart';
import '../../../../core/shared_preferences/shared_preference_util.dart';

class HomeState {
  ///是否同意青少年模式
  late bool tempTeenagerMode;
  ///是否同意用户协议
  late bool tempUserAgreement;
  ///用户头像
  late String userLogo;
  ///是否登录
  late bool isLogin;

  HomeState() {
    tempTeenagerMode = false;
    ///判断本地协议是否同意
    tempUserAgreement = SharedPreferenceUtil.getBool(
        BilibiliSharedPreference.appUserAgreementPrivatePolicy)!;
    userLogo = "";
    isLogin = SharedPreferenceUtil.getBool(
        BilibiliSharedPreference.isLogin)!;
  }
}
