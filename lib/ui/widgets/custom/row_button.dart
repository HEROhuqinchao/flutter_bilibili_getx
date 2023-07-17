import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///预发布界面的一行行按钮
class BilibiliRowButton extends StatelessWidget {
  const BilibiliRowButton(
      {super.key,
      this.fillTypeWidget,
      this.rightWidget,
      required this.title,
      required this.tabEvent});

  ///标题
  final TextSpan title;

  ///是否为必填
  final TextSpan? fillTypeWidget;

  ///右侧箭头
  final Widget? rightWidget;

  ///点击事件
  final Function tabEvent;

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
                children: [title, fillTypeWidget ?? const TextSpan(text: "")],
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
