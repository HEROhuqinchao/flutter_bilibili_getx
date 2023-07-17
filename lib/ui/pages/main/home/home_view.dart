import 'dart:io';

import 'package:bilibili_getx/ui/pages/main/home/comic/comic_view.dart';
import 'package:bilibili_getx/ui/pages/main/home/recommend/recommend_view.dart';
import 'package:bilibili_getx/ui/pages/main/home/search/search_view.dart';
import 'package:bilibili_getx/ui/pages/main/main_logic.dart';
import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/widgets/custom/primary_scroll_container.dart';
import 'package:bilibili_getx/ui/widgets/custom/rectangle_checkBox.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../core/I18n/str_res_keys.dart';
import '../../../shared/image_asset.dart';
import 'home_logic.dart';
import 'live/live_view.dart';
import 'login/login_view.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final logic = Get.find<HomeLogic>();
  final state = Get.find<HomeLogic>().state;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 7, vsync: this, initialIndex: 1);
    tabController.addListener(() {
      for (int i = 0; i < state.scrollChildKeys.length; i++) {
        GlobalKey<PrimaryScrollContainerState> key = state.scrollChildKeys[i];
        if (key.currentState != null) {
          key.currentState?.onPageChange(tabController.index == i); //控制是否当前显示
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.removeListener(() {});
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeLogic>(builder: (logic) {
      return NestedScrollView(
        body: buildHomeTabBarView(),
        headerSliverBuilder: (ctx, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: buildHomeUserIconAndSearch(),
            ),
            SliverAppBar(
              title: buildHomeTabBar(),
              pinned: true,
              floating: false,
              snap: false,
              backgroundColor: HYAppTheme.norWhite01Color,
              elevation: 0,
            ),
          ];
        },
      );
    });
  }

  ///用户头像和搜索
  Widget buildHomeUserIconAndSearch() {
    TextStyle searchTextStyle = TextStyle(
      fontSize: 10.sp,
      color: HYAppTheme.norTextColors,
    );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      width: 1.sw,
      color: HYAppTheme.norWhite01Color,
      height: state.appBarHeight,
      child: Row(
        children: [
          ///用户头像
          buildHomeUserIcon(),
          15.horizontalSpace,
          Expanded(
            child: GestureDetector(
              onTap: () {
                Get.toNamed(SearchScreen.routeName);
              },
              child: Container(
                alignment: Alignment.centerLeft,
                height: 30.r,
                decoration: BoxDecoration(
                    color: HYAppTheme.norWhite02Color,
                    borderRadius: BorderRadius.circular(20.r)),
                child: Container(
                  padding: EdgeInsets.only(left: 15.r, top: 8.r, bottom: 8.r),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      8.horizontalSpace,
                      Image.asset(
                        ImageAssets.searchCustomPNG,
                        width: 15.r,
                        height: 15.r,
                      ),
                      5.horizontalSpace,
                      state.firstSearchKey.isNotEmpty
                          ? Text(state.firstSearchKey, style: searchTextStyle)
                          : Text(SR.searching.tr, style: searchTextStyle)
                    ],
                  ),
                ),
              ),
            ),
          ),
          15.horizontalSpace,
          Image.asset(
            ImageAssets.gameCustomPNG,
            width: 18.sp,
            height: 18.sp,
          ),
          15.horizontalSpace,
          Image.asset(
            width: 18.sp,
            height: 18.sp,
            ImageAssets.mailCustomPNG,
          ),
        ],
      ),
    );
  }

  ///直播、推荐那个几个item的tabbar
  TabBar buildHomeTabBar() {
    return TabBar(
      controller: tabController,
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
      labelStyle: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.normal,
        color: HYAppTheme.norMainThemeColors,
        fontFamily: 'bilibiliFonts',
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        color: HYAppTheme.norTextColors,
        fontFamily: 'bilibiliFonts',
      ),
      //下划线厚度
      indicatorWeight: 3.r,
      isScrollable: true,
    );
  }

  ///home中主要显示的内容，与tabBar对应
  Widget buildHomeTabBarView() {
    ///未同意用户协议
    return state.tempUserAgreement
        ? TabBarView(
            controller: tabController,
            children: [
              PrimaryScrollContainer(
                key: state.scrollChildKeys[0],
                child: const LiveScreen(),
              ),
              PrimaryScrollContainer(
                key: state.scrollChildKeys[1],
                child: const RecommendScreen(),
              ),
              PrimaryScrollContainer(
                key: state.scrollChildKeys[2],
                child: Container(),
              ),
              PrimaryScrollContainer(
                key: state.scrollChildKeys[3],
                child: ComicScreen(),
              ),
              PrimaryScrollContainer(
                key: state.scrollChildKeys[4],
                child: Container(),
              ),
              PrimaryScrollContainer(
                key: state.scrollChildKeys[5],
                child: Container(),
              ),
              PrimaryScrollContainer(
                key: state.scrollChildKeys[6],
                child: Container(),
              ),
            ],
          )
        : Container();
  }

  ///圆形图标（登录图标
  Widget buildHomeUserIcon() {
    return Container(
      child: state.userLogo.isEmpty
          ? buildHomeUnLoginUserIcon()
          : GestureDetector(
              onTap: () {
                ///点击已登录头像，更新mainScreen的底部导航栏下标
                final logic = Get.find<MainLogic>();
                logic.updateCurrentIndex(4);
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(state.userLogo),
                radius: 18.r,
              ),
            ),
    );
  }

  ///未登录时的头像
  Widget buildHomeUnLoginUserIcon() {
    return CircleAvatar(
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
                    borderRadius: BorderRadius.all(Radius.circular(8.w))),
                height: 80.r,
                width: 80.r,
                padding: const EdgeInsets.all(5).r,
                child: Column(
                  children: [
                    Image.asset(
                      ImageAssets.ploadingGif,
                      width: 35.r,
                      height: 35.r,
                    ),
                    10.verticalSpace,
                    Text(
                      SR.loading.tr,
                      style: TextStyle(
                        color: HYAppTheme.norGrayColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    )
                  ],
                ),
              );
            },
          ).whenComplete(() {
            /// 登录功能
            if (kIsWeb) {
              Get.toNamed(LoginScreen.routeName);
            } else {
              ///手机端的一键登录
              if (Platform.isAndroid || Platform.isIOS) {
                SmartDialog.dismiss();
                SmartDialog.show(
                  builder: (ctx) {
                    return buildHomeOneClickLogin();
                  },
                );
              } else if (Platform.isWindows) {
                Get.toNamed(LoginScreen.routeName);
              }
            }
          });
        },
        child: Text(
          SR.login.tr,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: HYAppTheme.norMainThemeColors,
              fontSize: 10.sp,
              fontFamily: 'bilibiliFonts'),
        ),
      ),
    );
  }

  ///一键登录弹窗
  Widget buildHomeOneClickLogin() {
    ///是否同意协议
    var flag = true;
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.r),
        width: 270.r,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(15.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    SR.login2UnlockMoreAmazingContent.tr,
                    style: TextStyle(
                        color: HYAppTheme.norTextColors, fontSize: 14.sp),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 30.r, bottom: 20.r),
                    child: Text(
                      "183****1731",
                      style: TextStyle(
                          fontSize: 18.sp, color: HYAppTheme.norTextColors),
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(vertical: 10.r)),
                        backgroundColor: MaterialStateProperty.all(
                            HYAppTheme.norMainThemeColors)),
                    onPressed: () {
                      ///一键登录
                      // loginAuth();
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4.r),
                      alignment: AlignmentDirectional.center,
                      width: 240.r,
                      child: Text(
                        SR.oneClickLogin.tr.toUpperCase(),
                        style: TextStyle(
                            color: HYAppTheme.norWhite01Color, fontSize: 14.sp),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15.r, bottom: 20.r),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(LoginScreen.routeName);
                        SmartDialog.dismiss();
                      },
                      child: Text(
                        SR.otherWay.tr,
                        style: TextStyle(
                            fontSize: 14.sp, color: HYAppTheme.norGray04Color),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(right: 3.r, top: 3.r),
                        child: RectangleCheckBox(
                          ///自定义矩形的checkbox
                          size: 14.sp,
                          checkedColor: HYAppTheme.norMainThemeColors,
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
            Positioned(
              right: 0,
              top: 0,
              child: GestureDetector(
                onTap: () {
                  SmartDialog.dismiss();
                },
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
  }

  ///用户协议
  Widget buildHomeAgreement() {
    return Expanded(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: SR.userAgreementText01.tr,
                style:
                    TextStyle(color: HYAppTheme.norGrayColor, fontSize: 10.sp)),
            TextSpan(
                text: SR.userAgreementText02.tr,
                style: TextStyle(
                    color: HYAppTheme.norBlue01Colors, fontSize: 10.sp)),
            TextSpan(
                text: SR.userAgreementText03.tr,
                style:
                    TextStyle(color: HYAppTheme.norGrayColor, fontSize: 10.sp)),
            TextSpan(
                text: SR.userAgreementText04.tr,
                style: TextStyle(
                    color: HYAppTheme.norBlue01Colors, fontSize: 10.sp)),
            TextSpan(
                text: SR.userAgreementText05.tr,
                style:
                    TextStyle(color: HYAppTheme.norGrayColor, fontSize: 10.sp)),
          ],
        ),
      ),
    );
  }
}
