import 'dart:io';

import 'package:bilibili_getx/core/permission/bilibili_permission.dart';
import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';
import 'package:flutter_bmflocation/flutter_bmflocation.dart';
import 'package:get/get.dart';

import 'bai_du_map_location_state.dart';

class BaiDuMapLocationLogic extends GetxController {
  final BaiDuMapLocationState state = BaiDuMapLocationState();

  @override
  void onReady() {
    ///初始化百度地图
    initBaiduMap();

    ///请求权限
    BilibiliPermission.requestBaiDuMapLocationPermissions();
    super.onReady();
  }

  void initBaiduMap() {
    /// 设置用户是否同意SDK隐私协议
    /// since 3.1.0 开发者必须设置
    BMFMapSDK.setAgreePrivacy(true);

    /// 百度地图sdk初始化鉴权
    if (kIsWeb) {
    } else {
      if (Platform.isIOS) {
        BMFMapSDK.setApiKeyAndCoordType(
            '5QpeQ5RIobMHo8tiVDWgzuay5z2mClbD', BMF_COORD_TYPE.BD09LL);
      } else if (Platform.isAndroid) {
        /// Android 目前不支持接口设置Apikey,
        /// 请在主工程的Manifest文件里设置，详细配置方法请参考官网(https://lbsyun.baidu.com/)demo
        BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
      }
    }

    state.locationPlugin.setAgreePrivacy(true).then((value) {
      if (Constant.isDebug) {
        print("---是否同意隐私政策：$value");
      }
    });

    ///设置定位参数并开始
    setLocOptionAndStart();

    ///开始定位
    state.locationPlugin.startLocation().then((value) {
      if (Constant.isDebug) {
        print("开始连续定位:$value");
      }
    });
  }

  void setLocOptionAndStart() {
    /// 设置ios端ak, android端ak可以直接在清单文件中配置
    state.locationPlugin.authAK("5QpeQ5RIobMHo8tiVDWgzuay5z2mClbD");

    /// android 端设置定位参数
    Map androidMap = initAndroidOptions().getMap();
    Map iosMap = initIOSOptions().getMap();
    state.locationPlugin.prepareLoc(androidMap, iosMap);

    ///监听结果
    state.locationPlugin.seriesLocationCallback(
        callback: (BaiduLocation result) {
      if (Constant.isDebug) {
        print("纬度${result.latitude}");
        print("经度${result.longitude}");
      }

      ///获取以该坐标为原点的半径xm内的POI
      getBaiduMapPoiList(result.latitude!, result.longitude!);
    });
  }

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
        scanspan: 10000);
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
      /// 允许的话是可以进行后台定位的，但需要项目
      /// 配置允许后台定位，否则会报错，具体参考开发文档
      allowsBackgroundLocationUpdates: true,

      /// 设定定位的最小更新距离
      distanceFilter: 10,
    );
    return options;
  }

  ///获取以经度纬度为中心的附近的POI
  void getBaiduMapPoiList(double latitude, double longitude) async {
    // 构造检索参数
    BMFPoiNearbySearchOption poiNearbySearchOption = BMFPoiNearbySearchOption(
        keywords: <String>['学校', '市'],
        location: BMFCoordinate(latitude, longitude),
        radius: 1000,
        isRadiusLimit: true,
        scope: BMFPoiSearchScopeType.DETAIL_INFORMATION);

    /// 检索实例
    BMFPoiNearbySearch nearbySearch = BMFPoiNearbySearch();

    /// 检索回调
    nearbySearch.onGetPoiNearbySearchResult(
        callback: (BMFPoiSearchResult result, BMFSearchErrorCode errorCode) {
      if (errorCode != BMFSearchErrorCode.NO_ERROR) {
        var error = "检索失败" "errorCode:${errorCode.toString()}";
        if (Constant.isDebug) {
          print(error);
        }
        return;
      }
      if (Constant.isDebug) {
        print(result);
      }
      state.poiInfoList = result.poiInfoList!;
      update();
    });

    /// 发起检索
    bool result = await nearbySearch.poiNearbySearch(poiNearbySearchOption);
    if (Constant.isDebug) {
      if (result) {
        print("发起检索成功");
      } else {
        print("发起检索失败");
      }
    }
  }
}