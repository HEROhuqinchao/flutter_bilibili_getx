import 'package:flutter/cupertino.dart';
import 'package:flutter_floating/floating/floating.dart';
import 'package:flutter_floating/floating/manager/floating_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class MiniWindowState {
  late VideoPlayerController videoPlayerController;
  late FloatingManager floatingManager;
  late Floating floating;
  late bool isPlaying;

  MiniWindowState() {
    videoPlayerController = VideoPlayerController.network(
        "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4");
    floatingManager = FloatingManager();
    isPlaying = false;
  }
}
