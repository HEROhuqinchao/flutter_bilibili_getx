import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../shared/app_theme.dart';

///预发布界面的一行行按钮
class BilibiliRowButton extends StatelessWidget {
  BilibiliRowButton(
      {super.key, this.fillTypeWidget,
      this.rightWidget,
      required this.title,
      required this.tabEvent});

  ///标题
  TextSpan title;
  ///是否为必填
  TextSpan? fillTypeWidget;
  ///右侧箭头
  Widget? rightWidget;
  ///点击事件
  Function tabEvent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        tabEvent();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.r, horizontal: 5.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  title,
                  fillTypeWidget ??
                      TextSpan(
                        text: "",
                      )
                ],
              ),
            ),
            rightWidget ??
                Icon(
                  Icons.chevron_right,
                  color: HYAppTheme.norGrayColor,
                  size: 18.sp,
                )
          ],
        ),
      ),
    );
  }
}
