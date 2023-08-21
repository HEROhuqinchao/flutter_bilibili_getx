import 'package:bilibili_getx/core/I18n/str_res_keys.dart';
import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

///编辑简介的弹框
class ProfileEditDialog extends StatelessWidget {
  const ProfileEditDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: HYAppTheme.norTextColors.withOpacity(.5),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 20.r),
            decoration: BoxDecoration(
                color: HYAppTheme.norWhite01Color,
                borderRadius: BorderRadius.vertical(top: Radius.circular(5.r))),
            width: 1.sw,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: HYAppTheme.norGrayColor,
                      borderRadius: BorderRadius.all(Radius.circular(50.r))),
                  height: 4.sp,
                  width: 35.sp,
                ),
                15.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "取消",
                      style: TextStyle(
                        color: HYAppTheme.norTextColors,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      "简介",
                      style: TextStyle(
                        color: HYAppTheme.norTextColors.withOpacity(.8),
                        fontSize: 13.sp,
                      ),
                    ),
                    Text(
                      "确定",
                      style: TextStyle(
                        color: HYAppTheme.norTextColors.withOpacity(.8),
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
                30.verticalSpace,
                TextField(
                  autofocus: true,
                  maxLines: 4,
                  maxLength: 2000,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: HYAppTheme.norGrayColor.withOpacity(.1),
                      border: InputBorder.none,
                      hintText: SR.pleaseInputTitle.tr,
                      hintStyle: TextStyle(
                        color: HYAppTheme.norGrayColor,
                        fontSize: 12.sp,
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
