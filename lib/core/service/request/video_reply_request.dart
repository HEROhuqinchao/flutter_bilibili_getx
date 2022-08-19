import '../../model/video_reply_model.dart';
import '../utils/http_base_request.dart';

///视频回复评论请求
class HYVideoReplyRequest {
  static Future<HYVideoReplyModel> getVideoReply(
      int oid, int type, int next) async {
    final url = "/x/v2/reply/main?oid=$oid&type=$type&next=$next";
    final result = await HttpBaseRequest.request("base", url);
    final videoReplyJson = result["data"];
    return HYVideoReplyModel.fromJson(videoReplyJson);
  }
}
