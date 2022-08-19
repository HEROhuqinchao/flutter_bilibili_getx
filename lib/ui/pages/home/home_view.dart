import 'dart:io';

import 'package:bilibili_getx/ui/pages/login/login_view.dart';
import 'package:bilibili_getx/ui/pages/main/main_logic.dart';
import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../core/I18n/str_res_keys.dart';
import '../../shared/image_asset.dart';
import '../../widgets/rectangle_checkBox.dart';
import '../comic/comic_view.dart';
import '../live/live_view.dart';
import '../recommend/recommend_view.dart';
import '../search/search_view.dart';
import 'home_logic.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding widgetsBinding = WidgetsBinding.instance;
    widgetsBinding.addPostFrameCallback((callback) {
      ///判断是否同意用户协议
      if (state.tempUserAgreement == false) {
        logic.initUserAgreement();
      }

      ///判断是否同意青少年模式
      if (state.tempTeenagerMode == false && state.tempUserAgreement == true) {
        logic.showTeenagerModeDialog();
      }
    });
    return DefaultTabController(
      length: 7,
      initialIndex: 1,
      child: NestedScrollView(
        headerSliverBuilder: (ctx, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              toolbarHeight: 0.08.sh,

              leading: null,

              ///搜索和用户头像
              title: buildHomeUserIconAndSearch(),

              ///右侧工具栏
              actions: buildHomeActions(),

              ///向上滑动无需停留顶部
              pinned: false,

              floating: false,
              snap: false,
              backgroundColor: Colors.white,
            ),
            SliverAppBar(
              ///设置高度
              toolbarHeight: 0.07.sh,

              ///tabBar
              title: buildHomeTabBar(),

              ///向上滑动需停留顶部
              pinned: true,

              floating: true,
              snap: true,
              backgroundColor: Colors.white,
            ),
          ];
        },

        ///tabBarView
        body: buildHomeTabBarView(),
      ),
    );
  }

  ///用户头像和搜索
  Widget buildHomeUserIconAndSearch() {
    return Row(
      children: [
        ///用户头像
        buildHomeUserIcon(),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.toNamed(SearchScreen.routeName);
            },
            child: Container(
              alignment: Alignment.centerLeft,
              height: 35.h,
              decoration: BoxDecoration(
                  color: HYAppTheme.norWhite02Color,
                  borderRadius: BorderRadius.circular(20.r)),
              child: Container(
                  padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8).r,
                  child: Image.asset(ImageAssets.searchCustomPNG)),
            ),
          ),
        ),
      ],
    );
  }

  ///右侧工具栏
  List<Widget> buildHomeActions() {
    return [
      IconButton(
          onPressed: () => print("game"),
          icon: Image.asset(
            ImageAssets.gameCustomPNG,
            width: HYAppTheme.normalFontSize,
            height: HYAppTheme.normalFontSize,
          )),
      5.horizontalSpace,
      IconButton(
          onPressed: () => print("more"),
          icon: Image.asset(
            ImageAssets.mailCustomPNG,
            width: HYAppTheme.normalFontSize,
            height: HYAppTheme.normalFontSize,
          )),
      5.horizontalSpace,
    ];
  }

  ///直播、推荐那个几个item的tabbar
  TabBar buildHomeTabBar() {
    return TabBar(
      tabs: [
        Tab(text: SR.live.tr.toUpperCase()),
        Tab(text: SR.recommend.tr.toUpperCase()),
        Tab(text: SR.hot.tr.toUpperCase()),
        Tab(text: SR.comic.tr.toUpperCase()),
        Tab(text: SR.movie.tr.toUpperCase()),
        Tab(text: SR.covid.tr.toUpperCase()),
        Tab(text: SR.journey.tr.toUpperCase()),
      ],
      indicatorColor: HYAppTheme.norMainThemeColors,
      unselectedLabelColor: HYAppTheme.unselectedLabelColor,
      labelColor: HYAppTheme.norMainThemeColors,
      indicatorSize: TabBarIndicatorSize.label,
      labelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),

      ///下划线的厚度
      indicatorWeight: 3.h,
      isScrollable: true,
    );
  }

  ///home中主要显示的内容，与tabBar对应
  Widget buildHomeTabBarView() {
    ///未同意用户协议
    return state.tempUserAgreement == false
        ? Container()
        : TabBarView(
            children: buildTabBarViewChildren(),
          );
  }

  List<Widget> buildTabBarViewChildren() {
    List<Widget> widgets = [];
    for (int i = 0; i < 7; i++) {
      Widget child;
      if (i == 0) {
        ///直播
        child = LiveScreen();
      } else if (i == 1) {
        ///推荐
        child = RecommendScreen();
      } else if (i == 2) {
        ///动画
        child = ComicScreen();
      } else {
        child = Container();
      }
      widgets.add(child);
    }
    return widgets;
  }

  ///圆形图标（登录图标
  Widget buildHomeUserIcon() {
    var flag = true;
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 20).r,
      child: state.userLogo.isEmpty
          ? CircleAvatar(
              backgroundColor: HYAppTheme.norWhite06Color,
              radius: 20.r,
              child: TextButton(
                onPressed: () async {
                  SmartDialog.showLoading(
                    displayTime: const Duration(seconds: 2),
                    maskColor: const Color.fromRGBO(0, 0, 0, .4),
                    builder: (ctx) {
                      return Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(0, 0, 0, .8),
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.w))),
                        height: 80.h,
                        width: 80.w,
                        padding: const EdgeInsets.all(5).r,
                        child: Column(
                          children: [
                            Image.asset(
                              ImageAssets.ploadingGif,
                              width: 35.w,
                              height: 35.h,
                            ),
                            10.verticalSpace,
                            Text(
                              SR.loading.tr,
                              style: TextStyle(
                                  color: HYAppTheme.norGrayColor,
                                  fontSize: HYAppTheme.xxSmallFontSize),
                            )
                          ],
                        ),
                      );
                    },
                  ).whenComplete(() {
                    /// 登录功能
                    if(kIsWeb) {
                      Get.toNamed(LoginScreen.routeName);
                    } else {
                      ///手机端的一键登录
                      if(Platform.isAndroid && Platform.isIOS) {
                        SmartDialog.dismiss();
                        SmartDialog.show(
                          builder: (ctx) {
                            return Card(
                              child: Container(
                                padding: const EdgeInsets.all(10).r,
                                width: 270.w,
                                child: Stack(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(15).r,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            SR.login2UnlockMoreAmazingContent.tr,
                                            style: TextStyle(
                                                color: HYAppTheme.norTextColors,
                                                fontSize:
                                                HYAppTheme.xSmallFontSize),
                                            textAlign: TextAlign.center,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                top: 30, bottom: 20)
                                                .r,
                                            child: Text(
                                              "183****1731",
                                              style: TextStyle(
                                                  fontSize:
                                                  HYAppTheme.normalFontSize,
                                                  color: HYAppTheme.norTextColors),
                                            ),
                                          ),
                                          TextButton(
                                            style: ButtonStyle(
                                                padding: MaterialStateProperty.all(
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10)
                                                        .r),
                                                backgroundColor:
                                                MaterialStateProperty.all(
                                                    HYAppTheme
                                                        .norMainThemeColors)),
                                            onPressed: () {
                                              ///一键登录
                                              // loginAuth();
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(
                                                  vertical: 4)
                                                  .r,
                                              alignment:
                                              AlignmentDirectional.center,
                                              width: double.infinity,
                                              child: Text(
                                                SR.oneClickLogin.tr.toUpperCase(),
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize:
                                                    HYAppTheme.xSmallFontSize),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                top: 15, bottom: 20)
                                                .r,
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.toNamed(LoginScreen.routeName);
                                                SmartDialog.dismiss();
                                              },
                                              child: Text(
                                                SR.otherWay.tr,
                                                style: TextStyle(
                                                    fontSize:
                                                    HYAppTheme.xSmallFontSize,
                                                    color:
                                                    HYAppTheme.norGray04Color),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    right: 3, top: 3)
                                                    .r,
                                                child: RectangleCheckBox(
                                                  ///自定义矩形的checkbox
                                                  size: 14.sp,
                                                  checkedColor:
                                                  HYAppTheme.norMainThemeColors,
                                                  isChecked: flag,
                                                  onTap: (value) {
                                                    flag = value!;
                                                  },
                                                ),
                                              ),
                                              5.horizontalSpace,
                                              buildHomeAgreement(),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        SmartDialog.dismiss();
                                      },
                                      child: Positioned(
                                        right: 0,
                                        top: 0,
                                        child: Icon(
                                          Icons.close,
                                          color: HYAppTheme.norGrayColor,
                                          size: 13.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else if(Platform.isWindows) {
                        Get.toNamed(LoginScreen.routeName);
                      }
                    }

                  });
                  // await Future.delayed(const Duration(seconds: 2)).then(
                  //   (value) {
                  //     SmartDialog.dismiss();
                  //
                  //     //未登录情况下
                  //     // Navigator.of(context).pushNamed(HYLoginScreen.routeName);
                  //   },
                  // );
                },
                child: Text(
                  SR.login.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: HYAppTheme.norMainThemeColors,
                    fontSize: HYAppTheme.xxxSmallFontSize,
                  ),
                ),
              ),
            )
          : GestureDetector(
              onTap: () {
                ///点击已登录头像，更新mainScreen的底部导航栏下标
                final logic = Get.find<MainLogic>();
                logic.updateCurrentIndex(4);
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(state.userLogo),
              ),
            ),
    );
  }

  ///用户协议
  Widget buildHomeAgreement() {
    return Expanded(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: SR.userAgreementText01.tr,
              style: TextStyle(
                  color: Colors.grey, fontSize: HYAppTheme.xxxSmallFontSize),
            ),
            TextSpan(
              text: SR.userAgreementText02.tr,
              style: TextStyle(
                  color: Colors.blue, fontSize: HYAppTheme.xxxSmallFontSize),
            ),
            TextSpan(
              text: SR.userAgreementText03.tr,
              style: TextStyle(
                  color: Colors.grey, fontSize: HYAppTheme.xxxSmallFontSize),
            ),
            TextSpan(
              text: SR.userAgreementText04.tr,
              style: TextStyle(
                  color: Colors.blue, fontSize: HYAppTheme.xxxSmallFontSize),
            ),
            TextSpan(
              text: SR.userAgreementText05.tr,
              style: TextStyle(
                  color: Colors.grey, fontSize: HYAppTheme.xxxSmallFontSize),
            ),
          ],
        ),
      ),
    );
  }
}
