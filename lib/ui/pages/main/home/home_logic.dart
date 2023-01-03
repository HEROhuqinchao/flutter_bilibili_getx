import 'dart:async';
import 'dart:io';

import 'package:bilibili_getx/ui/pages/main/main_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../core/I18n/str_res_keys.dart';
import '../../../../core/model/account_mine.dart';
import '../../../../core/service/request/home_request.dart';
import '../../../../core/service/request/login_request.dart';
import '../../../../core/service/utils/constant.dart';
import '../../../../core/shared_preferences/bilibili_shared_preference.dart';
import '../../../../core/shared_preferences/shared_preference_util.dart';
import '../../../shared/app_theme.dart';
import '../../../shared/global_key_util.dart';
import '../../../shared/image_asset.dart';
import '../../../shared/params_sign.dart';
import '../../../widgets/bilibili_scroll.dart';
import 'home_state.dart';
import 'home_view.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  @override
  void onInit() {
    initHomeUserInfo();
    super.onInit();
  }

  @override
  void onReady() {
    ///判断是否同意用户协议
    if (state.tempUserAgreement == false) {
      initUserAgreement();
    }

    ///判断是否同意青少年模式
    if (state.tempTeenagerMode == false && state.tempUserAgreement == true) {
      showTeenagerModeDialog();
    }
    Future.delayed(const Duration(seconds: 1), () {
      initHomeSliverAppBarHeightY();
    });

    ///搜索推荐关键字
    fetchSearchSquare();
    super.onReady();
  }

  ///搜索推荐关键字
  void fetchSearchSquare() {
    Map<String, String> params = {
      'appkey': '1d8b6e7d45233436',
      'build': '7110300',
      'c_locale': 'zh_CN',
      'channel': 'bili',
      'disable_rcmd': '0',
      'from': '0',
      'limit': '10',
      'mobi_app': 'android',
      'platform': 'android',
      's_locale': 'zh_CN',
      'show': '0',
      'statistics':
          '%7B%22appId%22%3A1%2C%22platform%22%3A3%2C%22version%22%3A%227.11.0%22%2C%22abtest%22%3A%22%22%7D',
      'ts': '1672272837',
      // 'sign': '9d68cfe8ad480bc03cd86e174340c9bd',
    };
    HYHomeRequest.fetchSearchSquareData(params).then((value) {
      if (value.code == 0) {
        state.firstSearchKey = value.data!.last.data!.list!.first.title!;
        update();
      }
    });
  }

  ///查找是否同意了用户协议
  initUserAgreement() {
    ///判断本地协议是否同意
    state.tempUserAgreement = SharedPreferenceUtil.getBool(
        BilibiliSharedPreference.appUserAgreementPrivatePolicy)!;
    if (state.tempUserAgreement == false) {
      showUserAgreementDialog();
    }
  }

  ///弹出用户协议对话框
  void showUserAgreementDialog() {
    SmartDialog.show(
      clickMaskDismiss: false,
      builder: (context) {
        return Card(
          child: Container(
            width: 250.w,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15).r,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  SR.userAgreementAndPrivacyPolicyTips.tr.toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.sp),
                  textAlign: TextAlign.center,
                ),
                10.verticalSpace,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(2.r)),
                    color: HYAppTheme.norGrayColor.withOpacity(.2),
                  ),
                  height: 130.h,
                  padding: EdgeInsets.zero,
                  child: BilibiliScroll(
                    scrollBar: buildBilibiliScrollBar(),
                    child: buildBilibiliScrollChild(),
                  ),
                ),
                8.verticalSpace,
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: SR.userAgreementDetailDescText01.tr,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: HYAppTheme.norGrayColor,
                        ),
                      ),
                      TextSpan(
                        text: SR.userAgreementDetailDescText02.tr.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: SR.userAgreementText03.tr,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: HYAppTheme.norGrayColor,
                        ),
                      ),
                      TextSpan(
                        text: SR.userAgreementDetailDescText03.tr.toUpperCase(),
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: SR.userAgreementDetailDescText04.tr,
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: HYAppTheme.norGrayColor,
                        ),
                      ),
                    ],
                  ),
                ),
                5.verticalSpace,
                GestureDetector(
                  onTap: () {
                    SmartDialog.showToast("不同意就没法用了呦~");
                    if (kIsWeb) {
                      Get.offAndToNamed(MainScreen.routeName);
                    } else {
                      if (Platform.isAndroid || Platform.isIOS) {
                        ///退出APP(不同意协议就退出）
                        SystemNavigator.pop();
                      } else if (Platform.isWindows) {
                        Get.offAndToNamed(MainScreen.routeName);
                      }
                    }
                  },
                  child: Text(
                    SR.disagree.tr,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: HYAppTheme.norGrayColor,
                    ),
                  ),
                ),
                8.verticalSpace,
                GestureDetector(
                  onTap: () {
                    ///同意用户协议后，记录键值对
                    SmartDialog.dismiss();
                    SharedPreferenceUtil.setBool(
                        BilibiliSharedPreference.appUserAgreementPrivatePolicy,
                        true);
                    state.tempUserAgreement = true;

                    ///青少年模式弹框
                    state.tempTeenagerMode = SharedPreferenceUtil.getBool(
                        BilibiliSharedPreference.teenagerMode)!;
                    if (state.tempTeenagerMode == false) {
                      Future.delayed(const Duration(seconds: 1), () {
                        showTeenagerModeDialog();
                      });
                    }
                    update();
                  },
                  child: Container(
                    color: HYAppTheme.norMainThemeColors,
                    padding: const EdgeInsets.symmetric(vertical: 8).r,
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    child: Text(
                      SR.agree.tr.toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildBilibiliScrollBar() {
    return Container(
      margin: EdgeInsets.only(right: 2.r, top: 2.r, bottom: 2.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2.r)),
        color: HYAppTheme.norMainThemeColors.withOpacity(.5),
      ),
      height: 30.r,
      width: 4.r,
    );
  }

  Widget buildBilibiliScrollChild() {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Text(
          SR.userAgreementDetailDesc.tr,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }

  ///青少年模式弹框
  void showTeenagerModeDialog() {
    SmartDialog.show(
      builder: (ctx) {
        return Card(
          shape: RoundedRectangleBorder(
              borderRadius: const BorderRadius.all(Radius.circular(8)).r),
          child: Container(
            width: 250.w,
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15).r,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  ImageAssets.teenagerModePNG,
                  width: 50.r,
                  height: 50.r,
                ),
                15.verticalSpace,
                Text(
                  SR.teenagerModeDetailDesc.tr,
                  style: TextStyle(
                    color: HYAppTheme.norGrayColor,
                    fontSize: 12.sp,
                  ),
                ),
                10.verticalSpace,
                Text(
                  SR.goIntoTeenMode.tr,
                  style: TextStyle(
                    color: HYAppTheme.norGrayColor,
                    fontSize: 12.sp,
                  ),
                ),
                15.verticalSpace,
                GestureDetector(
                  onTap: () {
                    SmartDialog.dismiss();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 5.r),
                    width: 220.w,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(const Radius.circular(5).r),
                        border: Border.all(
                            color: HYAppTheme.norGrayColor.withOpacity(.4))),
                    child: Text(
                      SR.iKnowIt.tr.toUpperCase(),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
      clickMaskDismiss: false,
    );
  }

  ///接受用户个人信息
  void initHomeUserInfo() {
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
      state.userLogo = value.data.face;
      update();
    });
  }

  ///获取SliverAppBar的位置
  void initHomeSliverAppBarHeightY() {}

  void expandOrShrinkAppBar(ScrollNotification notification) {
    if (notification.metrics.axisDirection == AxisDirection.down ||
        notification.metrics.axisDirection == AxisDirection.up) {
      if (notification is ScrollStartNotification) {
        state.start = notification.metrics.pixels;
      }
      if (notification is ScrollUpdateNotification) {
        state.end = notification.metrics.pixels;
        double temp = state.appBarHeight + (state.start - state.end) / 40;
        if (temp < 0) {
          temp = 0;
        }
        if (temp > 0.08.sh) {
          temp = 0.08.sh;
        }
        state.appBarHeight = temp;
        update();
      }
      // if(notification is ScrollEndNotification) {
      //   state.end = notification.metrics.pixels;
      //   if(state.end - state.start < -0.08.sh && state.appBarHeight != 0.08.sh) {
      //     state.appBarHeight = 0.08.sh;
      //     update();
      //   }
      //   if(state.end - state.start > 0.08.sh && state.appBarHeight != 0) {
      //     state.appBarHeight = 0;
      //     update();
      //   }
      // }
    }
  }
}
