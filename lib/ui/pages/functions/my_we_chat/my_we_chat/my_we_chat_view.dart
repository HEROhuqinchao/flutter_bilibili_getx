import 'dart:io';

import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/message_change_notifier/message_change_notifier.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/we_chat_contacts/we_chat_contacts_view.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_explore/wechat_explore_view.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_main/wechat_main_view.dart';
import 'package:bilibili_getx/ui/pages/functions/my_we_chat/my_we_chat/wechat_mine/wechat_mine_view.dart';
import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:bilibili_getx/ui/widgets/widget_factory/abstract_factory/widget_factory_singleton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'my_we_chat_logic.dart';

///仿微信主页面
class MyWeChatView extends StatelessWidget with WidgetFactoryPlugin {
  static String routeName = "/my_wechat";

  final logic = Get.find<MyWeChatLogic>();
  final state = Get.find<MyWeChatLogic>().state;

  MyWeChatView({super.key});

  @override
  Widget build(BuildContext context) {
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
                      ? buildMyWeChatAppBar()
                      : null,
                  body: IndexedStack(
                    index: state.currentIndex,
                    children: [
                      const WechatMainView(),
                      WechatExploreView(),
                      const WeChatContactsView(),
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
                      buildBottomNavigationBarItem(
                        title: "微信",
                        iconName: "wechat_main",
                        showTagPart: true,
                      ),
                      buildBottomNavigationBarItem(
                        title: "通讯录",
                        iconName: "contacts",
                        showTagPart: false,
                      ),
                      buildBottomNavigationBarItem(
                        title: "发现",
                        iconName: "explore",
                        showTagPart: false,
                      ),
                      buildBottomNavigationBarItem(
                        title: "我",
                        iconName: "mine",
                        showTagPart: false,
                      ),
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

  ///头部
  AppBar buildMyWeChatAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: HYAppTheme.norWhite01Color,
      leading: (state.currentIndex != 1 && state.currentIndex != 2)
          ? GestureDetector(
              onTap: () {},
              child: const Icon(
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
    );
  }

  ///底部按钮
  BottomNavigationBarItem buildBottomNavigationBarItem({
    required String title,
    required String iconName,
    required bool showTagPart,
  }) {
    return BottomNavigationBarItem(
      label: title,
      icon: showTagPart
          ? ValueListenableBuilder<Map<String, int>>(
              valueListenable: MessageChangeNotifier.getInstance(),
              builder: (_, __, ___) {
                return wFactory().buildRightTag(
                  mainPart: Container(
                    padding: EdgeInsets.all(6.sp),
                    child: Image.asset(
                      "assets/image/wechat/${iconName}_unselected.png",
                      width: 22.sp,
                      height: 22.sp,
                      gaplessPlayback: true,
                    ),
                  ),
                  tagPart: Text(
                    "${MessageChangeNotifier.getInstance().allUnReadMessage}",
                  ),
                );
              },
            )
          : Container(
              padding: EdgeInsets.all(6.sp),
              child: Image.asset(
                "assets/image/wechat/${iconName}_unselected.png",
                width: 22.sp,
                height: 22.sp,
                gaplessPlayback: true,
              ),
            ),
      activeIcon: showTagPart
          ? ValueListenableBuilder<Map<String, int>>(
              valueListenable: MessageChangeNotifier.getInstance(),
              builder: (_, __, ___) {
                return wFactory().buildRightTag(
                  mainPart: Container(
                    padding: EdgeInsets.all(6.sp),
                    child: Image.asset(
                      "assets/image/wechat/${iconName}_selected.png",
                      width: 22.sp,
                      height: 22.sp,
                      gaplessPlayback: true,
                    ),
                  ),
                  tagPart: Text(
                      "${MessageChangeNotifier.getInstance().allUnReadMessage}"),
                );
              },
            )
          : Container(
              padding: EdgeInsets.all(6.sp),
              child: Image.asset(
                "assets/image/wechat/${iconName}_selected.png",
                width: 22.sp,
                height: 22.sp,
                gaplessPlayback: true,
              ),
            ),
    );
  }
}
