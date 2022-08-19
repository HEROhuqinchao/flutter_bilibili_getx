// import 'package:flutter_bilibili/core/model/space_acc_info_model.dart';
// import 'package:flutter_bilibili/core/service/utils/http_base_request.dart';
//
// import '../../model/account_mine.dart';
//
// /**
//  * web端接口，待改（搜索用户的基本信息，投稿量、播放量等等的数据）
//  */
// class HYMineRequest {
//   static Future<HYSpaceAccInfoModel> getSpaceAccInfoData(int mid) async {
//     final url = "/space/acc/info?mid=$mid";
//     final result = await HttpBaseRequest.request("base", url);
//     final data = result["data"];
//     return HYSpaceAccInfoModel.fromJson(data);
//   }
//
//   static Future<HYAccountMineModel> getAccountMineData(
//       String accessKey, String appKey, String sign) async {
//     final url = "/x/v2/account/mine?"
//         "access_key=$accessKey"
//         "&appkey=$appKey"
//         "&bili_link_new=1"
//         "&build=6720300"
//         "&c_locale=zh_CN"
//         "&channel=html5_search_baidu"
//         "&disable_rcmd=0"
//         "&mobi_app=android"
//         "&platform=android"
//         "&s_locale=zh_CN"
//         "&statistics=%7B%22appId%22%3A1%2C%22platform%22%3A3%2C%22version%22%3A%226.72.0%22%2C%22abtest%22%3A%22%22%7D"
//         "&ts=1658974686"
//         "&sign=$sign";
//     final result = await HttpBaseRequest.request("app", url);
//     return HYAccountMineModel.fromJson(result);
//   }
// }
