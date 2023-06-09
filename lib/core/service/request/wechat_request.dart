import 'package:bilibili_getx/core/service/utils/http_base_request.dart';

import '../../model/wechat/custom_result_model.dart';
import '../../model/wechat/wechat_users_model.dart';
import '../../model/wechat_login_model.dart';

///仿微信聊天功能
class WechatRequest {
  ///获取用户列表
  static Future<WechatUsersModel> getWechatUsers() async {
    String url = "/wechat/users";
    final result = await HttpBaseRequest.request("wechat", url);
    return WechatUsersModel.fromJson(result);
  }

  ///注册账号
  static Future<CustomResultModel> registerUser(params) async {
    String url = "/wechat/register";
    final result = await HttpBaseRequest.request(
      "wechat",
      url,
      method: "POST",
      params: params
    );
    return CustomResultModel.fromJson(result);
  }

  ///登录账号
  static Future<WechatLoginModel> loginUser(params) async {
    String url = "/wechat/login";
    final result = await HttpBaseRequest.request(
        "wechat",
        url,
        method: "POST",
        params: params
    );
    return WechatLoginModel.fromJson(result);
  }
}
