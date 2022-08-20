import '../../../core/model/account_mine.dart';

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
    tempUserAgreement = false;
    userLogo = "";
    isLogin = false;
  }
}
