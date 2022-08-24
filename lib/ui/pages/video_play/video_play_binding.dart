import 'package:get/get.dart';

import 'video_play_logic.dart';

class VideoPlayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoPlayLogic());
  }
}
