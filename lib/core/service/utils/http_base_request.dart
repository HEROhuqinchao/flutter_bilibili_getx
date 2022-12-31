import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'constant.dart';

String ua =
    "Mozilla/5.0 (Linux; Android 5.1.1; Android SDK built for x86 Build/LMY48X) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/39.0.0.0 Mobile Safari/537.36";

String loginUserAgent =
    "Mozilla/5.0 BiliDroid/6.72.0 (bbcallen@gmail.com) os/android model/MuMu mobi_app/android build/6720300 channel/html5_search_baidu innerVer/6720310 osVer/6.0.1 network/2";

String uaWeb =
    "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.5112.102 Safari/537.36 Edg/104.0.1293.63";

class HttpBaseRequest {
  ///请求utf8的数据
  static Map<String, dynamic> utf8Headers = {
    HttpHeaders.contentTypeHeader: 'multipart/form-data',
  };

  ///请求json数据
  static Map<String, dynamic> jsonHeaders = {
    HttpHeaders.acceptHeader: 'application/json,*/*',
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.userAgentHeader: ua,
    HttpHeaders.cookieHeader:
        "buvid3=84F6E053-B579-35E2-C75E-9F554100BE6834154infoc; i-wanna-go-back=-1; _uuid=94524A93-F3710-A7AD-969A-4910FE1010C4FB1033966infoc; buvid4=77036CCD-6634-BC61-5A85-E99F6702D17E34460-022081609-BvEob4vLVHw3RzM780E09A%3D%3D; nostalgia_conf=-1; buvid_fp_plain=undefined; b_ut=5; CURRENT_BLACKGAP=0; fingerprint3=c8c54833688179bbaac5bb4d4247ca3a; PVID=1; b_nut=100; CURRENT_FNVAL=4048; rpdid=|(u|JRu)uJ~R0J'uYYmRR|Ymk; hit-new-style-dyn=0; hit-dyn-v2=1; innersign=0; b_lsid=62951467_184CC882FE4; sid=65oauv6u; bp_video_offset_243766934=734619628907528200; fingerprint=1b0d06d7ec4bc1a0d1038985b61675b7; buvid_fp=1b0d06d7ec4bc1a0d1038985b61675b7; DedeUserID=243766934; DedeUserID__ckMd5=ad56d1c5d71807ca; SESSDATA=09e12e84%2C1685436133%2C51255*c1; bili_jct=fb776c7f2631ed9a402b09211f24a58a"
  };

  ///请求xml数据
  static Map<String, dynamic> xmlHeaders = {
    HttpHeaders.acceptHeader: 'application/xml,*/*',
    HttpHeaders.contentTypeHeader: 'application/xml;charset=UTF-8',
    HttpHeaders.userAgentHeader: ua,
  };

  ///请求protobuf数据
  static Map<String, dynamic> protoHeaders = {
    HttpHeaders.acceptHeader: '*/*',
    HttpHeaders.contentTypeHeader: 'application/x-protobuf',
    HttpHeaders.userAgentHeader: ua,
  };

  ///请求json数据
  static Map<String, dynamic> jsonWebHeaders = {
    HttpHeaders.acceptHeader: 'application/json,*/*',
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.userAgentHeader: ua,
  };

  ///请求xml数据
  static Map<String, dynamic> xmlWebHeaders = {
    HttpHeaders.acceptHeader: 'application/xml,*/*',
    HttpHeaders.contentTypeHeader: 'application/xml;charset=UTF-8',
    HttpHeaders.userAgentHeader: ua,
  };

  ///请求protobuf数据
  static Map<String, dynamic> protoWebHeaders = {
    HttpHeaders.acceptHeader: '*/*',
    HttpHeaders.contentTypeHeader: 'application/x-protobuf',
    HttpHeaders.userAgentHeader: ua,
  };

  ///baseUrl为基本url，url为参数部分（get请求），和在一起用
  static Future<T> request<T>(String baseUrl, String url,
      {method, params, inter, contentType, responseType}) async {
    ///默认情况下为GET请求
    method = method ?? 'GET';

    ///请求json格式数据
    contentType = contentType ?? 'JSON';

    ///响应json数据
    responseType = responseType ?? ResponseType.json;

    BaseOptions baseOption = BaseOptions(
      method: method,
      baseUrl: Constant.urlMap[baseUrl] as String,
      connectTimeout: 10000,
      responseType: responseType,
    );

    ///网页端设置代理
    if (kIsWeb) {
      baseOption.baseUrl = Constant.urlWebMap[baseUrl] as String;
    }

    Dio dio = Dio(baseOption);

    ///userAgent
    if (!kIsWeb) {
      if (Platform.isAndroid) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (HttpClient client) {
          client.userAgent = null;
          return null;
        };
      }
    } else {}

    ///请求头
    Map<String, dynamic> httpHeaders;

    if (!kIsWeb) {
      ///手机端
      if (contentType == 'XML') {
        httpHeaders = xmlHeaders;
      } else if (contentType == 'PROTO') {
        ///弹幕
        httpHeaders = protoHeaders;
      } else if (contentType == 'UTF-8') {
        ///登录
        httpHeaders = utf8Headers;
      } else {
        httpHeaders = jsonHeaders;
      }
    } else {
      if (contentType == 'XML') {
        httpHeaders = xmlWebHeaders;
      } else if (contentType == 'PROTO') {
        ///弹幕
        httpHeaders = protoWebHeaders;
      } else {
        httpHeaders = jsonWebHeaders;
      }
    }

    ///全局拦截器
    ///创建默认的拦截器
    Interceptor dInter = InterceptorsWrapper(onRequest: (options, handler) {
      // print("请求拦截");
      return handler.next(options);
    }, onError: (error, handle) {
      // print("错误拦截");
      return handle.next(error);
    }, onResponse: (response, handler) {
      // print("响应拦截");
      handler.next(response);
    });
    List<Interceptor> inters = [dInter];
    //请求单独拦截器
    if (inter != null) {
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);

    ///发送网络请求
    try {
      dio.options.headers = httpHeaders;
      Response response;
      if (method == "POST") {
        ///post请求
        response = await dio.request(url, data: params);
      } else {
        ///get请求
        response = await dio.request(url);
      }

      ///打印请求的基本信息
      if (Constant.isDebug) {
        print("-------request begin-------");
        print("URL：${dio.options.baseUrl + url}");
        print("请求方式：${dio.options.method}");
        print("请求头：");
        dio.options.headers.forEach((key, value) {
          print("$key : $value");
        });
        print("响应类型：${dio.options.responseType}");
        if (method == "POST") {
          print("参数为$params");
        }
      } else {
        print("发布模式");
      }

      ///返回数据
      return response.data;
    } on DioError catch (e) {
      ///返回错误
      return Future.error(e);
    }
  }

  ///下载文件
  ///参考 https://www.jianshu.com/p/21b87161bf0f
  ///dio的download没有pause，resume功能，故不采用；采用flutter_downloader
// static Future download(
//   String url,
//   String savePath, {
//   Map<String, dynamic>? queryParams,
//   required CancelToken cancelToken,
//   dynamic data,
//   Options? options,
//   required void Function(int, int) onReceiveProgress,
// }) async {
//   Dio dio = Dio();
//   try {
//     return await dio.download(
//       url,
//       savePath,
//       queryParameters: queryParams,
//       cancelToken: cancelToken,
//       onReceiveProgress: onReceiveProgress,
//     );
//   } on DioError catch (e) {
//     if (CancelToken.isCancel(e)) {
//       SmartDialog.showToast('下载已取消!');
//     } else {
//       if (e.response != null) {
//         SmartDialog.showToast(e.response.toString());
//       }
//     }
//   } on Exception catch (e) {
//     SmartDialog.showToast(e.toString());
//   }
// }
}
