import 'package:flutter_floating/floating/floating.dart';
import 'package:flutter_floating/floating/manager/floating_manager.dart';
import 'package:video_player/video_player.dart';

class BilibiliTestState {
  ///浮动窗口
  late FloatingManager floatingManager;
  late Floating floatingOne;

  ///视频控件
  late VideoPlayerController controller;

  BilibiliTestState() {
    floatingManager = FloatingManager();
    controller = VideoPlayerController.network(
        "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
      ..initialize().then((value) {});
  }
}
