import 'package:animations/animations.dart';
import 'package:bilibili_getx/core/permission/bilibili_permission.dart';
import 'package:bilibili_getx/ui/pages/bilibili_test/bilibili_test_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../../core/I18n/str_res_keys.dart';
import '../../../core/shared_preferences/bilibili_shared_preference.dart';
import '../../../core/shared_preferences/shared_preference_util.dart';
import '../../shared/app_theme.dart';
import '../../shared/image_asset.dart';
import '../functions/blue_tooth_connection/blue_tooth_connection_view.dart';
import '../functions/push_message/push_message_view.dart';
import '../functions/qq_share/qq_share_view.dart';
import '../functions/statistics_chart/statistics_chart_view.dart';
import '../functions/wx_share/wx_share_view.dart';
import '../publish/publish_view.dart';
import 'main_logic.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = "/main";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MainLogic>();
    final state = Get.find<MainLogic>().state;
    return GetBuilder<MainLogic>(
      builder: (logic) {
        return SafeArea(
          child: Scaffold(
            ///页面切换动画效果
            body: PageTransitionSwitcher(
              transitionBuilder: (child, animation, secondaryAnimation) {
                return FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                );
              },
              child: state.mainIndexStackPages[state.currentIndex],
            ),
            // body: IndexedStack(
            //   ///显示哪一个页面
            //   index: state.currentIndex,
            //
            //   ///显示那些页面
            //   children: state.mainIndexStackPages,
            // ),

            ///底部导航栏
            bottomNavigationBar: BottomNavigationBar(
              ///选中时字体大小
              selectedFontSize: 12.sp,

              ///未选中时字体大小
              unselectedFontSize: 12.sp,

              ///选中时字体颜色
              selectedItemColor: HYAppTheme.norMainThemeColors,

              ///显示label标签，而不是隐藏label
              type: BottomNavigationBarType.fixed,

              ///当前显示的页面
              currentIndex: state.currentIndex,

              ///底部按钮
              items: [
                buildBottomNavigationBarItem(SR.home.tr.toUpperCase(), "home"),
                buildBottomNavigationBarItem(
                    SR.dynamic.tr.toUpperCase(), "dynamic"),
                buildBottomNavigationBarCenterBarItem(),
                buildBottomNavigationBarItem(SR.mall.tr.toUpperCase(), "vip"),
                buildBottomNavigationBarItem(SR.mine.tr.toUpperCase(), "mine"),
              ],
              onTap: (index) {
                ///发布界面
                if (index == 2) {
                  BilibiliPermission.requestUploadPermissions();
                  Get.toNamed(PublishScreen.routeName);
                } else {
                  logic.updateCurrentIndex(index);
                }
              },
            ),
            floatingActionButton: SpeedDial(
              icon: Icons.star_rate_sharp,
              backgroundColor: HYAppTheme.norMainThemeColors,
              children: [
                SpeedDialChild(
                  onTap: () {
                    Get.toNamed(StatisticsChartView.routeName);
                  },
                  backgroundColor: HYAppTheme.norWhite01Color,
                  label: '统计',
                  child: ImageIcon(
                    AssetImage(ImageAssets.chartsCustomPNG),
                    size: 10.h,
                  ),
                ),
                SpeedDialChild(
                  backgroundColor: HYAppTheme.norWhite01Color,
                  onTap: () {
                    Get.toNamed(PushMessageScreen.routeName);
                  },
                  label: '推送',
                  child: Icon(
                    Icons.announcement_sharp,
                    size: 10.h,
                  ),
                ),
                SpeedDialChild(
                  backgroundColor: HYAppTheme.norWhite01Color,
                  onTap: () {
                    Get.toNamed(QqShareView.routeName);
                  },
                  label: 'QQ分享',
                  child: Icon(
                    Icons.share,
                    size: 10.h,
                  ),
                ),
                SpeedDialChild(
                  backgroundColor: HYAppTheme.norWhite01Color,
                  onTap: () {
                    Get.toNamed(BlueToothConnectionView.routeName);
                  },
                  label: '蓝牙',
                  child: Icon(
                    Icons.bluetooth,
                    size: 10.h,
                  ),
                ),
                SpeedDialChild(
                  backgroundColor: HYAppTheme.norWhite01Color,
                  onTap: () {
                    Get.toNamed(WxShareView.routeName);
                  },
                  label: '微信分享',
                  child: Icon(
                    Icons.wechat,
                    size: 10.h,
                  ),
                ),
                SpeedDialChild(
                  backgroundColor: HYAppTheme.norWhite01Color,
                  onTap: () {
                    ///切换语言并保存语言至本地
                    String? locale = SharedPreferenceUtil.getString(
                        BilibiliSharedPreference.locale);
                    if (locale == 'zh') {
                      Get.updateLocale(const Locale('en', 'US'));
                      SharedPreferenceUtil.setString(
                          BilibiliSharedPreference.locale, 'en');
                    } else {
                      Get.updateLocale(const Locale('zh', 'CN'));
                      SharedPreferenceUtil.setString(
                          BilibiliSharedPreference.locale, 'zh');
                    }
                  },
                  label: '切换语言',
                  child: Icon(
                    Icons.abc,
                    size: 10.h,
                  ),
                ),
                SpeedDialChild(
                  backgroundColor: HYAppTheme.norWhite01Color,
                  onTap: () {
                    Get.toNamed(BilibiliTestScreen.routeName);
                  },
                  label: '小窗口',
                  child: Icon(
                    Icons.desktop_windows_sharp,
                    size: 10.h,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarCenterBarItem() {
    return BottomNavigationBarItem(
      label: "",
      icon: Container(
        margin: EdgeInsets.only(top: 8.h),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15).r,
        decoration: BoxDecoration(
          color: HYAppTheme.norMainThemeColors,
          borderRadius: BorderRadius.all(
            Radius.circular(15.r),
          ),
        ),
        child: Image.asset(
          ImageAssets.addCustomPNG,
          width: 16.sp,
          height: 16.sp,
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
          width: 18.sp,
          height: 18.sp,
          gaplessPlayback:
              true, //gaplessPlayback: 原图片保持不变，直到图片加载完成时替换图片，这样就不会出现闪烁
        ),
      ),
      activeIcon: Container(
        margin: EdgeInsets.only(bottom: 8.sp),
        child: Image.asset(
          "assets/image/icon/${iconName}_selected.png",
          width: 18.sp,
          height: 18.sp,
          gaplessPlayback: true,
        ),
      ),
    );
  }
}
