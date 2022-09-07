import 'dart:io';
import 'package:bilibili_getx/ui/pages/main/home/home_logic.dart';
import 'package:bilibili_getx/ui/pages/main/home/home_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/service/request/live_room_list_request.dart';
import '../../../../../core/service/utils/constant.dart';
import '../../../../shared/global_key_util.dart';
import '../../../../shared/params_sign.dart';
import 'live_state.dart';

class LiveLogic extends GetxController {
  final LiveState liveState = LiveState();

  @override
  void onReady() {
    if (!kIsWeb) {
      if (Platform.isWindows) {
        // initWindowsLiveAppInterfaceV2IndexFeedData();
        initAndroidXliveAppInterfaceV2IndexFeedData();
      } else if (Platform.isAndroid) {
        initAndroidXliveAppInterfaceV2IndexFeedData();
      }
    } else {}
    super.onReady();
  }

  ///初始化Android数据
  void initAndroidXliveAppInterfaceV2IndexFeedData() {
    Map<String, dynamic> params = {
      'actionKey': 'appkey',
      'ad_extra':
          'E841CC0E08DC5B3A267215E560569AC2ACE218873D1B2AC09D10994010F9D2A0C6DE7F8B0863E4156E8C04478C9BD56447D2D50236AC750E9CCF5E8C46DC316F7092EF6BA65657AF9393B1AD006F6D5AF4B9F19237A4D10FDFBBA3D470CDFC17AD7DC89EBA18A0D66DB0BEF88A71EC5DDDDB95C88222EB0D0FD326502F84A1AD047C9CD948B5D78610E1724901F7B98594FEBA28BBD48D06A888B737A8D841826E8350298521A5D7FF91F72E79AC940BEEC3E7FBD1730E43E0F3A9F53F6A3F2AEA1226C5D871D181DFCC1040AF399D504FCC2173F8537BE06B766796F823EDFF507FB390498EF25F1FBCE54B1DFBBCF57569DF0BD86DC67F2B7A0D19C569D2FE9F5E59F5A70E9453D282E2602BD2A3C4CDA71A87453D897D7BCCD8BCE75884E02AEDAF85631A60B130ED3BC2E52640CEAFC3A0282859C5FB76AD1BB4650C4D358CB658790E5044CCCBB5D861F357011F6D846D2A2440B50990F41123A79F451CA65545A66435DE6CE7C8EDA8C2F818F657CC3DCF61A86C5973ABA1317586884146580A04153C23F1E9F5C881F00E845E0B8360997D06D24DA4C0ECC35DF898AE1E88BD90E4A3BF9A9647EFA92CC68D0E31162C4687E30C7918ED94F59499BD0602F9630048DA516F11F53C50EE426EEAD68ADE02C40A982FC7A57AD9576DBBD143076AC7C17B59EE9FACB55C0CE88979930760ADA4E92457E10D84809747F648FC2B810B4B9496E22B2FA7C6F23BD6DDDB976E06A361EA8D7D1CC891613E9B820C93E2F3999A67D9170EF678ECB51C63978106465D3DF119F75376FCFD9D0830891F120D636CA20920F90D3FBB17B5F3426ED06F3D4AAA6F7CBD058125B3177E372E5CC3C187EA264A70C972F704114D10EAB1056009DB80B0E469AF9F5DA3B2066BE16727E62699792D42BEC8DC73CE9A32B4D583B76F984FC387BF2B579AF8920BAAA977026F853098C049BFEEB66B0C84FF2884D487CDA58A54D595871DB6',
      'appkey': Constant.appKey,
      'build': '6860300',
      'c_locale': 'zh_CN',
      'channel': 'bili',
      'device': 'android',
      'device_name': 'MuMu',
      'disable_rcmd': '0',
      'https_url_req': '0',
      'is_refresh': '0',
      'login_event': '1',
      'mobi_app': 'android',
      'module_select': '0',
      'network': 'wifi',
      'out_ad_name': '',
      'page': '1',
      'platform': 'android',
      'qn': '0',
      'relation_page': '1',
      's_locale': 'zh_CN',
      'scale': 'xhdpi',
      'statistics':
          '%7B%22appId%22%3A1%2C%22platform%22%3A3%2C%22version%22%3A%226.86.0%22%2C%22abtest%22%3A%22%22%7D',
      'ts': '1662443315',
      'version': '6.86.0',
    };

    ///加上sign字段
    final signEntry = <String, dynamic>{'sign': ParamsSign.getSign(params)};
    params.addEntries(signEntry.entries);
    HYLiveRequest.getXliveAppInterfaceV2IndexFeedData(params).then((value) {
      liveState.cardList = value.data.cardList;
      liveState.isLoadingLiveData = false;
      update();
    });
  }

  // ///选择标签
  // void selectLabelAndFetchData(int index) {
  //   liveState.liveTabBarHeightY = renderObjectY(liveState.liveTabBarGlobalKey)!;
  //   liveState.scrollController.jumpTo(liveState.liveTabBarHeightY);
  //   update();
  // }

  ///初始化Windows数据
  void initWindowsLiveAppInterfaceV2IndexFeedData() {}
}
