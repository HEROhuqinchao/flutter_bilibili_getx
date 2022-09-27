import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';
import 'package:get/get.dart';

import 'search_location_state.dart';

class SearchLocationLogic extends GetxController {
  final SearchLocationState state = SearchLocationState();

  @override
  void onReady() {
    fetchSearchLocationResult();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void fetchSearchLocationResult() async {
    /// 构造检索参数
    BMFPoiNearbySearchOption poiNearbySearchOption = BMFPoiNearbySearchOption(
        keywords: <String>['小吃', '酒店'],
        location: BMFCoordinate(40.049557, 116.279295),
        radius: 1000,
        isRadiusLimit: true);

    /// 检索实例
    BMFPoiNearbySearch nearbySearch = BMFPoiNearbySearch();

    /// 检索回调
    nearbySearch.onGetPoiNearbySearchResult(
        callback: (BMFPoiSearchResult result, BMFSearchErrorCode errorCode) {
      print(
          'poi周边检索回调 errorCode = ${errorCode}  \n result = ${result.toMap()}');

      /// 解析reslut，具体参考demo
    });

    /// 发起检索
    bool flag = await nearbySearch.poiNearbySearch(poiNearbySearchOption);

    // /// 构造检索参数
    // BMFPoiCitySearchOption poiCitySearchOption =
    //     BMFPoiCitySearchOption(city: '宁波', keyword: '小吃');
    //
    // /// 检索实例
    // BMFPoiCitySearch poiCitySearch = BMFPoiCitySearch();
    //
    // /// 检索回调
    // poiCitySearch.onGetPoiCitySearchResult(
    //     callback: (BMFPoiSearchResult result, BMFSearchErrorCode errorCode) {
    //   print('poi城市检索回调 errorCode = ${errorCode} \n result = ${result.toMap()}');
    //   /// 解析reslut，具体参考demo
    // });
    //
    // /// 发起检索
    // bool flag = await poiCitySearch.poiCitySearch(poiCitySearchOption);
  }
}
