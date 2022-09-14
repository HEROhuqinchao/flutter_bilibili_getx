import 'dart:async';

import 'package:brightness_volume/brightness_volume.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui' as ui;

class BilibiliVideoPlayerState {
  late VideoPlayerController videoPlayerController;
  late bool showBottomBar;

  ///进度条顶端图片
  late ui.Image image;

  ///是否在播放
  late bool controllerWasPlaying;

  ///是否在拖动
  late bool dragging;

  ///隐藏计时器
  late Timer hideTimer;

  ///视频最新的状态
  late VideoPlayerValue latestValue;

  ///是否为全屏显示
  late bool isFullScreen;

  ///是否显示视频进度
  late bool videoProgress;

  ///是否显示视频音量
  late bool videoVolume;

  ///是否显示视频亮度
  late bool videoBrightness;

  ///当前音量数值
  double volume = 0.0;

  ///当前亮度数值
  double brightness = 0.0;

  BilibiliVideoPlayerState() {
    showBottomBar = true;
    controllerWasPlaying = false;
    dragging = false;
    isFullScreen = false;
    hideTimer = Timer(const Duration(microseconds: 4000), () {});
    videoProgress = false;
    videoVolume = false;
    videoBrightness = false;
  }
}
