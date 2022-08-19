
import '../../model/home_search_result.dart';
import '../../model/search_keyword_recommend.dart';
import '../../model/search_keywords_model.dart';
import '../utils/http_base_request.dart';

///搜索
class HYSearchRequest {
  ///热门搜索词
  static Future<HYSearchKeywordModel> getSearchKeywordData() async {
    const url = "/x/v2/search/square?platform=android&build=6720300&limit=10";
    final result = await HttpBaseRequest.request("app", url);
    return HYSearchKeywordModel.fromJson(result);
  }

  /// 手机端请求连接 https://app.biliapi.com/bilibili.app.interface.v1.Search/Suggest3，请求返回grc
  /// 手机端请求，目前不清楚怎么搞，所以先用web端的请求，返回人见人爱的json数据
  /// 搜索“你好”，会显示“你好李焕英”、“你好世界”等包含“你好”的关键词
  static Future<HYSearchKeywordRecommendModel> getSearchKeywordRecommendData(
      String keyword) async {
    final url = "/main/suggest?term=$keyword&main_ver=v1";
    final result = await HttpBaseRequest.request("search", url);
    return HYSearchKeywordRecommendModel.fromJson(result);
  }

  ///获取搜索到的结果
  static Future<HYSearchResultModel> getSearchResultData(String keyword) async {
    final url = "/x/v2/search?build=6720300&keyword=$keyword";
    final result = await HttpBaseRequest.request("app", url);
    return HYSearchResultModel.fromJson(result);
  }
}
