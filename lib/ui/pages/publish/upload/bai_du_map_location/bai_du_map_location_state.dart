import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';

class BaiDuMapLocationState {
  late final LocationFlutterPlugin locationPlugin;
  late int mLocSuccessCount;
  late List<BMFPoiInfo> poiInfoList;

  BaiDuMapLocationState() {
    locationPlugin = LocationFlutterPlugin();
    poiInfoList = [];
    mLocSuccessCount = 0;
  }
}
