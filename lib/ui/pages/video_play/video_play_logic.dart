import 'package:bilibili_getx/core/service/request/video_play_request.dart';
import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:bilibili_getx/ui/pages/video_play/video_play_state.dart';
import 'package:video_player/video_player.dart';

import '../../../core/model/feed_index_model.dart';
import '../../../core/service/request/video_reply_request.dart';
import '../../shared/params_sign.dart';
import '../../widgets/bilibili_controls.dart';

class VideoPlayLogic extends GetxController {
  final VideoPlayState state = VideoPlayState();

  @override
  void onReady() {
    state.customScrollController.addListener(() {
      if(state.customScrollController.offset > 140.w && !state.customScrollController.position.outOfRange) {
        state.showOrHideIconAndTitleOpacity = 1;
        update();
      }
      if(state.customScrollController.offset < 140.w && !state.customScrollController.position.outOfRange) {
        state.showOrHideIconAndTitleOpacity = 0;
        update();
      }
    });
    super.onReady();
  }

  @override
  void onClose() {
    disposeVideoPlayerController();
    super.onClose();
  }

  void fetchVideoView(String aid) {
    Map<String, dynamic> params = {
      'aid':aid,
      'appkey':Constant.appKey,
      'build':'5480400',
      'ts':'1662682722783',
    };
    ///加上sign字段
    final signEntry = <String, dynamic>{'sign': ParamsSign.getSign(params)};
    params.addEntries(signEntry.entries);

    HYVideoRequest.getVideoView(params).then((value) {
      state.videoView = value;
      state.isLoadingVideoView = false;
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

  void disposeVideoPlayerController() {
    state.videoPlayerController.pause();
    state.chewieController.pause();
    state.videoPlayerController.dispose();
    state.videoPlayerController.removeListener(() {});
    state.chewieController.dispose();
    state.customScrollController.dispose();
  }

  initVideoPlayerController() {
    state.videoPlayerController.initialize().then((value) {
      state.chewieController = ChewieController(
        allowMuting: false,
        videoPlayerController: state.videoPlayerController,
        autoPlay: true,
        customControls: HYBilibiliControls(
          video: state.video,
        ),
      );
      state.isLoadingVideoPlayer = false;
      update();
    });
  }



  ///获取视频回复的评论
  void initVideoReply() {
    HYVideoReplyRequest.getVideoReply(state.video.args!.aid!, 1, 1)
        .then((value) {
      state.allCount = value.cursor.allCount;
      state.videoReply = value;
      state.leftCount = state.allCount - state.videoReply.replies.length;
      state.isLoadingVideoView = false;
      update();
    });
  }
}
