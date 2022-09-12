import 'dart:async';

import 'package:bilibili_getx/core/service/request/video_play_request.dart';
import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:bilibili_getx/ui/pages/video_play/video_play_state.dart';
import 'package:video_player/video_player.dart';

import '../../../core/model/feed_index_model.dart';
import '../../shared/params_sign.dart';
import 'bilibili_video_prograss_controller/bilibili_video_progress_control.dart';

class VideoPlayLogic extends GetxController {
  final VideoPlayState state = VideoPlayState();

  @override
  void onReady() {
    ///控制显示或者隐藏
    state.nestedScrollViewController.addListener(() {
      if (state.nestedScrollViewController.offset > 140.w &&
          !state.nestedScrollViewController.position.outOfRange &&
          state.showOrHideIconAndTitleOpacity != 1) {
        state.showOrHideIconAndTitleOpacity = 1;
        update();
      }
      if (state.nestedScrollViewController.offset < 140.w &&
          !state.nestedScrollViewController.position.outOfRange &&
          state.showOrHideIconAndTitleOpacity != 0) {
        state.showOrHideIconAndTitleOpacity = 0;
        update();
      }
    });
    fetchVideoView(state.video.args!.aid!.toString());
    fetchVideoReply(state.video.args!.aid!.toString());
    super.onReady();
  }

  ///销毁控件，取消监听
  @override
  void onClose() {
    disposeVideoPlayerController();
    super.onClose();
  }

  ///获取视频数据
  void fetchVideoView(String aid) {
    Map<String, dynamic> params = {
      'aid': aid,
      'appkey': Constant.appKey,
      'build': '5480400',
      'ts': '1662682722783',
    };

    ///加上sign字段
    final signEntry = <String, dynamic>{'sign': ParamsSign.getSign(params)};
    params.addEntries(signEntry.entries);

    HYVideoRequest.getVideoView(params).then((value) {
      state.videoProfile = value.data;
      state.isLoadingVideoProfile = false;
      update();
    });
  }

  ///获取视频相关的数据
  void fetchFeedIndexItemData(FeedIndexItem video) async {
    state.frequency = 0;
    state.isLoadingVideoPlayer = true;
    state.video = video;
    state.videoPlayerController =
        VideoPlayerController.network(state.video.videoData);
    initVideoPlayerController();
    state.videoPlayerController.addListener(() {
      if (!state.videoPlayerController.value.isInitialized) {
        if (state.frequency < 2) {
          initVideoPlayerController();
          state.frequency++;
        }
      }
    });
  }

  ///销毁视频的控件
  void disposeVideoPlayerController() {
    state.videoPlayerController.dispose();
    state.videoPlayerController.removeListener(() {});
    state.chewieController.dispose();
    state.nestedScrollViewController.removeListener(() {});
    state.nestedScrollViewController.dispose();
  }

  ///初始化视频播放的控件
  initVideoPlayerController() {
    state.videoPlayerController.initialize().then((value) {
      state.chewieController = ChewieController(
          allowMuting: false,
          videoPlayerController: state.videoPlayerController,
          autoPlay: true,
          customControls: const BilibiliVideoProgressController()
          // customControls: HYBilibiliControls(
          //   video: state.video,
          // ),
          );
      ///初始化进度条
      initializeBilibiliVideoProgressControl();
      state.isLoadingVideoPlayer = false;
      update();
    });
  }

  ///获取视频回复的评论
  void fetchVideoReply(String aid) {
    HYVideoRequest.getVideoReply(aid, 1, 1).then((value) {
      state.videoReply = value;
      state.allReplies.addAll(value.replies);
      state.isLoadingVideoReply = false;
      update();
    });
  }

  ///展开明细或隐藏视频的明细
  void expandedVideoProfileDetail() {
    state.isExpanded = !state.isExpanded;
    state.cutDownWidgetKey.currentState?.widgetShift();
    update();
  }

  ///视频进度条
  Future<void> initializeBilibiliVideoProgressControl() async {
    state.videoPlayerController.addListener(updateState);
    if (state.videoPlayerController.value.isPlaying ||
        state.chewieController.autoPlay) {
      startHideTimer();
    }

    if (state.chewieController.showControlsOnInitialize) {
      state.initTimer = Timer(const Duration(milliseconds: 200), () {
        state.hideStuff = false;
        update();
      });
    }
  }
  void onExpandCollapse() {
    state.hideStuff = true;
    state.chewieController.toggleFullScreen();
    state.showAfterExpandCollapseTimer =
        Timer(const Duration(milliseconds: 300), () {
          cancelAndRestartTimer();
          update();
        });
    update();
  }
  void cancelAndRestartTimer() {
    state.hideTimer.cancel();
    startHideTimer();
    state.hideStuff = false;
    state.displayTapped = true;
    update();
  }
  void startHideTimer() {
    final hideControlsTimer =
    state.chewieController.hideControlsTimer.isNegative
        ? ChewieController.defaultHideControlsTimer
        : state.chewieController.hideControlsTimer;

    ///过一段时间隐藏掉
    state.hideTimer = Timer(hideControlsTimer, () {
      state.hideStuff = true;
      update();
    });
  }
  void updateState() {
    state.latestValue = state.videoPlayerController.value;
    update();
  }
  void playPause() {
    final isFinished = state.latestValue.position >= state.latestValue.duration;

    ///didUpdateWidget与此处对应
    if (state.videoPlayerController.value.isPlaying) {
      state.hideStuff = false;
      state.hideTimer.cancel();
      state.videoPlayerController.pause();
    } else {
      cancelAndRestartTimer();
      if (!state.videoPlayerController.value.isInitialized) {
        state.videoPlayerController.initialize().then((_) {
          state.videoPlayerController.play();
        });
      } else {
        if (isFinished) {
          state.videoPlayerController.seekTo(Duration.zero);
        }
        state.videoPlayerController.play();
      }
    }
    update();
  }
  void disposeController() {
    state.videoPlayerController.removeListener(updateState);
    state.videoPlayerController.dispose();
    state.chewieController.dispose();
    state.hideTimer.cancel();
    state.initTimer.cancel();
    state.showAfterExpandCollapseTimer.cancel();
  }

  void tapPlayButton() {
    if (state.latestValue.isPlaying) {
      if (state.displayTapped) {
        state.hideStuff = true;
      } else {
        cancelAndRestartTimer();
      }
    } else {
      playPause();
      state.hideStuff = true;
    }
    update();
  }
}
