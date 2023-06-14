import '../../model/info_by_live_room_model.dart';
import '../../model/live_room_stream_model.dart';
import '../../model/online_gold_rank_model.dart';
import '../utils/http_base_request.dart';

///直播这里接口是web端的，待改
class HYLiveRoomPlayRequest {
  HYLiveRoomPlayRequest._internal();

  static final HYLiveRoomPlayRequest _instance =
      HYLiveRoomPlayRequest._internal();

  factory HYLiveRoomPlayRequest() => _instance;

  Future<HYLiveRoomStreamModel> getLiveRoomStreamData(int cid) async {
    final url = "/room/v1/Room/playUrl?cid=$cid";
    final result = await HttpBaseRequest().request("live", url);
    final liveRoomStreamJson = result["data"];
    return HYLiveRoomStreamModel.fromJson(liveRoomStreamJson);
  }

  Future<HYInfoByLiveRoomModel> getInfoByLiveRoomData(int roomId) async {
    final url = "/xlive/web-room/v1/index/getInfoByRoom?room_id=$roomId";
    final result = await HttpBaseRequest().request("live", url);
    final infoByLiveRoomModelJson = result["data"];
    return HYInfoByLiveRoomModel.fromJson(infoByLiveRoomModelJson);
  }

  ///直播间在线榜单（此处有问题，待改）
  Future<HYOnlineGoldRankModel> getOnlineGoldRankData(
      int ruId, int roomId, int page, int pageSize) async {
    final url =
        "/xlive/general-interface/v1/rank/getOnlineGoldRank?ruid=$ruId&roomId=$roomId&page=$page&pageSize=$pageSize";
    print(url);
    final result = await HttpBaseRequest().request("live", url);
    final infoByLiveRoomModelJson = result["data"];
    return HYOnlineGoldRankModel.fromJson(infoByLiveRoomModelJson);
  }
}
