import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/I18n/str_res_keys.dart';
import '../../../core/shared_preferences/bilibili_shared_preference.dart';
import '../../../core/shared_preferences/shared_preference_util.dart';
import '../../shared/app_theme.dart';
import '../../shared/image_asset.dart';
import '../../widgets/bilibili_scroll.dart';
import 'main_state.dart';

class MainLogic extends GetxController {
  final MainState state = MainState();
  ///权限获取
  void requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.phone,
      Permission.storage,
      Permission.location,
      Permission.notification,
    ].request();
  }
  ///更新当前下标
  void updateCurrentIndex(index) {
    state.currentIndex = index;
    ///调用update()来提醒GetBuilder更新界面
    update();
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
    Get.dialog(Card(
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
                ///退出APP(不同意协议就退出）
                SystemNavigator.pop();
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
            TextButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 5).r),
                  backgroundColor: MaterialStateProperty.all(
                      HYAppTheme.norMainThemeColors)),
              onPressed: () {
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
                padding: const EdgeInsets.symmetric(vertical: 4).r,
                alignment: AlignmentDirectional.center,
                width: double.infinity,
                child: Text(
                  SR.agree.tr.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: HYAppTheme.xSmallFontSize,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
    // SmartDialog.show(
    //   clickMaskDismiss: false,
    //   builder: (context) {
    //     return Card(
    //       child: Container(
    //         width: 250.w,
    //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15).r,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Text(
    //               SR.userAgreementAndPrivacyPolicyTips.tr.toUpperCase(),
    //               style: TextStyle(
    //                   color: Colors.black,
    //                   fontWeight: FontWeight.normal,
    //                   fontSize: HYAppTheme.xSmallFontSize),
    //               textAlign: TextAlign.center,
    //             ),
    //             10.verticalSpace,
    //             Container(
    //               decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.all(Radius.circular(2.r)),
    //                 color: HYAppTheme.norGrayColor.withOpacity(.2),
    //               ),
    //               height: 130.h,
    //               padding: EdgeInsets.zero,
    //               child: BilibiliScroll(
    //                 scrollBar: buildBilibiliScrollBar(),
    //                 child: buildBilibiliScrollChild(),
    //               ),
    //             ),
    //             8.verticalSpace,
    //             Text.rich(
    //               TextSpan(
    //                 children: [
    //                   TextSpan(
    //                     text: SR.userAgreementDetailDescText01.tr,
    //                     style: TextStyle(
    //                       fontSize: HYAppTheme.xxxSmallFontSize,
    //                       color: HYAppTheme.norGrayColor,
    //                     ),
    //                   ),
    //                   TextSpan(
    //                     text: SR.userAgreementDetailDescText02.tr.toUpperCase(),
    //                     style: TextStyle(
    //                       fontSize: HYAppTheme.xxxSmallFontSize,
    //                       color: Colors.blue,
    //                       fontWeight: FontWeight.normal,
    //                     ),
    //                   ),
    //                   TextSpan(
    //                     text: SR.userAgreementText03.tr,
    //                     style: TextStyle(
    //                       fontSize: HYAppTheme.xxxSmallFontSize,
    //                       color: HYAppTheme.norGrayColor,
    //                     ),
    //                   ),
    //                   TextSpan(
    //                     text: SR.userAgreementDetailDescText03.tr.toUpperCase(),
    //                     style: TextStyle(
    //                       fontSize: HYAppTheme.xxxSmallFontSize,
    //                       color: Colors.blue,
    //                       fontWeight: FontWeight.normal,
    //                     ),
    //                   ),
    //                   TextSpan(
    //                     text: SR.userAgreementDetailDescText04.tr,
    //                     style: TextStyle(
    //                       fontSize: HYAppTheme.xxxSmallFontSize,
    //                       color: HYAppTheme.norGrayColor,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             5.verticalSpace,
    //             GestureDetector(
    //               onTap: () {
    //                 ///退出APP(不同意协议就退出）
    //                 SystemNavigator.pop();
    //               },
    //               child: Text(
    //                 SR.disagree.tr,
    //                 style: TextStyle(
    //                   fontSize: HYAppTheme.xxSmallFontSize,
    //                   color: HYAppTheme.norGrayColor,
    //                 ),
    //               ),
    //             ),
    //             8.verticalSpace,
    //             TextButton(
    //               style: ButtonStyle(
    //                   padding: MaterialStateProperty.all(
    //                       const EdgeInsets.symmetric(vertical: 5).r),
    //                   backgroundColor: MaterialStateProperty.all(
    //                       HYAppTheme.norMainThemeColors)),
    //               onPressed: () {
    //                 ///同意用户协议后，记录键值对
    //                 SmartDialog.dismiss();
    //                 SharedPreferenceUtil.setBool(
    //                     BilibiliSharedPreference.appUserAgreementPrivatePolicy,
    //                     true);
    //
    //                 ///青少年模式弹框
    //                 state.tempTeenagerMode = SharedPreferenceUtil.getBool(
    //                     BilibiliSharedPreference.teenagerMode)!;
    //                 if (state.tempUserAgreement == false) {
    //                   Future.delayed(const Duration(seconds: 1), () {
    //                     showTeenagerModeDialog();
    //                   });
    //                 }
    //               },
    //               child: Container(
    //                 padding: const EdgeInsets.symmetric(vertical: 4).r,
    //                 alignment: AlignmentDirectional.center,
    //                 width: double.infinity,
    //                 child: Text(
    //                   SR.agree.tr.toUpperCase(),
    //                   style: TextStyle(
    //                       color: Colors.white,
    //                       fontSize: HYAppTheme.xSmallFontSize,
    //                       fontWeight: FontWeight.bold),
    //                 ),
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //     );
    //   },
    // );
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
    Get.dialog(Card(
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
                  fontWeight: FontWeight.bold),
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
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    ));
    // Future.delayed(Duration(seconds: 1), () {
    //   SmartDialog.show(
    //     builder: (ctx) {
    //       return Card(
    //         shape: RoundedRectangleBorder(
    //             borderRadius: const BorderRadius.all(Radius.circular(8)).r),
    //         child: Container(
    //           width: 250.w,
    //           padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15).r,
    //           child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Image.asset(
    //                 ImageAssets.teenagerModePNG,
    //                 width: 50.r,
    //                 height: 50.r,
    //               ),
    //               15.verticalSpace,
    //               Text(
    //                 SR.teenagerModeDetailDesc.tr,
    //                 style: TextStyle(
    //                   color: HYAppTheme.norGrayColor,
    //                   fontSize: HYAppTheme.xxSmallFontSize,
    //                 ),
    //               ),
    //               10.verticalSpace,
    //               Text(
    //                 SR.goIntoTeenMode.tr,
    //                 style: TextStyle(
    //                     color: HYAppTheme.norGrayColor,
    //                     fontSize: HYAppTheme.xxSmallFontSize,
    //                     fontWeight: FontWeight.bold),
    //               ),
    //               15.verticalSpace,
    //               GestureDetector(
    //                 onTap: () {
    //                   SmartDialog.dismiss();
    //                 },
    //                 child: Container(
    //                   alignment: Alignment.center,
    //                   padding: EdgeInsets.symmetric(vertical: 5.r),
    //                   width: 220.w,
    //                   decoration: BoxDecoration(
    //                       borderRadius:
    //                       BorderRadius.all(const Radius.circular(5).r),
    //                       border: Border.all(
    //                           color: HYAppTheme.norGrayColor.withOpacity(.4))),
    //                   child: Text(
    //                     SR.iKnowIt.tr.toUpperCase(),
    //                     style: TextStyle(
    //                         fontSize: HYAppTheme.xxSmallFontSize,
    //                         color: Colors.black,
    //                         fontWeight: FontWeight.bold),
    //                   ),
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       );
    //     },
    //     clickMaskDismiss: false,
    //   );
    // });

  }
}
