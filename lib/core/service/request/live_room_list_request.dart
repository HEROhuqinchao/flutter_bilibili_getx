import '../../model/live_rooms_model.dart';
import '../utils/http_base_request.dart';

class HYLiveRoomsRequest {
  static Future<HYLiveRoomsModel> getLiveRoomsData() async {
    const url = "/xlive/web-interface/v1/index/getList?platform=web";
    final result = await HttpBaseRequest.request("live", url);
    final liveRoomsData = result["data"];
    return HYLiveRoomsModel.fromJson(liveRoomsData);
  }
}