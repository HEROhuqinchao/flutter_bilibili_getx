import 'package:bilibili_getx/core/model/android/video_play/video_profile_model.dart';
import 'package:bilibili_getx/ui/shared/params_sign.dart';

import '../../model/relation_stat_model_model.dart';
import '../../model/space_nav_num_model.dart';
import '../../model/tag_archive_tags_model.dart';
import '../../model/video_model.dart';
import '../../model/video_reply_model.dart';
import '../utils/http_base_request.dart';

/// 视频播放界面需要用到的数据
class HYVideoRequest {
  HYVideoRequest._internal();

  static final HYVideoRequest _instance = HYVideoRequest._internal();

  factory HYVideoRequest() => _instance;

  Future<HYRelationStatModel> getRelationStatData(int mid) async {
    final url = "/x/relation/stat?vmid=$mid&jsonp=jsonp";
    final result = await HttpBaseRequest().request("base", url);
    return HYRelationStatModel.fromJson(result);
  }

  Future<HYSpaceNavNumModel> getSpaceNavNumData(int mid) async {
    final url = "/x/space/navnum?mid=$mid";
    final result = await HttpBaseRequest().request("base", url);
    return HYSpaceNavNumModel.fromJson(result);
  }

  Future<List<HYTagArchiveTagsModel>> getTagArchiveTagsData(int aid) async {
    final url = "/x/tag/archive/tags?aid=$aid";
    final result = await HttpBaseRequest().request("base", url);
    final tagArray = result["data"];
    final List<HYTagArchiveTagsModel> tags = [];
    for (var json in tagArray) {
      tags.add(HYTagArchiveTagsModel.fromJson(json));
    }
    return tags;
  }

  Future<List<HYVideoModel>> getArchiveRelatedData(int aid) async {
    final url = "/x/web-interface/archive/related?aid=$aid";
    final result = await HttpBaseRequest().request("base", url);
    final relatedVideoArray = result["data"];
    final List<HYVideoModel> relatedVideos = [];
    for (var json in relatedVideoArray) {
      HYVideoModel tempVideo = HYVideoModel.fromJson(json);
      relatedVideos.add(tempVideo);
    }
    return relatedVideos;
  }

  ///获取视频源播放地址（后续需要用正则表达式切出原视频地址）
  Future<String> getMp4VideoPlayData(int aid) async {
    final url = "/video/av$aid.html?from=search";
    final result = await HttpBaseRequest().request("video", url);
    return result;
  }

  ///获取视频信息
  Future<VideoProfileModel> getVideoView(params) async {
    final url = "/x/v2/view?${ParamsSign.paramsSerialization(params)}";
    final result = await HttpBaseRequest().request('app', url);
    return VideoProfileModel.fromJson(result);
  }

  ///回复
  Future<HYVideoReplyModel> getVideoReply(
      String aid, int type, int next) async {
    final url = "/x/v2/reply/main?oid=$aid&type=$type&next=$next";
    final result = await HttpBaseRequest().request("base", url);
    final videoReplyJson = result["data"];
    return HYVideoReplyModel.fromJson(videoReplyJson);
  }
}
