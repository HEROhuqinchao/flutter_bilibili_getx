import 'package:get/get.dart';

import '../mini_window/mini_window_logic.dart';
import 'video_player_example_logic.dart';

class VideoPlayerExampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoPlayerExampleLogic());
    Get.lazyPut(() => MiniWindowLogic());
  }
}
