import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/app_theme.dart';

///广告栏
class AdvertisingRow extends StatelessWidget {
  final String image;
  final String title;
  final Widget rightBtn;

  const AdvertisingRow(
      {Key? key,
      required this.image,
      required this.title,
      required this.rightBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: HYAppTheme.norWhite02Color,
              borderRadius: BorderRadius.all(Radius.circular(3.r))),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10).r,
          child: Row(
            children: [
              SizedBox(
                height: 14.sp,
                width: 14.sp,
                child: Image.network(image),
              ),
              10.horizontalSpace,
              Text(
                title,
                style:
                    TextStyle(color: HYAppTheme.norTextColors, fontSize: 14.sp),
              ),
            ],
          ),
        ),
        Positioned(
          child: rightBtn,
          right: 10.w,
          top: 0,
          bottom: 0,
        )
      ],
    );
  }
}
