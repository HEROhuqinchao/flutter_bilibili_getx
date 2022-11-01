import 'package:get/get.dart';

import 'animation_compoent_logic.dart';

class AnimationCompoentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AnimationCompoentLogic());
  }
}
