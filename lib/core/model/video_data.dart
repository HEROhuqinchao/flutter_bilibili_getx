/**
 * type=1：长视频；type=0：宽视频
 */
//视频数据
class VideoData {
  String videoURL;  //视频url
  int videoHeightType;//视频类型

  VideoData(this.videoURL, this.videoHeightType);

}
List<VideoData> videoList = [
  VideoData('test-video-10.MP4', 0),
  VideoData('test-video-6.mp4', 1),
  VideoData('test-video-9.MP4', 0),
  VideoData('test-video-8.MP4', 1),
  VideoData('test-video-7.MP4', 0),
  VideoData('test-video-1.mp4', 0),
  VideoData('test-video-2.mp4', 1),
  VideoData('test-video-3.mp4', 1),
  VideoData('test-video-4.mp4', 1),
];