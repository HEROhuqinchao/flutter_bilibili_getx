import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/I18n/str_res_keys.dart';
import '../../shared/app_theme.dart';
import '../publish/publish_view.dart';
import 'main_init.dart';
import 'main_logic.dart';

class MainScreen extends StatelessWidget {
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MainLogic>();
    final state = Get.find<MainLogic>().state;
    return GetBuilder<MainLogic>(
      builder: (logic) {
        return SafeArea(
          child: Scaffold(
            body: IndexedStack(
              ///显示哪一个页面
              index: state.currentIndex,

              ///显示那些页面
              children: mainIndexStackPages,
            ),

            ///底部导航栏
            bottomNavigationBar: BottomNavigationBar(
              ///选中时字体大小
              selectedFontSize: HYAppTheme.xxSmallFontSize,

              ///未选中时字体大小
              unselectedFontSize: HYAppTheme.xxSmallFontSize,

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
                  Get.toNamed(PublishScreen.routeName);
                } else {
                  logic.updateCurrentIndex(index);
                }
              },
            ),
            // floatingActionButton: SpeedDial(
            //   icon: Icons.star_rate_sharp,
            //   backgroundColor: HYAppTheme.norMainThemeColors,
            //   children: [
            //     SpeedDialChild(
            //       onTap: () {
            //         Navigator.of(context).pushNamed(HYChartScreen.routeName);
            //       },
            //       backgroundColor: Colors.white,
            //       label: '统计',
            //       child: ImageIcon(
            //         AssetImage(ImageAssets.chartsCustomPNG),
            //         size: 10.h,
            //       ),
            //     ),
            //     SpeedDialChild(
            //       backgroundColor: Colors.white,
            //       onTap: () {
            //         if (PlatformJudge.platformJudgeIsPhone()) {
            //           Navigator.of(context).pushNamed(HYPushScreen.routeName);
            //         } else {
            //           print("网页和桌面端暂无推送");
            //         }
            //       },
            //       label: '推送',
            //       child: Icon(
            //         Icons.announcement_sharp,
            //         size: 10.h,
            //       ),
            //     ),
            //     SpeedDialChild(
            //       backgroundColor: Colors.white,
            //       onTap: () {
            //         ///切换语言并保存语言至本地
            //         String? locale = SharedPreferenceUtil.getString(
            //             BilibiliSharedPreference.locale);
            //         if (locale == 'zh') {
            //           Get.updateLocale(const Locale('en', 'US'));
            //           SharedPreferenceUtil.setString(
            //               BilibiliSharedPreference.locale, 'en');
            //         } else {
            //           Get.updateLocale(const Locale('zh', 'CN'));
            //           SharedPreferenceUtil.setString(
            //               BilibiliSharedPreference.locale, 'zh');
            //         }
            //       },
            //       label: '切换语言',
            //       child: Icon(
            //         Icons.ac_unit_sharp,
            //         size: 10.h,
            //       ),
            //     ),
            //   ],
            // ),
          ),
        );
      },
    );
  }
}
