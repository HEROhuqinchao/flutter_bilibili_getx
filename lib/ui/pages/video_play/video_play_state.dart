import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../core/model/android/video_play/video_profile_model.dart';
import '../../../core/model/feed_index_model.dart';
import '../../../core/model/video_reply_model.dart';
import '../../widgets/expanded_widget.dart';
import '../../widgets/primary_scroll_container.dart';

class VideoPlayState {
  late bool firstLoading;
  late FeedIndexItem video;
  late double aspectRatio;
  late List<String> tabTitle;
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  late bool isLoadingVideoPlayer;
  late HYVideoReplyModel videoReply;
  late int frequency;

  late VideoProfileData videoProfile;
  late bool isLoadingVideoProfile;
  late bool isLoadingVideoReply;
  late double expandedHeight;
  late ScrollController customScrollController;
  late double showOrHideIconAndTitleOpacity;
  late GlobalKey<ExpandedWidgetState> cutDownWidgetKey;
  late bool isExpanded;

  int pageIndex = 2;
  late List<HYVideoReplyModelReply> allReplies;

  late GlobalKey<PrimaryScrollContainerState> keyProfile;
  late GlobalKey<PrimaryScrollContainerState> keyReply;
  late List<GlobalKey<PrimaryScrollContainerState>> scrollChildKeys;

  VideoPlayState() {
    frequency = 0;
    firstLoading = true;
    isLoadingVideoPlayer = true;
    tabTitle = ['简介', '评论'];

    isLoadingVideoProfile = true;
    isLoadingVideoReply = true;
    expandedHeight = 200.w;
    customScrollController = ScrollController();
    showOrHideIconAndTitleOpacity = 0;
    cutDownWidgetKey = GlobalKey();
    isExpanded = false;

    allReplies = [];
    keyProfile = GlobalKey<PrimaryScrollContainerState>();
    keyReply = GlobalKey<PrimaryScrollContainerState>();
    scrollChildKeys = [keyProfile, keyReply];
  }
}
