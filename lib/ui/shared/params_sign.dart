import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_bilibili/core/service/utils/constant.dart';

class ParamsSign {
  ///获取参数的sign值
  static String getSign(Map<String, dynamic> query) {
    ///按照key排序
    var sortedKeys = query.keys.toList()..sort();
    Map<String, dynamic> sortMap = {};
    for (var element in sortedKeys) {
      sortMap[element] = query[element];
    }

    ///参数序列化
    String content = paramsSerialization(sortMap);

    ///拼上appsec，并MD5加密
    var sign = md5
        .convert(const Utf8Encoder().convert(content + Constant.appSec))
        .toString();
    return sign;
  }

  ///参数序列化（拼上？和&）
  static String paramsSerialization(Map<String, dynamic> sortMap) {
    String content = "";
    sortMap.forEach((key, value) {
      ///urlEncode将string转为url可识别的string
      content += (key + "=" + urlEncode(value) + "&");
    });
    content = content.substring(0, content.length - 1);
    return content;
  }

  ///转为url格式的string
  static String urlEncode(String text) {
    text = text.replaceAll(RegExp(r'/'), "%2F");
    text = text.replaceAll(RegExp(r'\n'), "%0A");
    text = text.replaceAll(RegExp(r'='), "%3D");
    text = text.replaceAll(RegExp(r':'), "%3A");
    text = text.replaceAll(RegExp(r'"'), "%22");
    text = text.replaceAll(RegExp(r'{'), "%7B");
    text = text.replaceAll(RegExp(r','), "%2C");
    text = text.replaceAll(RegExp(r'}'), "%7D");

    ///替换加号要使用转义字符
    text = text.replaceAll(RegExp('\\+'), "%2B");
    return text;
  }
}
