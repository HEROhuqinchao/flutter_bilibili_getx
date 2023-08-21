import '../../../ui/shared/params_sign.dart';
import '../../model/live_rooms_model.dart';
import '../../model/xliveAppInterfaceV2IndexFeedModel.dart';
import '../utils/http_base_request.dart';

///直播界面
class HYLiveRequest {
  HYLiveRequest._internal();

  static final HYLiveRequest _instance = HYLiveRequest._internal();

  factory HYLiveRequest() => _instance;

  Future<HYLiveRoomsModel> getLiveRoomsData() async {
    const url = "/xlive/web-interface/v1/index/getList?platform=web";
    final result = await HttpBaseRequest().request("live", url);
    final liveRoomsData = result["data"];
    return HYLiveRoomsModel.fromJson(liveRoomsData);
  }

  Future<XliveAppInterfaceV2IndexFeedModel> getXliveAppInterfaceV2IndexFeedData(
      params) async {
    final url =
        "/xlive/app-interface/v2/index/feed?${ParamsSign.paramsSerialization(params)}";
    final result = await HttpBaseRequest().request("live", url);
    return XliveAppInterfaceV2IndexFeedModel.fromJson(result);
  }
}
