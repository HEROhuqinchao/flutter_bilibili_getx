import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:get/get.dart';

import '../../../../../core/service/utils/constant.dart';
import 'search_location_state.dart';

class SearchLocationLogic extends GetxController {
  final SearchLocationState state = SearchLocationState();

  @override
  void onReady() {
    initListView();
    fetchUserLocation();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  initListView() {
    state.scrollController.addListener(() {
      if(state.scrollController.position.pixels == state.scrollController.position.maxScrollExtent) {
        fetchSearchLocationResult();
      }
    });
  }

  ///设置定位参数
  BaiduLocationAndroidOption initAndroidOptions() {
    BaiduLocationAndroidOption options = BaiduLocationAndroidOption(

        /// 定位模式，可选的模式有高精度、仅设备、仅网络。默认为高精度模式
        locationMode: BMFLocationMode.batterySaving,

        /// 是否需要返回地址信息
        isNeedAddress: true,

        /// 是否需要返回海拔高度信息
        isNeedAltitude: true,

        /// 是否需要返回周边poi信息
        isNeedLocationPoiList: true,

        /// 是否需要返回新版本rgc信息
        isNeedNewVersionRgc: true,

        /// 是否需要返回位置描述信息
        isNeedLocationDescribe: true,

        /// 是否使用gps
        openGps: true,

        /// 可选，设置场景定位参数，包括签到场景、运动场景、出行场景
        locationPurpose: BMFLocationPurpose.sport,

        /// 坐标系
        coordType: BMFLocationCoordType.bd09ll,

        /// 设置发起定位请求的间隔，int类型，单位ms
        /// 如果设置为0，则代表单次定位，即仅定位一次，默认为0
        scanspan: 5000);
    return options;
  }

  BaiduLocationIOSOption initIOSOptions() {
    BaiduLocationIOSOption options = BaiduLocationIOSOption(
      /// 坐标系
      coordType: BMFLocationCoordType.bd09ll,

      /// 位置获取超时时间
      locationTimeout: 10,

      /// 获取地址信息超时时间
      reGeocodeTimeout: 10,

      /// 应用位置类型 默认为automotiveNavigation
      activityType: BMFActivityType.automotiveNavigation,

      /// 设置预期精度参数 默认为best
      desiredAccuracy: BMFDesiredAccuracy.best,

      /// 是否需要最新版本rgc数据
      isNeedNewVersionRgc: true,

      /// 指定定位是否会被系统自动暂停
      pausesLocationUpdatesAutomatically: false,

      /// 指定是否允许后台定位,
      /// 允许的话是可以进行后台定位的，但需要项目配置允许后台定位，否则会报错，具体参考开发文档
      allowsBackgroundLocationUpdates: true,

      /// 设定定位的最小更新距离
      distanceFilter: 10,
    );
    return options;
  }

  void fetchUserLocation() async {
    if (kIsWeb) {
    } else {
      if (Platform.isIOS) {
        ///接受定位回调
        state.locationFlutterPlugin.singleLocationCallback(
            callback: (BaiduLocation result) {
          ///result为定位结果
        });
      } else if (Platform.isAndroid) {
        ///接受定位回调
        state.locationFlutterPlugin.seriesLocationCallback(
            callback: (BaiduLocation result) {
          state.latitude = result.latitude!;
          state.longitude = result.longitude!;
          update();
        });
      }
      Map iosMap = initIOSOptions().getMap();
      Map androidMap = initAndroidOptions().getMap();

      state.locateSuccess =
          await state.locationFlutterPlugin.prepareLoc(androidMap, iosMap);

      ///开启定位
      if (Platform.isIOS) {
        state.locateSuccess = await state.locationFlutterPlugin
            .singleLocation({'isReGeocode': true, 'isNetworkState': true});
      } else if (Platform.isAndroid) {
        state.locateSuccess = await state.locationFlutterPlugin.startLocation();
      }
    }
  }

  void fetchSearchLocationResult() async {
    /// 构造检索参数
    BMFPoiNearbySearchOption poiNearbySearchOption = BMFPoiNearbySearchOption(
      keywords: <String>[state.key],
      location: BMFCoordinate(state.latitude, state.longitude),
      radius: 1000,
      isRadiusLimit: true,
      pageIndex: state.pageIndex,
      pageSize: state.pageSize,
      scope: BMFPoiSearchScopeType.DETAIL_INFORMATION
    );

    /// 检索实例
    BMFPoiNearbySearch nearbySearch = BMFPoiNearbySearch();

    /// 检索回调
    nearbySearch.onGetPoiNearbySearchResult(
        callback: (BMFPoiSearchResult result, BMFSearchErrorCode errorCode) {
      if (Constant.isDebug) {
        print(
            'poi周边检索回调 errorCode = ${errorCode}  \n result = ${result.toMap()}');
      }
      print(state.pageIndex);
      if(state.pageIndex < result.totalPageNum!) {
        state.poiInfoList.addAll(result.poiInfoList!);
        state.pageIndex ++;
        update();
      }
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

  void clearSearchLocationCache(value) {
    state.key = value;
    state.pageIndex = 0;
    state.poiInfoList.clear();
    update();
  }
}
