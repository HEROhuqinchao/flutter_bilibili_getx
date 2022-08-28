import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import '../../../core/model/feed_index_model.dart';
import '../../../core/model/video_reply_model.dart';

class VideoPlayState {
  late FeedIndexItem video;
  late double aspectRatio;
  late List<String> tabTitle;
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  late bool isLoadingAccomplished;
  late int allCount;
  late HYVideoReplyModel videoReply;
  late int leftCount;

  VideoPlayState() {
    isLoadingAccomplished = false;
    allCount = -1;
  }
}
