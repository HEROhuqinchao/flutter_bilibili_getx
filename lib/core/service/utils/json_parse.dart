import 'dart:convert';

import 'package:flutter/services.dart';
import '../../model/big_data_model.dart';

/// 获取本地的json数据，用于图表
class HYJsonParse {
  static Future<HyBigDataModel> getBigData() async {
    //1、加载json文件,loadString返回的类型是Future，所以是异步操作
    final jsonString = await rootBundle.loadString("assets/json/big_data.json");

    /**
     * decode解析，即将json转成map或list;
     * encode则反过来
     */
    //2、将jsonString转成Map/List
    final result = json.decode(jsonString);

    //3、将Map中的内哦荣转成一个个的对象
    return HyBigDataModel.fromJson(result);
  }

  static Future<HyBigDataModel> getBigData02() async {
    //1、加载json文件,loadString返回的类型是Future，所以是异步操作
    final jsonString =
        await rootBundle.loadString("assets/json/big_data02.json");
    //2、将jsonString转成Map/List
    final result = json.decode(jsonString);
    //3、将Map中的内哦荣转成一个个的对象
    return HyBigDataModel.fromJson(result);
  }
}
