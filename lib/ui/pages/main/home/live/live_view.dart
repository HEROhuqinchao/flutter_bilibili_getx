import 'dart:io';

import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';

import '../../../../../core/model/xliveAppInterfaceV2IndexFeedModel.dart';
import '../../../../shared/app_theme.dart';
import 'live_logic.dart';

class LiveScreen extends StatelessWidget {
  static const String routeName = "/home/live";
  final logic = Get.find<LiveLogic>();
  final state = Get.find<LiveLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LiveLogic>(
        builder: (logic) {
          if (state.isLoadingLiveData == false) {
            if (kIsWeb) {
              return initWebLiveView();
            } else if (Platform.isAndroid) {
              return initAndroidLiveView();
            } else if (Platform.isWindows) {
              // return initWebLiveView();
              return initAndroidLiveView();
            } else {
              return Container();
            }
          } else {
            return Container(
              margin: EdgeInsets.only(top: 30.h),
              alignment: Alignment.topCenter,
              width: 1.sw,
              child: const RefreshProgressIndicator(
                value: null,
                color: HYAppTheme.norMainThemeColors,
              ),
            );
          }
        },
      ),
    );
  }

  Widget initWebLiveView() {
    return Container(
      child: Text("data"),
    );
  }

  ///初始化Android界面
  Widget initAndroidLiveView() {
    List<Widget> children = [];
    for (var item in state.cardList) {
      if (item.cardType == "banner_v1") {
        children.add(StaggeredGridTile.count(
          mainAxisCellCount: .7,
          crossAxisCellCount: 2,
          child: buildBannerV1(item.cardData),
        ));
      } else if (item.cardType == "area_entrance_v3") {
        children.add(StaggeredGridTile.count(
          mainAxisCellCount: .2,
          crossAxisCellCount: 2,
          child: buildAreaEntranceV3(item.cardData),
        ));
      } else if (item.cardType == "activity_card_v1") {
        children.add(StaggeredGridTile.count(
          mainAxisCellCount: .5,
          crossAxisCellCount: 2,
          child: buildActivityCardV1(item.cardData),
        ));
      } else if (item.cardType == "small_card_v1") {
        children.add(StaggeredGridTile.count(
          mainAxisCellCount: .8,
          crossAxisCellCount: 1,
          child: buildSmallCardV1(item.cardData),
        ));
      } else {
        if (Constant.isDebug) {
          print("不存在${item.cardType}");
        }
      }
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 3.r,
          crossAxisSpacing: 3.r,
          children: children,
        ),
      ),
    );
  }

  ///初始化广告
  Widget buildBannerV1(CardData item) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 5.r,
        vertical: 5.r,
      ),
      width: 1.sw,
      child: Swiper(
        autoplay: true,
        pagination: SwiperPagination(
          margin: EdgeInsets.only(bottom: 3.r, right: 3.r),
          alignment: Alignment.bottomRight,
          builder: DotSwiperPaginationBuilder(
            activeColor: HYAppTheme.norMainThemeColors,
            size: 5.sp,
            activeSize: 6.sp,
            color: HYAppTheme.norWhite01Color,
          ),
        ),
        itemBuilder: (ctx, index) {
          return ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(6.r)),
            child: Image.network(
              item.bannerV1!.list[index].pic,
              fit: BoxFit.fill,
            ),
          );
        },
        itemCount: state.cardList[0].cardData.bannerV1!.list.length,
      ),
    );
  }

  Widget buildAreaEntranceV3(CardData item) {
    return Container();
    // List<Tab> tabs = [];
    // for (var tab in item.areaEntranceV3!.list) {
    //   tabs.add(Tab(
    //     text: tab.title,
    //   ));
    // }
    // return Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     SizedBox(
    //       width: .8.sw,
    //       child: TabBar(
    //         tabs: tabs,
    //         indicatorColor: HYAppTheme.norMainThemeColors,
    //         unselectedLabelColor: HYAppTheme.unselectedLabelColor,
    //         labelColor: HYAppTheme.norMainThemeColors,
    //         indicatorSize: TabBarIndicatorSize.label,
    //         labelStyle: TextStyle(
    //           fontSize: 18.sp,
    //           fontWeight: FontWeight.normal,
    //           color: HYAppTheme.norMainThemeColors,
    //           fontFamily: 'bilibiliFonts',
    //         ),
    //         unselectedLabelStyle: TextStyle(
    //           fontSize: 16.sp,
    //           fontWeight: FontWeight.normal,
    //           color: HYAppTheme.norTextColors,
    //           fontFamily: 'bilibiliFonts',
    //         ),
    //
    //         ///下划线的厚度
    //         indicatorWeight: 3.h,
    //         isScrollable: true,
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget buildActivityCardV1(CardData item) {
    return Container(
      color: Colors.yellow,
    );
  }

  Widget buildSmallCardV1(CardData item) {
    return Container(
      color: Colors.blue,
    );
  }
}
