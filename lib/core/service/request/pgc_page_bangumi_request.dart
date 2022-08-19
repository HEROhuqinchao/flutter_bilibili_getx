import '../../model/pgc_page_bangumi_model.dart';
import '../utils/http_base_request.dart';

///主页的动画请求数据
class HYGrcPageBangumiRequest {
  static Future<HYGrcPageBangumiModel> getPageBangumiData() async {
    const url = "/pgc/page/bangumi?build=6720300&mobi_app=android";
    final result = await HttpBaseRequest.request("base", url);
    final bangumiResult = result["result"];
    return HYGrcPageBangumiModel.fromJson(bangumiResult);
  }
}
