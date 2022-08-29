import 'package:chewie/chewie.dart';
import 'package:get/get.dart';

import 'package:bilibili_getx/ui/pages/video_play/video_play_state.dart';
import 'package:video_player/video_player.dart';

import '../../../core/model/feed_index_model.dart';
import '../../../core/service/request/video_reply_request.dart';
import '../../widgets/bilibili_controls.dart';

class VideoPlayLogic extends GetxController {
  final VideoPlayState state = VideoPlayState();

  ///获取视频相关的数据
  void fetchFeedIndexItemData(FeedIndexItem video) async {
    state.frequency = 0;
    state.isLoadingAccomplished = false;
    state.video = video;
    state.videoPlayerController =
        VideoPlayerController.network(state.video.videoData);
    initVideoPlayerController();
    state.videoPlayerController.addListener(() {
      if (!state.videoPlayerController.value.isInitialized) {
        if(state.frequency < 5) {
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
      state.isLoadingAccomplished = true;
      update();
    });
  }

  @override
  void onClose() {
    disposeVideoPlayerController();
    super.onClose();
  }

  void initVideoReply() {
    ///获取视频回复的评论
    HYVideoReplyRequest.getVideoReply(state.video.args!.aid!, 1, 1)
        .then((value) {
      state.allCount = value.cursor.allCount;
      state.videoReply = value;
      state.leftCount = state.allCount - state.videoReply.replies.length;
      update();
    });
  }
}