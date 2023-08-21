import 'dart:async';

import 'package:flutter_floating/floating/floating.dart';
import 'package:video_player/video_player.dart';

class MiniWindowState {
  late VideoPlayerController videoPlayerController;
  late Floating floating;
  late bool isPlaying;

  ///是否显示操作按钮
  late bool showButtons;
  late Timer hideTimer;

  MiniWindowState() {
    isPlaying = false;
    hideTimer = Timer(const Duration(seconds: 3000), () {});
    showButtons = true;
  }
}
