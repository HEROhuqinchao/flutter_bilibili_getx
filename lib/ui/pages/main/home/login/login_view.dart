import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../../core/I18n/str_res_keys.dart';
import '../../../../shared/app_theme.dart';
import '../../../../shared/image_asset.dart';
import '../../../../widgets/rectangle_checkBox.dart';
import '../../../../widgets/timer_button.dart';
import 'login_logic.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/home/login";
  final logic = Get.find<LoginLogic>();
  final state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          elevation: .5,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: HYAppTheme.norTextColors,
              size: 18.sp,
            ),
          ),
          title: Text(
            state.loginTypeIsMessage == true
                ? SR.telRegisterAndLogin.tr.toUpperCase()
                : SR.passwordLogin.tr.toUpperCase(),
            style: TextStyle(
                fontSize: 14.sp,
                color: HYAppTheme.norTextColors,
                fontWeight: FontWeight.normal),
          ),
          actions: [
            ///右上角的密码登录
            GestureDetector(
              onTap: () {
                logic.changeLoginType();
              },
              child: Center(
                  child: Text(
                state.loginTypeIsMessage == true
                    ? SR.passwordLogin.tr
                    : SR.telRegisterAndLogin.tr,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: HYAppTheme.norTextColors,
                ),
              )),
            ),
            10.horizontalSpace,
          ],
        ),
        body: Column(
          children: [
            ///2233娘背景
            buildLoginImage(),

            ///地区
            state.loginTypeIsMessage == true ? buildLoginRegion() : Container(),

            ///电话号码
            state.loginTypeIsMessage == true
                ? buildLoginTel(context)
                : buildUserNameAndPassword(),

            15.verticalSpace,

            ///登录按钮
            state.loginTypeIsMessage == true
                ? buildVerifyLoginButton()
                : buildRegisterAndLoginButton(),
            15.verticalSpace,

            ///用户协议部分
            buildLoginAgreement(),
          ],
        ),

        ///防止键盘弹出超出边界
        resizeToAvoidBottomInset: false,
      );
    });
  }

  ///2233娘
  Widget buildLoginImage() {
    return Stack(
      children: [
        Center(
          child: Image.asset(
            ImageAssets.bilibiliPNG,
            width: 90.r,
            height: 90.r,
          ),
        ),
        Positioned(
          width: 90.r,
          height: 90.r,
          left: 0,
          bottom: 0,
          child: Image.asset(
              state.isInputPassword
                  ? ImageAssets.close22PNG
                  : ImageAssets.open22PNG,
              gaplessPlayback: true),
        ),
        Positioned(
          width: 90.r,
          height: 90.r,
          right: 0,
          bottom: 0,
          child: Image.asset(
              state.isInputPassword
                  ? ImageAssets.close33PNG
                  : ImageAssets.open33PNG,
              gaplessPlayback: true),
        ),
      ],
    );
  }

  ///地区（+86）
  Widget buildLoginRegion() {
    return GestureDetector(
      onTap: () {
        buildRegionDialog();
      },
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15).r,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                ///底部设置边框
                bottom:
                    BorderSide(width: 1.r, color: HYAppTheme.norWhite06Color),
              ),
            ),
            child: Text(
              state.regionList[state.regionIndex].region,
              style: const TextStyle(color: HYAppTheme.norTextColors),
            ),
          ),
          Positioned(
            right: 15.r,
            top: 0,
            bottom: 0,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 15.sp,
            ),
          )
        ],
      ),
    );
  }

  ///用户名和密码
  Widget buildUserNameAndPassword() {
    return Container(
      color: Colors.white,
      width: 1.sw,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15).r,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom:
                    BorderSide(width: 2.r, color: HYAppTheme.norWhite06Color),
              ),
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 45.r,
                  child: Text(SR.account.tr,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: 12.sp,
                      )),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15.r),
                    child: TextField(
                      focusNode: state.userNameFocusNode,
                      autofocus: true,
                      showCursor: true,
                      cursorHeight: 18.sp,
                      onChanged: (text) {
                        logic.updateUserName(text);
                      },
                      cursorColor: HYAppTheme.norMainThemeColors,
                      controller: state.userNameTextEditController,
                      decoration: InputDecoration(
                          hintText: SR.pleaseInputTelOrMail.tr,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                          )),
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: HYAppTheme.norMainThemeColors),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 15.r),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 45.r,
                  child: Text(
                    SR.password.tr,
                    style: TextStyle(
                      color: HYAppTheme.norTextColors,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15.r),
                    child: TextField(
                      focusNode: state.passwordFocusNode,
                      obscureText: state.isObscure,
                      onChanged: (text) {
                        logic.updatePassword(text);
                      },
                      showCursor: true,
                      cursorHeight: 18.sp,
                      cursorColor: HYAppTheme.norMainThemeColors,
                      controller: state.passwordTextFieldController,
                      decoration: InputDecoration(
                          hintText: SR.pleaseInputPassword.tr,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                logic.updateIsObscure();
                              },
                              icon: Icon(state.isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                      style: TextStyle(
                          fontSize: 14.sp, color: HYAppTheme.norTextColors),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.r),
                  child: Text(
                    SR.forgetPassword.tr,
                    style: TextStyle(
                        color: HYAppTheme.norMainThemeColors, fontSize: 12.sp),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///手机号码/验证码
  Widget buildLoginTel(BuildContext context) {
    return Container(
      color: HYAppTheme.norWhite01Color,
      width: 1.sw,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 2.r, horizontal: 15.r),
            decoration: BoxDecoration(
              color: HYAppTheme.norWhite01Color,
              border: Border(
                bottom:
                    BorderSide(width: 2.r, color: HYAppTheme.norWhite06Color),
              ),
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 40.r,
                  child: Text(state.regionList[state.regionIndex].telNum,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: 12.sp,
                      )),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15.r),
                    child: TextField(
                      focusNode: state.telFocusNode,
                      autofocus: true,
                      showCursor: true,
                      cursorHeight: 18.sp,
                      onChanged: (text) {
                        logic.updateTel(text);
                      },
                      cursorColor: HYAppTheme.norMainThemeColors,
                      controller: state.telTextEditController,
                      decoration: InputDecoration(
                          hintText: SR.pleaseInputTel.tr,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 12.sp,
                          )),
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: HYAppTheme.norMainThemeColors),
                    ),
                  ),
                ),
                state.telText.isNotEmpty
                    ? TimerButton(
                        onTap: () {
                          if (kIsWeb) {
                            SmartDialog.showToast("网页端未实现短信登录功能");
                          } else {
                            logic.sendSMS();
                          }
                        },
                      )
                    : TimerButton(
                        onTap: () {
                          SmartDialog.showToast("嘿，留个电话~");
                        },
                        isEnable: false,
                      )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 15.r),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 40.r,
                  child: Text(
                    SR.code.tr,
                    style: TextStyle(
                      color: HYAppTheme.norTextColors,
                      fontSize: 12.sp,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 15.r),
                    child: TextField(
                        focusNode: state.verifyCodeFocusNode,
                        onChanged: (text) {
                          logic.updateVerifyText(text);
                        },
                        showCursor: true,
                        cursorHeight: 18.sp,
                        cursorColor: HYAppTheme.norMainThemeColors,
                        controller: state.verifyPasswordTextFieldController,
                        decoration: InputDecoration(
                            hintText: SR.pleaseInputCode.tr,
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: 12.sp,
                            )),
                        style: TextStyle(
                            fontSize: 14.sp, color: HYAppTheme.norTextColors)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///选择地区的弹框
  buildRegionDialog() async {
    // List<Widget> widgets = [];
    // for (int i = 0; i < state.regionList.length; i++) {
    //   widgets.add(TextButton(
    //     onPressed: () {
    //       regionIndex = i;
    //       Navigator.pop(context);
    //     },
    //     child: Text(
    //       regionList[i].region,
    //       style: const TextStyle(color: HYAppTheme.norTextColors),
    //     ),
    //   ));
    // }
    // var regionDialog = await showDialog(
    //   context: context,
    //   builder: (context) {
    //     return SimpleDialog(
    //       title: Text(
    //         SR.zone.tr,
    //         style: TextStyle(
    //             fontSize: 14.sp,
    //             ),
    //       ),
    //       children: widgets,
    //     );
    //   },
    // );
    // return regionDialog;
  }

  Widget buildLoginAgreement() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      child: Column(
        children: [
          GestureDetector(
            //checkbox
            onTap: () {
              logic.changeIsAgree();
            },
            child: Text.rich(
              //实现换行
              TextSpan(
                children: [
                  WidgetSpan(
                    child: RectangleCheckBox(
                      //自定义矩形的checkbox
                      size: 14.sp,
                      checkedColor: HYAppTheme.norMainThemeColors,
                      isChecked: state.isAgree,
                      onTap: (value) {
                        logic.changeIsAgree();
                      },
                    ),
                  ),
                  TextSpan(
                    text: "   ",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  TextSpan(
                    text: SR.userAgreementText01.tr,
                    style: TextStyle(
                        color: HYAppTheme.norGrayColor, fontSize: 12.sp),
                  ),
                  TextSpan(
                    text: SR.userAgreementText02A.tr,
                    style: TextStyle(
                        color: HYAppTheme.norBlue01Colors, fontSize: 12.sp),
                  ),
                  TextSpan(
                    text: SR.userAgreementText03.tr,
                    style: TextStyle(
                        color: HYAppTheme.norGrayColor, fontSize: 12.sp),
                  ),
                  TextSpan(
                    text: SR.userAgreementText02B.tr,
                    style: TextStyle(
                        color: HYAppTheme.norBlue01Colors, fontSize: 12.sp),
                  ),
                  state.loginTypeIsMessage == true
                      ? TextSpan(
                          text: SR.userAgreementText05.tr,
                          style: TextStyle(
                              color: HYAppTheme.norGrayColor, fontSize: 12.sp),
                        )
                      : const TextSpan(),
                ],
              ),
            ),
          ),
          20.verticalSpace,
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: SR.havingProblems.tr,
                  style: TextStyle(
                    color: HYAppTheme.norGrayColor,
                    fontSize: 12.sp,
                  ),
                ),
                TextSpan(
                  text: SR.seeTheHelp.tr,
                  style: TextStyle(
                    color: HYAppTheme.norBlue01Colors,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ///验证登录（短信登录的登录按钮）
  Widget buildVerifyLoginButton() {
    return Opacity(
      opacity: state.telText.isNotEmpty && state.verifyText.isNotEmpty ? 1 : .5,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
              HYAppTheme.norTextColors.withOpacity(.1)),
          elevation: MaterialStateProperty.all(0),
          backgroundColor:
              MaterialStateProperty.all(HYAppTheme.norMainThemeColors),
          minimumSize: MaterialStateProperty.all(Size(200.r, 40.r)),
        ),
        onPressed: state.telText.isNotEmpty && state.verifyText.isNotEmpty
            ? () {
                ///短信验证登录（同时获取登录后的用户基本信息）
                logic.messageVerifyLogin();
              }
            : () {
                SmartDialog.showToast("电话或验证码为空");
              },
        child: Text(
          SR.verifyLogin.tr,
          style: TextStyle(
            color: HYAppTheme.norWhite01Color,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }

  ///注册登录
  Widget buildRegisterAndLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                  HYAppTheme.norTextColors.withOpacity(.1)),
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
                  MaterialStateProperty.all(HYAppTheme.norWhite01Color),
              minimumSize: MaterialStateProperty.all(Size(150.r, 40.r)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(3.r)),
                    side:
                        const BorderSide(color: HYAppTheme.norMainThemeColors)),
              )),
          onPressed:
              state.userNameText.isNotEmpty && state.passwordText.isNotEmpty
                  ? () {
                      SmartDialog.showToast("暂无注册功能");
                    }
                  : null,
          child: Text(
            SR.register.tr.toUpperCase(),
            style: TextStyle(
                color: HYAppTheme.norMainThemeColors,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        Opacity(
          opacity:
              state.userNameText.isNotEmpty && state.passwordText.isNotEmpty
                  ? 1
                  : .5,
          child: ElevatedButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                  HYAppTheme.norTextColors.withOpacity(.1)),
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
                  MaterialStateProperty.all(HYAppTheme.norMainThemeColors),
              minimumSize: MaterialStateProperty.all(Size(150.r, 40.r)),
            ),
            onPressed:
                state.userNameText.isNotEmpty && state.passwordText.isNotEmpty
                    ? () {
                        if (kIsWeb) {
                          SmartDialog.showToast("网页端暂时无法登录");
                        } else {
                          SmartDialog.showToast("密码登录需要验证身份，请使用短信登录");
                          logic.userNameAndPasswordLogin();
                        }
                      }
                    : null,
            child: Text(
              SR.login.tr.toUpperCase(),
              style: TextStyle(
                  color: HYAppTheme.norWhite01Color,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ],
    );
  }
}
