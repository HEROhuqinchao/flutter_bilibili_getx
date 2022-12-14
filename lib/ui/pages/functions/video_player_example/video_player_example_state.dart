import 'package:flutter_floating/floating/floating.dart';
import 'package:flutter_floating/floating/manager/floating_manager.dart';
import 'package:video_player/video_player.dart';

import '../mini_window/mini_window_view.dart';

class VideoPlayerExampleState {
  late VideoPlayerController videoPlayerController;
  late FloatingManager floatingManager;
  late Floating floating;
  late bool isMiniWindowPlay;

  VideoPlayerExampleState() {
    isMiniWindowPlay = false;
    videoPlayerController = VideoPlayerController.network(
        "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4");
    floatingManager = FloatingManager();
    floating = floatingManager.createFloating(
      '1',
      Floating(
        MiniWindowView(),
        isShowLog: false,
      ),
    );
  }
}
