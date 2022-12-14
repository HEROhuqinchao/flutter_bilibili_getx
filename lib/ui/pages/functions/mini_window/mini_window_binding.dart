import 'package:bilibili_getx/ui/pages/functions/video_player_example/video_player_example_logic.dart';
import 'package:get/get.dart';

import 'mini_window_logic.dart';

class MiniWindowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MiniWindowLogic());
    Get.lazyPut(() => VideoPlayerExampleLogic());
  }
}
