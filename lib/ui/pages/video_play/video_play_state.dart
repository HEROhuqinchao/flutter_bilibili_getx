import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../core/model/android/video_play/video_profile_model.dart';
import '../../../core/model/video_reply_model.dart';
import '../../widgets/expanded_widget.dart';
import '../../widgets/primary_scroll_container.dart';

class VideoPlayState {
  ///评论数据
  late HYVideoReplyModel videoReply;

  ///视频加载失败重加载次数
  late int frequency;

  ///视频简介及相关视频数据
  late VideoProfileData videoProfile;

  ///加载视频播放控制器
  late bool isLoadingVideoPlayer;

  ///加载视频简介
  late bool isLoadingVideoProfile;

  ///加载视频评论回复
  late bool isLoadingVideoReply;

  ///扩展
  late double expandedHeight;

  ///nestedScrollView控制器
  late ScrollController nestedScrollViewController;

  ///隐藏主页按钮和显示立即播放按钮
  late double showOrHideIconAndTitleOpacity;

  ///展开明细和收缩明细
  late GlobalKey<ExpandedWidgetState> cutDownWidgetKey;

  ///是否展开
  late bool isExpanded;

  ///所有评论
  late List<HYVideoReplyModelReply> allReplies;

  ///区分不同的scroll的key
  late GlobalKey<PrimaryScrollContainerState> keyProfile;
  late GlobalKey<PrimaryScrollContainerState> keyReply;
  late List<GlobalKey<PrimaryScrollContainerState>> scrollChildKeys;


  ///视频进度条
  ///判断当前视频播放状态
  late VideoPlayerValue latestValue;
  late bool hideStuff;
  late double barHeight;
  late Timer showAfterExpandCollapseTimer;
  late Timer hideTimer;
  late bool displayTapped;
  late Timer initTimer;
  late bool dragging;
  late bool showPlayButton;


  ///初始化
  VideoPlayState() {
    frequency = 0;
    isLoadingVideoPlayer = true;
    isLoadingVideoProfile = true;
    isLoadingVideoReply = true;
    expandedHeight = 200.w;
    nestedScrollViewController = ScrollController();
    showOrHideIconAndTitleOpacity = 0;
    cutDownWidgetKey = GlobalKey();
    isExpanded = false;
    allReplies = [];
    keyProfile = GlobalKey<PrimaryScrollContainerState>();
    keyReply = GlobalKey<PrimaryScrollContainerState>();
    scrollChildKeys = [keyProfile, keyReply];
    hideStuff = false;
    barHeight = 70.h;
    displayTapped = false;
    dragging = false;
    showPlayButton = true;
  }
}
