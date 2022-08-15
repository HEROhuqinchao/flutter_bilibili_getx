import 'package:bilibili_getx/ui/home/home_view.dart';
import 'package:flutter/material.dart';

import '../dynamic_circle/dynamic_circle_view.dart';
import '../home/home_view.dart';
import '../mall/mall_view.dart';
import '../mine/mine_view.dart';
import '../publish/publish_view.dart';

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
      margin: EdgeInsets.only(top: 5.h),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 13).r,
      child: Image.asset(
        ImageAssets.addCustomPNG,
        width: 15.sp,
        height: 15.sp,
      ),
      decoration: BoxDecoration(
        color: HYAppTheme.norMainThemeColors,
        borderRadius: BorderRadius.all(
          Radius.circular(12.r),
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
    icon: Image.asset(
      "assets/image/icon/${iconName}_custom.png",
      width: _iconSize,
      height: _iconSize,
      gaplessPlayback: true, //gaplessPlayback: 原图片保持不变，直到图片加载完成时替换图片，这样就不会出现闪烁
    ),
    activeIcon: Image.asset(
      "assets/image/icon/${iconName}_selected.png",
      width: _activeIcon,
      height: _activeIcon,
      gaplessPlayback: true,
    ),
  );
}