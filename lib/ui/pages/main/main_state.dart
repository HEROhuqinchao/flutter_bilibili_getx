class MainState {
  ///当前下标
  late int currentIndex;
  ///是否同意青少年模式
  late bool tempTeenagerMode;
  ///是否同意用户协议
  late bool tempUserAgreement;
  MainState() {
    currentIndex = 0;
    tempTeenagerMode = false;
    tempUserAgreement = false;
  }
}
