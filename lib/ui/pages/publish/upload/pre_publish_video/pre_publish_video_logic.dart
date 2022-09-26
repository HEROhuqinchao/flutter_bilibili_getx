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

  void checkTransshipment(value) {
    state.transshipment = value!;
    state.selfMade = !value;
    update();
  }

  void checkSelfMade(value) {
    state.selfMade = value!;
    state.transshipment = !value;
    update();
  }
}
