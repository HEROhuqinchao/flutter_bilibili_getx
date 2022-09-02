import 'dart:io';
import 'dart:ui';

import 'package:bilibili_getx/core/service/request/mall_request.dart';
import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../shared/params_sign.dart';
import 'mall_state.dart';

class MallLogic extends GetxController {
  final MallState state = MallState();

  @override
  void onInit() {
    ///初始化数据
    if(kIsWeb) {
      webFetchMallData();
    } else {
      if(Platform.isWindows) {
        webFetchMallData();
        androidFetchMallData();
      } else if(Platform.isAndroid) {
        androidFetchMallData();
      }
    }
    super.onInit();
  }

  @override
  void onClose() {
    state.customScrollViewController.dispose();
    state.gridViewController.dispose();
    super.onClose();
  }

  ///上滑时使标题渐渐消失
  void hideTitle(ScrollNotification notification) {
    double temp = notification.metrics.pixels;
    if(temp >= 0 && temp <= 100) {
      if(temp > 1) {
        temp = 1;
      }
      if(temp < 0) {
        temp = 0;
      }
      state.appBarOpacity = 1 - temp;
      update();
    }
  }

  ///鼠标悬浮于控件之上时，更改背景阴影等属性
  void mouseHoverAction(index) {
    state.backgroundSpreadRadius[index] = 4;
    state.backgroundBlurRadius[index] = 15;
    state.coverBottomGap[index] = 10.r;
    state.backgroundOffset[index] = Offset(-5, 20);
    update();
  }

  ///鼠标离开控件时，更改背景阴影等属性
  void mouseExitAction(index) {
    state.backgroundSpreadRadius[index] = 0;
    state.backgroundBlurRadius[index] = 0;
    state.coverBottomGap[index] = 0.r;
    state.backgroundOffset[index] = Offset(0, 0);
    update();
  }

  ///Android端获取数据
  void androidFetchMallData() {
    Map<String, dynamic> params = {
      // 'adExtra': 'A518A219AA5C66C59D64612C1B916898D229E2C569938B7441B21EE0008CAA1610732754547B42637329D4C2EB2DF6EA2926A82759C63CB6EB4B28821890FB54EDA307E6BFAFC3302264C643DC5EFE4D24B3809BCDE99C32418621B9DAB83244F94D1BB05C773BA78D13B19379492D7853E77215CD398FA6BF3948221207983EC2B2773C94E0F0B9F7D80D7C044C9932401065901E1AB0DA08461FD775376033647A5A91EE19CBB57C499E212232EBA2D8AF0554DFB03EAA7864B480B4A5A7A71BA35B5295E57EEA46F1C0190B9E3DCCCA38B46FA8CF6F79C348ED30A1F33E103C5D233CAF08076E32B6E01C127D0F7D007A035DDDA2CD6645FD376C8D9D4BC12C8D235A96D3A6FCA31DDD5CC6D99B0247A08E049F51D130EFE49851B682B74365E51F0AFF79198460C96DA24E316C2B8A87C1FCEBD3EA405495EA54731A3F1D1DD55BD95062BFA76DAC528B1B578AD7103C33FC441EE763F2D51E21E4B292E9234C7EFBA47AF2E11C84B64946DBDB1C120225B03B028426A335391FE1E979DA8806C058C29B3B33E80ECAA1AE96DC67C7BBACE4DAC3F81EFD864208701BAE5AE321290A0A77E91CAF3B1EB2AB91B22DFA1CD9A16AEC2E3907D891F85C9A2EEF2D61216E815ED3FC8DE5A3236FF35ED57F98C7E2A4AE145BCA0B71604B200F2D3261A38EDAAE8130AF2E895FF4FD4A7553239CE09174E32B9FC03E90D9DF93422517F6C6BE0A07A8796E5FDD2C858FCBDAF392FF624C52FAC173E0CE8F8BEEF337AA314782F7F710201B5BCAA5BB9042D50DF3F374FD0675A16938CF2C43CA2CEF2CDC8417829EFCF6507FDFB84B9C27AEA6AF4F16F84D7568BD780F6BC22ABC554A4374B1E46A86089D3EE62AD8A07C6D0C038A5B71150C80BBE033B5888B2CB2FF2E38CF6AA26FB1E6B99196B9AD666BEAF5D71A2E065AD37ECB1D80484B7754E2089C1A61586EFC82BF4658937C38ABCFAFF4B109DA80B1A878CF4A17EB31',
      "appkey": Constant.appKey,
      'brand': '',
      'build': '6720300',
      'c_locale': 'zh_CN',
      'channel': 'htAndroidml5_search_baidu',
      'cityCode': '440106',
      'disable_rcmd': '0',
      'feedType': '0',
      'mVersion': '133',
      'mallVersion': '6720300',
      'mobi_app': 'android',
      'pageNum': '1',
      'platform': 'android',
      's_locale': 'zh_CN',
      'statistics': '%7B%22appId%22%3A1%2C%22platform%22%3A3%2C%22version%22%3A%226.72.0%22%2C%22abtest%22%3A%22%22%7D',
      'tribeVersion': '0',
      'ts': '1661902346',
    };
    final signEntry = <String, dynamic>{
      "sign": ParamsSign.getSign(params)
    };
    params.addEntries(signEntry.entries);
    HYMallRequest.fetchAndroidMallData(params).then((value) {
      state.vo = value.data.vo;
      state.isLoadingMallData = false;
      update();
    });
  }

  void windowsFetchMallData() {}

  ///获取web端的数据
  void webFetchMallData() {
    HYMallRequest.fetchWebMallData().then((value) {
      state.total = value.data.total;
      // print(value.data.result?.length);
      state.result = value.data.result!;
      for (int i = 0; i < state.total; i++) {
        state.backgroundSpreadRadius.add(0);
        state.backgroundBlurRadius.add(0);
        state.coverBottomGap.add(0.r);
        state.backgroundOffset.add(Offset(0, 0));
      }
      state.isLoadingMallData = false;
      update();
    });
  }
}
