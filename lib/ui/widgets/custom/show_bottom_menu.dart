import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/app_theme.dart';

void showBottomMenu(BuildContext context, List<Widget> textButtons) {
  showModalBottomSheet(
    context: context,
    builder: (ctx) {
      return Container(
        color: const Color.fromRGBO(109, 109, 109, 1),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(10.r),
          ),
          child: Container(
            color: HYAppTheme.norWhite09Color,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) {
                return textButtons[index];
              },
              separatorBuilder: (ctx, index) {
                if (index == textButtons.length - 2) {
                  return 8.verticalSpace;
                } else {
                  return Container(
                    height: .3.r,
                    color: HYAppTheme.norGrayColor,
                    width: 1.sw,
                  );
                }
              },
              itemCount: textButtons.length,
            ),
          ),
        ),
      );
    },
  );
}

///文本按钮
buildTextButton({required String text, required Function() onTap}) {
  return Material(
    color: HYAppTheme.norWhite01Color,
    child: InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 1.sw,
        padding: EdgeInsets.symmetric(
          vertical: 15.r,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.sp,
            color: HYAppTheme.norBlackColors,
          ),
        ),
      ),
    ),
  );
}
