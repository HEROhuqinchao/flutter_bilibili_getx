import 'package:get/get.dart';

import 'bilibili_video_player_full_screen_logic.dart';

class BilibiliVideoPlayerFullBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BilibiliVideoPlayerFullLogic());
  }
}
