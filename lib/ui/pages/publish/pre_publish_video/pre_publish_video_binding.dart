import 'package:get/get.dart';

import 'pre_publish_video_logic.dart';

class PrePublishVideoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrePublishVideoLogic());
  }
}
