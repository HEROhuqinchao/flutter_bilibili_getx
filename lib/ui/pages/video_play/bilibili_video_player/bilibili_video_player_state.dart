import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui' as ui;

import '../../../../core/model/dan_mu_model_02.dart';

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

  ///是否为全屏显示
  late bool isFullScreen;

  ///是否显示视频进度
  late bool videoProgress;

  ///是否显示视频音量
  late bool videoVolume;

  ///是否显示视频亮度
  late bool videoBrightness;

  ///当前音量数值
  late double volume;

  ///当前亮度数值
  late double brightness;

  late ScrollController scrollController;
  late double nowPosition;
  late int danMuPackageNum;
  late List<Widget> danMuChildren;
  late double v;
  late double maxLength;


  BilibiliVideoPlayerState() {
    showBottomBar = true;
    controllerWasPlaying = false;
    dragging = false;
    isFullScreen = false;
    hideTimer = Timer(const Duration(microseconds: 4000), () {});
    videoProgress = false;
    videoVolume = false;
    videoBrightness = false;
    volume = 0.0;
    brightness = 0.0;
    scrollController = ScrollController();
    nowPosition = 0;
    danMuPackageNum = 0;
    danMuChildren = [];
    v = 100;
    maxLength = 0;
  }
}
