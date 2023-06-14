import '../../model/popular_series_one_model.dart';
import '../utils/http_base_request.dart';

/// 为图表使用的接口
class PopularSeriesOneRequest {
  PopularSeriesOneRequest._internal();

  static final PopularSeriesOneRequest _instance =
      PopularSeriesOneRequest._internal();

  factory PopularSeriesOneRequest() => _instance;

  ///第五十九期每周必看
  Future<HYPopularSeriesOneModel> getPopularSeriesOneData() async {
    const url = "/x/web-interface/popular/series/one?number=59";
    final result = await HttpBaseRequest().request("base", url);
    final popularSeriesOne = result["data"];
    return HYPopularSeriesOneModel.fromJson(popularSeriesOne);
  }
}
