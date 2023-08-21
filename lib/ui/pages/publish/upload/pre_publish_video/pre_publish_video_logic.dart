import 'package:get/get.dart';

import 'pre_publish_video_state.dart';

class PrePublishVideoLogic extends GetxController {
  final PrePublishVideoState state = PrePublishVideoState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void checkAgreePolicy(value) {
    state.agreePolicy = value!;
    update();
  }

  void checkTransshipment() {
    state.transshipment = true;
    state.selfMade = false;
    update();
  }

  void checkSelfMade() {
    state.selfMade = true;
    state.transshipment = false;
    update();
  }
}
