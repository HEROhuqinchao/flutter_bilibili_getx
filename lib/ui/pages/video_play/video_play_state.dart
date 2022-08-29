import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import '../../../core/model/feed_index_model.dart';
import '../../../core/model/video_reply_model.dart';

class VideoPlayState {
  late bool firstLoading;
  late FeedIndexItem video;
  late double aspectRatio;
  late List<String> tabTitle;
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  late bool isLoadingAccomplished;
  late int allCount;
  late HYVideoReplyModel videoReply;
  late int leftCount;
  late int frequency;

  VideoPlayState() {
    frequency = 0;
    firstLoading = true;
    isLoadingAccomplished = false;
    allCount = -1;
    tabTitle = ['简介', '评论'];
  }
}
