import 'dart:io';

import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../widgets/show_bottom_menu.dart';
import '../wechat_register/wechat_register_view.dart';
import 'wechat_login_logic.dart';

///登录账户和注册账户
class WechatLoginView extends StatelessWidget {
  static String routeName = "/wechat_login";
  final logic = Get.find<WechatLoginLogic>();
  final state = Get.find<WechatLoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      ///返回按钮退出界面
      onWillPop: () async {
        if (defaultTargetPlatform == TargetPlatform.android) {
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          exit(0);
        }
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(237, 237, 237, 1),
        body: Padding(
          padding: EdgeInsets.only(
            top: 120.r,
            bottom: 10.r,
            left: 30.r,
            right: 30.r,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 70.r,
                    height: 70.r,
                    color: HYAppTheme.norWhite01Color,
                    child: Icon(
                      Icons.wechat,
                      size: 60.r,
                    ),
                  ),
                  20.verticalSpace,
                  buildWechatInput(
                    label: "手机号",
                    hintText: "请输入手机号",
                    onChanged: (value) {
                      logic.updateTel(value);
                    },
                  ),
                  10.verticalSpace,
                  buildWechatInput(
                    label: "密码",
                    hintText: "请输入密码",
                    onChanged: (value) {
                      logic.updatePassword(value);
                    },
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      Text(
                        "用短信验证码登录",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Color.fromRGBO(105, 110, 133, 1),
                        ),
                      ),
                    ],
                  ),
                  50.verticalSpace,
                  GestureDetector(
                    onTap: () {
                      logic.loginWechat();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 70.r,
                        vertical: 13.r,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(5, 193, 96, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        "登录",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: HYAppTheme.norWhite01Color,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.r,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "找回密码",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Color.fromRGBO(105, 110, 133, 1),
                      ),
                    ),
                    Container(
                      height: 10.r,
                      color: HYAppTheme.norGrayColor,
                      width: 1.r,
                    ),
                    Text(
                      "紧急冻结",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Color.fromRGBO(105, 110, 133, 1),
                      ),
                    ),
                    Container(
                      height: 10.r,
                      color: HYAppTheme.norGrayColor,
                      width: 1.r,
                    ),
                    GestureDetector(
                      onTap: () {
                        showBottomMenu(
                          context,
                          [
                            buildTextButton(
                              text: "登录其他账号",
                              onTap: () {},
                            ),
                            buildTextButton(
                              text: "注册",
                              onTap: () {
                                Get.toNamed(WechatRegisterView.routeName);
                              },
                            ),
                            buildTextButton(
                              text: "安全中心",
                              onTap: () {},
                            ),
                            buildTextButton(
                              text: "取消",
                              onTap: () {},
                            ),
                          ],
                        );
                      },
                      child: Text(
                        "更多",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Color.fromRGBO(105, 110, 133, 1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildWechatInput({
    required String label,
    required String hintText,
    required Function(String value) onChanged,
  }) {
    return TextField(
      onChanged: (value) {
        onChanged(value);
      },
      textAlign: TextAlign.start,
      decoration: InputDecoration(
        prefixIcon: Container(
          width: 90.r,
          alignment: Alignment.centerLeft,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: HYAppTheme.norBlackColors,
            ),
          ),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: HYAppTheme.norGrayColor,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: HYAppTheme.norGrayColor,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
