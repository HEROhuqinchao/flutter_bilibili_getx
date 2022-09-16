import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'bilibili_video_player_full_screen_state.dart';

class BilibiliVideoPlayerFullLogic extends GetxController {
  final BilibiliVideoPlayerFullState state = BilibiliVideoPlayerFullState();

  @override
  void onClose() {
    state.controller.dispose();
    super.onClose();
  }

  fetchVideoController(controller) {
    state.controller = controller;
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
  }
}
