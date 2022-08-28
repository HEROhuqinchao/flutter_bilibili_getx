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
  void fetchFeedIndexItemData(FeedIndexItem video) {
    state.video = video;
    update();
  }
  @override
  void onReady() {
    initVideoPlayer();
    super.onReady();
  }

  @override
  void onClose() {
    state.videoPlayerController.dispose();
    state.chewieController.dispose();
    super.onClose();
  }

  void initVideoPlayer() {
    state.videoPlayerController =
        VideoPlayerController.network(state.video.videoData);
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
