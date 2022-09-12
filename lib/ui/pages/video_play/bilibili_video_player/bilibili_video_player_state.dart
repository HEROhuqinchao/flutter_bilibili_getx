import 'dart:async';

import 'package:video_player/video_player.dart';
import 'dart:ui' as ui;

class BilibiliVideoPlayerState {
  late VideoPlayerController videoPlayerController;
  late bool showBottomBar;
  ///进度条顶端图片
  late ui.Image image;
  late bool controllerWasPlaying;
  late bool dragging;
  late Timer hideTimer;
  late VideoPlayerValue latestValue;
  late bool isFullScreen;

  BilibiliVideoPlayerState() {
    showBottomBar = true;
    controllerWasPlaying = false;
    dragging = false;
    isFullScreen = false;
  }
}
