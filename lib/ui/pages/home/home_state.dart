class HomeState {
  ///是否同意青少年模式
  late bool tempTeenagerMode;
  ///是否同意用户协议
  late bool tempUserAgreement;
  ///用户头像
  late String userLogo;
  HomeState() {
    tempTeenagerMode = false;
    tempUserAgreement = false;
    userLogo = "";
  }
}
