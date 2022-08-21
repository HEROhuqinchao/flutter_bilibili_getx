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
import '../../../../core/shared_preferences/bilibili_shared_preference.dart';
import '../../../../core/shared_preferences/shared_preference_util.dart';
import '../../../shared/app_theme.dart';
import '../../../shared/image_asset.dart';
import '../../../widgets/bilibili_scroll.dart';
import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  // @override
  // void onInit() {
  //
  //   super.onInit();
  // }

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
    super.onReady();
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
                      fontSize: HYAppTheme.xSmallFontSize),
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
                          fontSize: HYAppTheme.xxxSmallFontSize,
                          color: HYAppTheme.norGrayColor,
                        ),
                      ),
                      TextSpan(
                        text: SR.userAgreementDetailDescText02.tr.toUpperCase(),
                        style: TextStyle(
                          fontSize: HYAppTheme.xxxSmallFontSize,
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: SR.userAgreementText03.tr,
                        style: TextStyle(
                          fontSize: HYAppTheme.xxxSmallFontSize,
                          color: HYAppTheme.norGrayColor,
                        ),
                      ),
                      TextSpan(
                        text: SR.userAgreementDetailDescText03.tr.toUpperCase(),
                        style: TextStyle(
                          fontSize: HYAppTheme.xxxSmallFontSize,
                          color: Colors.blue,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      TextSpan(
                        text: SR.userAgreementDetailDescText04.tr,
                        style: TextStyle(
                          fontSize: HYAppTheme.xxxSmallFontSize,
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
                      fontSize: HYAppTheme.xxSmallFontSize,
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

                    ///青少年模式弹框
                    state.tempTeenagerMode = SharedPreferenceUtil.getBool(
                        BilibiliSharedPreference.teenagerMode)!;
                    if (state.tempUserAgreement == false) {
                      Future.delayed(const Duration(seconds: 1), () {
                        showTeenagerModeDialog();
                      });
                    }
                  },
                  child: Container(
                    color: HYAppTheme.norMainThemeColors,
                    padding: const EdgeInsets.symmetric(vertical: 8).r,
                    alignment: AlignmentDirectional.center,
                    width: double.infinity,
                    child: Text(
                      SR.agree.tr.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: HYAppTheme.xSmallFontSize),
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
            fontSize: HYAppTheme.xxSmallFontSize,
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
                    fontSize: HYAppTheme.xxSmallFontSize,
                  ),
                ),
                10.verticalSpace,
                Text(
                  SR.goIntoTeenMode.tr,
                  style: TextStyle(
                    color: HYAppTheme.norGrayColor,
                    fontSize: HYAppTheme.xxSmallFontSize,
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
                        fontSize: HYAppTheme.xxSmallFontSize,
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
  void fetchHomeUserInfo(HYAccountMineModel accountMineData) {
    state.isLogin =
        SharedPreferenceUtil.getBool(BilibiliSharedPreference.isLogin) ?? false;
    state.userLogo = accountMineData.data.face;
    update();
  }
}
