import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui' as ui;
import '../../../shared/math_compute.dart';

class BilibiliVideoPlayerState {
  ///是否正在加载视频
  late bool isLoadingVideo;

  ///视频控制器
  late VideoPlayerController videoPlayerController;

  ///是否显示底部的工具栏
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

  late List<DanMuRouteModel> danMuRouteList;
  late List<List<Widget>> danMuChildren;
  late List<int> v;

  ///弹幕速度
  late List<double> routeMaxLength;
  late double nowPosition;
  late int danMuPackageNum;
  late List<Widget> danMuWidgets;
  late List<Duration> speedList;
  late int danMuRouteAmount;

  BilibiliVideoPlayerState() {
    isLoadingVideo = true;
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

    nowPosition = 0;
    danMuPackageNum = 0;
    danMuRouteAmount = 6;
    v = [];
    danMuRouteList = [];
    danMuChildren = [];
    routeMaxLength = [];
    for (var i = 0; i < danMuRouteAmount; i++) {
      ///生成随机速度
      v.add(nextIntRange(50, 80));

      ///初始化轨道对象
      ScrollController scrollController = ScrollController();
      danMuRouteList.add(DanMuRouteModel(
          velocity: v[i], scrollController: scrollController, show: true));

      ///初始化单条轨道中的弹幕
      List<Widget> danMuChild = [];
      danMuChildren.add(danMuChild);

      ///轨道的最大长度
      routeMaxLength.add(0);
    }

    ///弹幕轨道控件
    danMuWidgets = [];
  }
}

///弹幕轨道模型
class DanMuRouteModel {
  int velocity;
  ScrollController scrollController;
  bool show;

  DanMuRouteModel({
    required this.velocity,
    required this.scrollController,
    required this.show,
  });
}
