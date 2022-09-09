import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import '../../../core/model/android/video_play/video_view_model.dart';
import '../../../core/model/feed_index_model.dart';
import '../../../core/model/video_reply_model.dart';

class VideoPlayState {
  late bool firstLoading;
  late FeedIndexItem video;
  late double aspectRatio;
  late List<String> tabTitle;
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  late bool isLoadingVideoPlayer;
  late int allCount;
  late HYVideoReplyModel videoReply;
  late int leftCount;
  late int frequency;

  late VideoViewModel videoView;
  late bool isLoadingVideoView;
  late bool isLoadingVideoReply;
  late double expandedHeight;
  late ScrollController customScrollController;
  late double showOrHideIconAndTitleOpacity;

  VideoPlayState() {
    frequency = 0;
    firstLoading = true;
    isLoadingVideoPlayer = true;
    allCount = -1;
    tabTitle = ['简介', '评论'];

    isLoadingVideoView = true;
    isLoadingVideoReply = true;
    expandedHeight = 200.w;
    customScrollController = ScrollController();
    showOrHideIconAndTitleOpacity = 0;
  }
}
