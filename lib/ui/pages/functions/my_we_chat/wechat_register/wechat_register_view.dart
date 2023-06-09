import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../shared/app_theme.dart';
import 'wechat_register_logic.dart';

class WechatRegisterView extends StatelessWidget {
  static String routeName = "/wechat_register";
  final logic = Get.find<WechatRegisterLogic>();
  final state = Get.find<WechatRegisterLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: .1,
        backgroundColor: Color.fromRGBO(241, 242, 244, 1),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.close,
            color: HYAppTheme.norBlackColors,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.r,
          right: 20.r,
          bottom: 50.r,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "手机号注册",
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
                15.verticalSpace,
                Container(
                  width: 70.r,
                  height: 70.r,
                  color: HYAppTheme.norWhite01Color,
                  child: Icon(
                    Icons.wechat,
                    size: 60.r,
                  ),
                ),
                30.verticalSpace,
                buildWechatInput(
                  label: "昵称",
                  hintText: "例如：陈晨",
                  onChanged: (value) {
                    logic.updateUserName(value);
                  },
                ),
                buildWechatInput(
                  label: "手机号",
                  hintText: "请填写手机号",
                  onChanged: (value) {
                    logic.updateTel(value);
                  },
                ),
                buildWechatInput(
                  label: "密码",
                  hintText: "填写密码",
                  onChanged: (value) {
                    logic.updatePassword(value);
                  },
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                logic.registerUser();
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
                  "注册",
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: HYAppTheme.norWhite01Color,
                  ),
                ),
              ),
            ),
          ],
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
              fontSize: 14.sp,
              color: HYAppTheme.norBlackColors,
              fontWeight: FontWeight.bold,
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
          fontSize: 13.sp,
        ),
      ),
    );
  }
}
