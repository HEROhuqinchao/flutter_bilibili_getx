import '../../../../../core/model/local_video_model.dart';

class LocalVideoState {
  ///本地视频数据
  late List<HYLocalVideoModel> localVideoList;
  LocalVideoState() {
    localVideoList = [];
  }
}
