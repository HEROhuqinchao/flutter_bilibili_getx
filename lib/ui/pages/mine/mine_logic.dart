import 'package:get/get.dart';

import '../../../core/model/account_mine.dart';
import '../../../core/service/request/login_request.dart';
import '../../../core/service/utils/constant.dart';
import '../../../core/shared_preferences/bilibili_shared_preference.dart';
import '../../../core/shared_preferences/shared_preference_util.dart';
import '../../shared/params_sign.dart';
import 'mine_state.dart';

class MineLogic extends GetxController {
  final MineState state = MineState();

  @override
  void onInit() {
    iniAccountMine();
    super.onInit();
  }

  @override
  void onReady() {
    iniAccountMine();
    super.onReady();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  ///接受用户个人信息
  void fetchMineUserInfo(HYAccountMineModel accountMineData) {
    state.accountMineData = accountMineData;
    state.isLogin =
        SharedPreferenceUtil.getBool(BilibiliSharedPreference.isLogin) ?? false;
    state.finishLoading = true;
  }

  ///初始化数据
  void iniAccountMine() {
    state.isLogin =
        SharedPreferenceUtil.getBool(BilibiliSharedPreference.isLogin) ?? false;

    ///获取我的界面的数据
    Map<String, dynamic> params = {
      'appkey': Constant.appKey,
      'build': '6720300',
      'mobi_app': 'android',
      'platform': 'android',
      'bili_link_new': '1',
      'c_locale': 'zh_CN',
      'channel': 'html5_search_baidu',
      'disable_rcmd': '0',
      's_locale': 'zh_CN',
      'statistics':
          '%7B%22appId%22%3A1%2C%22platform%22%3A3%2C%22version%22%3A%226.72.0%22%2C%22abtest%22%3A%22%22%7D',
      'ts': '1659073412'
    };

    ///如果已登录，则加上access_Key字段
    if (state.isLogin == true) {
      String? accessKey =
          SharedPreferenceUtil.getString(BilibiliSharedPreference.accessToken);
      final accessKeyEntry = <String, dynamic>{'access_key': accessKey!};
      params.addEntries(accessKeyEntry.entries);
    }

    ///加上sign字段
    final signEntry = <String, dynamic>{'sign': ParamsSign.getSign(params)};
    params.addEntries(signEntry.entries);
    HYLoginRequest.getAccountMineData(params).then((value) {
      state.accountMineData = value;
      state.isLogin =
          SharedPreferenceUtil.getBool(BilibiliSharedPreference.isLogin) ??
              false;
      state.finishLoading = true;
      update();
    });
  }
}
