import '../../../ui/shared/params_sign.dart';
import '../../model/android/home/search_square_model.dart';
import '../../model/android/home/x_resource_show_tab_v2_model.dart';
import '../../model/android/home/pgc_page_bangumi_model.dart';
import '../../model/feed_index_model.dart';
import '../../model/video_model.dart';
import '../utils/http_base_request.dart';

///主页界面用到的接口
class HYHomeRequest {
  // https://app.bilibili.com/x/resource/show/tab/v2?build=6720300&platform=android
  // https://app.bilibili.com/x/v2/feed/index
  /// rid为分区编号，必填
  /// pn为页数
  /// ps为一页几项video数据
  HYHomeRequest._internal();

  static final HYHomeRequest _instance = HYHomeRequest._internal();

  factory HYHomeRequest() => _instance;

  Future<List<HYVideoModel>> getVideoData(int rid, int pn, int ps) async {
    final url = "/x/web-interface/dynamic/region?rid=$rid&pn=$pn&ps=$ps";
    final result = await HttpBaseRequest().request("base", url);
    final videoArray = result["data"]["archives"];
    List<HYVideoModel> videos = [];
    for (var json in videoArray) {
      videos.add(HYVideoModel.fromJson(json));
    }
    return videos;
  }

  ///首页视频（新接口）
  Future<HYFeedIndexModel> getFeedIndexData(params) async {
    String url = "/x/v2/feed/index?${ParamsSign.paramsSerialization(params)}";
    final result = await HttpBaseRequest().request("app", url);
    return HYFeedIndexModel.fromJson(result);
  }

  Future<SearchSquareModel> fetchSearchSquareData(params) async {
    String path =
        "/x/v2/search/square?${ParamsSign.paramsSerialization(params)}";
    final result = await HttpBaseRequest().request("app", path);
    return SearchSquareModel.fromJson(result);
  }

  ///主页按钮（tab等）
  Future<XResourceShowTabV2Model> fetchXResourceShowTabV2Data(params) async {
    String path =
        "/x/resource/show/tab/v2?${ParamsSign.paramsSerialization(params)}";
    final result = await HttpBaseRequest().request("app", path);
    return XResourceShowTabV2Model.fromJson(result);
  }

  ///获取动画数据
  Future<PgcPageBangumiModel> fetchPageBangumiData(params) async {
    String path = "/pgc/page/bangumi?${ParamsSign.paramsSerialization(params)}";
    final result = await HttpBaseRequest().request("base", path);
    return PgcPageBangumiModel.fromJson(result);
  }
}
