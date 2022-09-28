import 'package:flutter/cupertino.dart';
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';

class SearchLocationState {
  late bool locateSuccess;
  late LocationFlutterPlugin locationFlutterPlugin;
  late String key;
  late double latitude;
  late double longitude;
  late List<BMFPoiInfo> poiInfoList;
  late int pageIndex;
  late int pageSize;
  late ScrollController scrollController;
  SearchLocationState() {
    locateSuccess = false;
    locationFlutterPlugin = LocationFlutterPlugin();
    key = "";
    latitude = -1;
    longitude = -1;
    poiInfoList = [];
    pageSize = 10;
    pageIndex = 0;
    scrollController = ScrollController();
  }
}
