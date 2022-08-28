import 'package:bilibili_getx/ui/pages/video_play/video_play_logic.dart';
import 'package:get/get.dart';

import 'recommend_logic.dart';

class RecommendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecommendLogic());
    Get.lazyPut(() => VideoPlayLogic());
  }
}
