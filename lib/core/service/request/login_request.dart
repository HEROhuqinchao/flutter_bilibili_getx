import 'package:dio/dio.dart';

import '../../../ui/shared/params_sign.dart';
import '../../model/account_mine.dart';
import '../../model/hash_key_model.dart';
import '../utils/http_base_request.dart';

/// 登录界面用到的接口
class HYLoginRequest {
  ///获取key和hash（key用于RSA加密,hash为salt值）
  static Future<HYHashKeyModel> getPassportLogin() async {
    const url = "/x/passport-login/web/key?build=6720300&platform=android";
    final result = await HttpBaseRequest.request("login", url);
    return HYHashKeyModel.fromJson(result);
  }

  ///短信登录
  static Future<String> messageCodeLogin(postBody) async {
    const url = "/x/passport-login/login/sms";
    final result = await HttpBaseRequest.request("login", url,
        params: postBody,
        method: 'POST',
        contentType: 'UTF-8',
        responseType: ResponseType.plain);
    return result.toString();
  }

  ///密码登录
  static Future<String> passwordLogin(postBody) async {
    const url = "/x/passport-login/oauth2/login";
    final result = await HttpBaseRequest.request("login", url,
        params: postBody,
        method: 'POST',
        contentType: 'UTF-8',
        responseType: ResponseType.plain);
    return result.toString();
  }

  ///发送短信
  static Future<String> sendSMSMessage(postBody) async {
    const url = "/x/passport-login/sms/send";
    final result = await HttpBaseRequest.request("login", url,
        params: postBody,
        method: 'POST',
        contentType: 'UTF-8',
        responseType: ResponseType.plain);
    return result.toString();
  }

  ///获取用户的头像、粉丝、关注等基本信息
  static Future<HYAccountMineModel> getAccountMineData(params) async {
    String url = "/x/v2/account/mine?${ParamsSign.paramsSerialization(params)}";
    final result = await HttpBaseRequest.request("app", url);
    return HYAccountMineModel.fromJson(result);
  }
}
