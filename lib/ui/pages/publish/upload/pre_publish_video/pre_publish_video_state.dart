class PrePublishVideoState {
  ///是否自制
  late bool selfMade;
  late bool transshipment;
  ///是否同意协议
  late bool agreePolicy;
  PrePublishVideoState() {
    selfMade = false;
    transshipment = false;
    agreePolicy = false;
  }
}
