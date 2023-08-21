import 'package:get/get.dart';

import 'animation_study_logic.dart';

class AnimationStudyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnimationStudyLogic());
  }
}
