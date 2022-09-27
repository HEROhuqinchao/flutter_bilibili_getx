import 'package:get/get.dart';

import 'pre_edit_video_logic.dart';

class PreEditVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PreEditVideoLogic());
  }
}
