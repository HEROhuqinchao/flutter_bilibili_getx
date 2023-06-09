import 'dart:io';

import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/we_chat_contacts/we_chat_contacts_view.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_explore/wechat_explore_view.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_main/wechat_main_logic.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_main/wechat_main_view.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_mine/wechat_mine_logic.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_mine/wechat_mine_view.dart';
import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../core/model/wechat_login_model.dart';
import 'my_we_chat_logic.dart';

///仿微信主页面
class MyWeChatView extends StatelessWidget {
  static String routeName = "/my_wechat";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MyWeChatLogic>();
    final state = Get.find<MyWeChatLogic>().state;
    return WillPopScope(
      ///返回按钮退出界面
      onWillPop: () async {
        if (defaultTargetPlatform == TargetPlatform.android) {
          await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          exit(0);
        }
        return true;
      },
      child: GetBuilder<MyWeChatLogic>(
        builder: (logic) {
          return state.loading
              ? Container()
              : Scaffold(
                  backgroundColor: HYAppTheme.norWhite10Color,
                  appBar: (state.currentIndex == 0 ||
                          state.currentIndex == 1 ||
                          state.currentIndex == 2)
                      ? AppBar(
                          centerTitle: true,
                          backgroundColor: HYAppTheme.norWhite01Color,
                          leading: (state.currentIndex != 1 &&
                                  state.currentIndex != 2)
                              ? GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.more_horiz,
                                    color: HYAppTheme.norBlackColors,
                                  ),
                                )
                              : null,
                          elevation: .1,
                          title: (state.currentIndex == 0)
                              ? Text(
                                  "微信(${state.friendsNumber - 1})",
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: HYAppTheme.norBlackColors,
                                  ),
                                )
                              : (state.currentIndex == 1)
                                  ? Text(
                                      "通讯录",
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        color: HYAppTheme.norBlackColors,
                                      ),
                                    )
                                  : (state.currentIndex == 2)
                                      ? Text(
                                          "发现",
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: HYAppTheme.norBlackColors,
                                          ),
                                        )
                                      : Container(),
                          actions: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.r),
                              child: Image.asset(
                                ImageAssets.wechatSearchPng,
                                width: 20.r,
                                height: 20.r,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.r),
                              child: Image.asset(
                                ImageAssets.wechatAddPng,
                                width: 23.r,
                                height: 23.r,
                              ),
                            ),
                            5.horizontalSpace,
                          ],
                        )
                      : null,
                  body: IndexedStack(
                    index: state.currentIndex,
                    children: [
                      WechatMainView(),
                      WechatExploreView(),
                      WeChatContactsView(),
                      WechatMineView(),
                    ],
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    currentIndex: state.currentIndex,
                    selectedFontSize: 12.sp,
                    unselectedFontSize: 12.sp,
                    selectedItemColor: HYAppTheme.norGreen01Colors,
                    type: BottomNavigationBarType.fixed,
                    elevation: .1,
                    backgroundColor: HYAppTheme.norWhite09Color,
                    items: [
                      buildBottomNavigationBarItem("微信", "wechat_main"),
                      buildBottomNavigationBarItem("通讯录", "contacts"),
                      buildBottomNavigationBarItem("发现", "explore"),
                      buildBottomNavigationBarItem("我", "mine"),
                    ],
                    onTap: (index) {
                      logic.updateCurrentIndex(index);
                    },
                  ),
                );
        },
      ),
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String title, String iconName) {
    return BottomNavigationBarItem(
      label: title,
      icon: Container(
        margin: EdgeInsets.only(bottom: 8.sp),
        child: Image.asset(
          "assets/image/wechat/${iconName}_unselected.png",
          width: 18.sp,
          height: 18.sp,
          gaplessPlayback: true,
        ),
      ),
      activeIcon: Container(
        margin: EdgeInsets.only(bottom: 8.sp),
        child: Image.asset(
          "assets/image/wechat/${iconName}_selected.png",
          width: 18.sp,
          height: 18.sp,
          gaplessPlayback: true,
        ),
      ),
    );
  }
}
