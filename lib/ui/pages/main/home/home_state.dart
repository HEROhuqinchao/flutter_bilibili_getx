import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/shared_preferences/bilibili_shared_preference.dart';
import '../../../../core/shared_preferences/shared_preference_util.dart';
import '../../../widgets/primary_scroll_container.dart';
import 'home_view.dart';

class HomeState {
  ///推荐的搜索关键字
  late String firstSearchKey;

  ///是否同意青少年模式
  late bool tempTeenagerMode;

  ///是否同意用户协议
  late bool tempUserAgreement;

  ///用户头像
  late String userLogo;

  ///是否登录
  late bool isLogin;
  late ScrollController scrollController;

  late double appBarHeight;
  late double start;
  late double end;

  late GlobalKey<PrimaryScrollContainerState> keyRecommend;
  late GlobalKey<PrimaryScrollContainerState> keyLive;
  late GlobalKey<PrimaryScrollContainerState> keyHot;
  late GlobalKey<PrimaryScrollContainerState> keyComic;
  late GlobalKey<PrimaryScrollContainerState> keyMovie;
  late GlobalKey<PrimaryScrollContainerState> keyCovid;
  late GlobalKey<PrimaryScrollContainerState> keyWay;
  late List<GlobalKey<PrimaryScrollContainerState>> scrollChildKeys;

  HomeState() {
    firstSearchKey = "";
    tempTeenagerMode = false;

    ///判断本地协议是否同意
    tempUserAgreement = SharedPreferenceUtil.getBool(
        BilibiliSharedPreference.appUserAgreementPrivatePolicy)!;
    userLogo = "";
    isLogin = SharedPreferenceUtil.getBool(BilibiliSharedPreference.isLogin)!;
    scrollController = ScrollController();
    appBarHeight = 0.08.sh;
    keyRecommend = GlobalKey<PrimaryScrollContainerState>();
    keyLive = GlobalKey<PrimaryScrollContainerState>();
    keyHot = GlobalKey<PrimaryScrollContainerState>();
    keyComic = GlobalKey<PrimaryScrollContainerState>();
    keyMovie = GlobalKey<PrimaryScrollContainerState>();
    keyCovid = GlobalKey<PrimaryScrollContainerState>();
    keyWay = GlobalKey<PrimaryScrollContainerState>();
    scrollChildKeys = [
      keyRecommend,
      keyLive,
      keyHot,
      keyComic,
      keyMovie,
      keyCovid,
      keyWay
    ];
  }
}
