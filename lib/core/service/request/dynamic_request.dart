import 'package:bilibili_getx/ui/shared/params_sign.dart';
import 'package:dio/dio.dart';

import '../../model/web/dynamic/web_dynamic_v1_feed_all.dart';
import '../utils/http_base_request.dart';

///动态
class DynamicRequest {
  DynamicRequest._internal();

  static final DynamicRequest _instance = DynamicRequest._internal();

  factory DynamicRequest() => _instance;

  Future<void> getDynUnLoginRcmdData() async {
    String url = "/bilibili.app.dynamic.v2.Dynamic/DynUnLoginRcmd";
    final responseResult = await HttpBaseRequest().request("app", url,
        contentType: "PROTO", responseType: ResponseType.bytes, method: "POST");
    print(responseResult);
  }

  ///web端 获取所有动态
  Future<WebDynamicV1FeedAllModel> getWebDynamicV1FeedAll(params) async {
    String url =
        "/x/polymer/web-dynamic/v1/feed/all?${ParamsSign.paramsSerialization(params)}";
    final result = await HttpBaseRequest().request("base", url);
    return WebDynamicV1FeedAllModel.fromJson(result);
  }
}
