import '../../../core/model/account_mine.dart';
import '../../../core/shared_preferences/bilibili_shared_preference.dart';
import '../../../core/shared_preferences/shared_preference_util.dart';

class MineState {
  late bool isLogin;
  late bool finishLoading;

  ///用户的基本数据
  late HYAccountMineModel accountMineData;

  MineState() {
    ///获取登录状态
    isLogin =
        SharedPreferenceUtil.getBool(BilibiliSharedPreference.isLogin) ?? false;

    ///加载是否完成
    finishLoading = false;
  }
}
