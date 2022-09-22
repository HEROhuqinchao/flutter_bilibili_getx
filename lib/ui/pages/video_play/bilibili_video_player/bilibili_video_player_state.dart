import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui' as ui;
import '../../../../core/model/android/video_play/dan_mu_route_model.dart';

class BilibiliVideoPlayerState {
  ///视频的oid
  late String oid;

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

  late bool danMuIsScroll;

  late List<DanMuRouteModel> danMuRouteList;
  late List<List<Widget>> danMuChildren;
  late List<int> velocity;

  ///弹幕速度
  late List<double> routeMaxLength;
  late double nowPosition;
  late int danMuPackageNum;
  late List<Widget> danMuWidgets;
  late List<Duration> speedList;
  late int danMuRouteAmount;

  late bool danMuOpenOrClose;
  late double lastDetalDx;

  BilibiliVideoPlayerState() {
    danMuRouteAmount = 6;
    danMuOpenOrClose = true;
    lastDetalDx = 0;
  }
}
