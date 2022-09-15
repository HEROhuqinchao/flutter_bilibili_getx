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

  ///弹幕
  ///每条轨道距离顶部距离
  late List<double> movingDMRouteTop;
  late List<double> topDMRouteTop;
  late List<double> bottomDMRouteTop;

  ///每条轨道运动时间不同
  late List<int> moveTimeList;
  late List<int> showTimeList;

  ///视频oid
  late int oid;

  ///视频时长(几分钟的，弹幕是六分钟一包）
  late int duration;

  ///当前是第几包弹幕包
  late int segmentIndex;

  ///装填弹幕的容器
  late List<Widget> dMWidgets;

  ///弹幕的速度
  late List<double> speedList;

  ///标记最短的那条轨道来发弹幕
  late int routeNum;

  ///记录轨道时间
  late List<double> movingDMRoutesTime;
  late List<double> topDMRoutesTime;
  late List<double> bottomDMRoutesTime;

  ///每隔六分钟拿取一包
  late Timer danMuTimerPeriodic;

  ///总共有几包弹幕
  late int allMount;

  ///滚动弹幕、顶部弹幕、底部弹幕
  late List<DanMuModel02> customDanMuList;

  late int latestProcess;

  late int customDanMuListBeginIndex;

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
    movingDMRouteTop = [5, 25, 45, 65, 85, 105];
    topDMRouteTop = [5, 25, 45];
    bottomDMRouteTop = [140, 160, 180];
    moveTimeList = [13000, 12000, 11000, 13000, 12000, 11000];
    showTimeList = [4000, 4500, 5000];
    segmentIndex = 1;
    dMWidgets = [];
    speedList = [];
    routeNum = 0;
    movingDMRoutesTime = [0, 0, 0, 0, 0, 0];
    topDMRoutesTime = [0, 0, 0];
    bottomDMRoutesTime = [0, 0, 0];
    oid = 828168749;
    duration = 2;
    customDanMuList = [];
    latestProcess = 0;
    customDanMuListBeginIndex = 0;
  }
}
