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
      if(Platform.isAndroid) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (HttpClient client) {
          client.userAgent = null;
          return null;
        };
      }
    } else {

    }

    ///请求头
    Map<String, dynamic> httpHeaders;

    if(!kIsWeb) {
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
}
