import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../dynamic_circle/dynamic_circle_view.dart';
import '../home/home_view.dart';
import '../mall/mall_view.dart';
import '../mine/mine_view.dart';
import '../publish/publish_view.dart';
import '../shared/app_theme.dart';
import '../shared/image_asset.dart';

///主页界面子页面
final List<Widget> mainIndexStackPages = [
  HomeScreen(),
  DynamicCircleScreen(),
  PublishScreen(),
  MallScreen(),
  MineScreen(),
];

BottomNavigationBarItem buildBottomNavigationBarCenterBarItem() {
  return BottomNavigationBarItem(
    label: "",
    icon: Container(
      margin: EdgeInsets.only(top: 8.h),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15).r,
      child: Image.asset(
        ImageAssets.addCustomPNG,
        width: HYAppTheme.smallFontSize,
        height: HYAppTheme.smallFontSize,
      ),
      decoration: BoxDecoration(
        color: HYAppTheme.norMainThemeColors,
        borderRadius: BorderRadius.all(
          Radius.circular(15.r),
        ),
      ),
    ),
  );
}
///首页、动态、会员购、我的
BottomNavigationBarItem buildBottomNavigationBarItem(
    String title, String iconName) {
  return BottomNavigationBarItem(
    label: title,
    icon: Container(
      margin: EdgeInsets.only(bottom: 8.sp),
      child: Image.asset(
        "assets/image/icon/${iconName}_custom.png",
        width: HYAppTheme.commonFontSize,
        height: HYAppTheme.commonFontSize,
        gaplessPlayback: true, //gaplessPlayback: 原图片保持不变，直到图片加载完成时替换图片，这样就不会出现闪烁
      ),
    ),
    activeIcon: Container(
      margin: EdgeInsets.only(bottom: 8.sp),
      child: Image.asset(
        "assets/image/icon/${iconName}_selected.png",
        width: HYAppTheme.commonFontSize,
        height: HYAppTheme.commonFontSize,
        gaplessPlayback: true,
      ),
    ),
  );
}