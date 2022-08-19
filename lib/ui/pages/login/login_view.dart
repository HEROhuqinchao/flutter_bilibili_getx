import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../core/I18n/str_res_keys.dart';
import '../../shared/app_theme.dart';
import '../../shared/image_asset.dart';
import '../../widgets/timer_button.dart';
import 'login_logic.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "/login";
  final logic = Get.find<LoginLogic>();
  final state = Get
      .find<LoginLogic>()
      .state;
  @override
  Widget build(BuildContext context) {


    return GetBuilder<LoginLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          elevation: .5,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: HYAppTheme.norTextColors,
              size: HYAppTheme.normalFontSize,
            ),
          ),
          title: Text(
            state.loginTypeIsMessage == true
                ? SR.telRegisterAndLogin.tr.toUpperCase()
                : SR.passwordLogin.tr.toUpperCase(),
            style: TextStyle(
                fontSize: HYAppTheme.xSmallFontSize,
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
                        fontSize: HYAppTheme.xxSmallFontSize,
                        color: HYAppTheme.norTextColors,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            10.horizontalSpace,
          ],
        ),
        body: Column(
          children: [
            ///2233娘背景
            buildLoginImage(),
            state.loginTypeIsMessage == true
                ? buildLoginRegion()
                : Container(),

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
            )),
        Positioned(
          width: 90.r,
          height: 90.r,
          left: 0,
          bottom: 0,
          child: Image.asset(ImageAssets.open22PNG),
        ),
        Positioned(
          width: 90.r,
          height: 90.r,
          right: 0,
          bottom: 0,
          child: Image.asset(ImageAssets.open33PNG),
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
                bottom: BorderSide(
                    width: 1.w, color: HYAppTheme.norWhite06Color),
              ),
            ),
            child: Text(
              state.regionList[state.regionIndex].region,
              style: const TextStyle(color: HYAppTheme.norTextColors),
            ),
          ),
          Positioned(
              right: 15.w,
              top: 0,
              bottom: 0,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 15.sp,
              ))
        ],
      ),
    );
  }

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
                bottom: BorderSide(
                    width: 2.w, color: HYAppTheme.norWhite06Color),
              ),
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 45.w,
                  child: Text(SR.account.tr,
                      style: TextStyle(
                          color: HYAppTheme.norTextColors,
                          fontSize: HYAppTheme.xxSmallFontSize,
                          fontWeight: FontWeight.bold)),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15).r,
                    child: TextField(
                      autofocus: true,
                      showCursor: true,
                      cursorHeight: HYAppTheme.normalFontSize,
                      onChanged: (text) {
                        logic.updateUserName(text);
                      },
                      cursorColor: HYAppTheme.norMainThemeColors,
                      controller: state.userNameTextEditController,
                      decoration: InputDecoration(
                          hintText: SR.pleaseInputTelOrMail.tr,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: HYAppTheme.xxSmallFontSize,
                          )),
                      style: TextStyle(
                          fontSize: HYAppTheme.xSmallFontSize,
                          color: HYAppTheme.norMainThemeColors),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15).r,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 45.w,
                  child: Text(
                    SR.password.tr,
                    style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: HYAppTheme.xxSmallFontSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15).r,
                    child: TextField(
                        onChanged: (text) {
                          logic.updatePassword(text);
                        },
                        showCursor: true,
                        cursorHeight: HYAppTheme.normalFontSize,
                        cursorColor: HYAppTheme.norMainThemeColors,
                        controller: state.passwordTextFieldController,
                        decoration: InputDecoration(
                            hintText: SR.pleaseInputPassword.tr,
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: HYAppTheme.xxSmallFontSize,
                            )),
                        style: TextStyle(
                            fontSize: HYAppTheme.xSmallFontSize,
                            color: HYAppTheme.norTextColors)),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 20).r,
                  child: Text(
                    SR.forgetPassword.tr,
                    style: TextStyle(
                        color: HYAppTheme.norMainThemeColors,
                        fontSize: HYAppTheme.xxSmallFontSize,
                        fontWeight: FontWeight.bold),
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
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 15).r,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                    width: 2.w, color: Theme.of(context).canvasColor),
              ),
            ),
            child: Row(
              children: [
                Container(
                  child: Text(state.regionList[state.regionIndex].telNum,
                      style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: HYAppTheme.xxSmallFontSize,
                      )),
                  alignment: Alignment.centerLeft,
                  width: 40.w,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15).r,
                    child: TextField(
                      autofocus: true,
                      showCursor: true,
                      cursorHeight: HYAppTheme.normalFontSize,
                      onChanged: (text) {
                        logic.updateTel(text);
                      },
                      cursorColor: HYAppTheme.norMainThemeColors,
                      controller: state.telTextEditController,
                      decoration: InputDecoration(
                          hintText: SR.pleaseInputTel.tr,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: HYAppTheme.xxSmallFontSize,
                          )),
                      style: TextStyle(
                          fontSize: HYAppTheme.xSmallFontSize,
                          color: HYAppTheme.norMainThemeColors),
                    ),
                  ),
                ),
                state.telText.isNotEmpty
                    ? TimerButton(
                  onTap: () {
                    sendSMS();
                  },
                )
                    : HYTimerButton(
                  onTap: () {
                    SmartDialog.showToast("嘿，留个电话~");
                  },
                  isEnable: false,
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15).r,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: 40.w,
                  child: Text(
                    SR.code.tr,
                    style: TextStyle(
                      color: HYAppTheme.norTextColors,
                      fontSize: HYAppTheme.xxSmallFontSize,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 15).r,
                    child: TextField(
                        onChanged: (text) {
                          _verifyText = text;
                          setState(() {});
                        },
                        showCursor: true,
                        cursorHeight: HYAppTheme.normalFontSize,
                        cursorColor: HYAppTheme.norMainThemeColors,
                        controller: _verifyPasswordTextFieldController,
                        decoration: InputDecoration(
                            hintText: SR.pleaseInputCode.tr,
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: HYAppTheme.xxSmallFontSize,
                            )),
                        style: TextStyle(
                            fontSize: HYAppTheme.xSmallFontSize,
                            color: HYAppTheme.norTextColors)),
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
    List<Widget> widgets = [];
    for (int i = 0; i < state.regionList.length; i++) {
      widgets.add(TextButton(
        onPressed: () {
          regionIndex = i;
          Navigator.pop(context);
        },
        child: Text(
          regionList[i].region,
          style: const TextStyle(color: HYAppTheme.norTextColors),
        ),
      ));
    }
    var regionDialog = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            SR.zone.tr,
            style: TextStyle(
                fontSize: HYAppTheme.xSmallFontSize,
                fontWeight: FontWeight.bold),
          ),
          children: widgets,
        );
      },
    );
    return regionDialog;
  }

  Widget buildLoginAgreement() {
    bool flag = true;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15).r,
      child: Column(
        children: [
          GestureDetector(
            //checkbox
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
            child: Text.rich(
              //实现换行
              TextSpan(
                children: [
                  WidgetSpan(
                    child: RectangleCheckBox(
                      //自定义矩形的checkbox
                      size: HYAppTheme.xSmallFontSize,
                      checkedColor: HYAppTheme.norMainThemeColors,
                      isChecked: flag,
                      onTap: (value) {
                        setState(() {
                          flag = value!;
                        });
                      },
                    ),
                  ),
                  TextSpan(
                    text: "   ",
                    style: TextStyle(fontSize: HYAppTheme.xxSmallFontSize),
                  ),
                  TextSpan(
                    text: SR.userAgreementText01.tr,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: HYAppTheme.xxSmallFontSize),
                  ),
                  TextSpan(
                    text: SR.userAgreementText02A.tr,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: HYAppTheme.xxSmallFontSize),
                  ),
                  TextSpan(
                    text: SR.userAgreementText03.tr,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: HYAppTheme.xxSmallFontSize),
                  ),
                  TextSpan(
                    text: SR.userAgreementText02B.tr,
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: HYAppTheme.xxSmallFontSize),
                  ),
                  loginTypeIsMessage == true
                      ? TextSpan(
                    text: SR.userAgreementText05.tr,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: HYAppTheme.xxSmallFontSize),
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
                      color: Colors.grey, fontSize: HYAppTheme.xxSmallFontSize),
                ),
                TextSpan(
                  text: SR.seeTheHelp.tr,
                  style: TextStyle(
                      color: Colors.blue, fontSize: HYAppTheme.xxSmallFontSize),
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
      opacity: _telText.isNotEmpty && _verifyText.isNotEmpty ? 1 : .5,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(
              HYAppTheme.norTextColors.withOpacity(.1)),
          elevation: MaterialStateProperty.all(0),
          backgroundColor:
          MaterialStateProperty.all(HYAppTheme.norMainThemeColors),
          minimumSize: MaterialStateProperty.all(Size(1.sw - 30.w, 40.h)),
        ),
        onPressed: _telText.isNotEmpty && _verifyText.isNotEmpty
            ? () {
          ///短信验证登录（同时获取登录后的用户基本信息）
          messageVerifyLogin(_telText, _verifyText, captchaKey, cid);
        }
            : () {
          SmartDialog.showToast("电话或验证码为空");
        },
        child: Text(
          SR.verifyLogin.tr,
          style: TextStyle(
              color: Colors.white, fontSize: HYAppTheme.xSmallFontSize),
        ),
      ),
    );
  }

  Widget buildRegisterAndLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                  HYAppTheme.norTextColors.withOpacity(.1)),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.white),
              minimumSize: MaterialStateProperty.all(Size(.5.sw - 15.w, 40.h)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(3).r),
                    side:
                    const BorderSide(color: HYAppTheme.norMainThemeColors)),
              )),
          onPressed: _userNameText.isNotEmpty && _passwordText.isNotEmpty
              ? () {
            // ///点击验证登录
            // HYSpaceAccInfoRequest.getSpaceAccInfoData(243766934)
            //     .then((value) {
            //   spaceAccInfoEventBus.fire(value);
            //   Navigator.of(context).pop();
            // });
          }
              : null,
          child: Text(
            SR.register.tr.toUpperCase(),
            style: TextStyle(
                color: HYAppTheme.norMainThemeColors,
                fontSize: HYAppTheme.xSmallFontSize,
                fontWeight: FontWeight.normal),
          ),
        ),
        Opacity(
          opacity:
          _userNameText.isNotEmpty && _passwordText.isNotEmpty ? 1 : .5,
          child: ElevatedButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(
                  HYAppTheme.norTextColors.withOpacity(.1)),
              elevation: MaterialStateProperty.all(0),
              backgroundColor:
              MaterialStateProperty.all(HYAppTheme.norMainThemeColors),
              minimumSize: MaterialStateProperty.all(Size(.5.sw - 15.w, 40.h)),
            ),
            onPressed: _userNameText.isNotEmpty && _passwordText.isNotEmpty
                ? () {
              SmartDialog.showToast("密码登录暂时不行");
            }
                : null,
            child: Text(
              SR.login.tr.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: HYAppTheme.xSmallFontSize,
                  fontWeight: FontWeight.normal),
            ),
          ),
        ),
      ],
    );
  }
}
