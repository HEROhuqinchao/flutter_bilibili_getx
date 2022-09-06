import 'dart:io';

import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
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
    ///能否被移除刷新
    List<bool> canRemove = [];
    List<Widget> children = [];
    for (var item in state.cardList) {
      if (item.cardType == "banner_v1") {
        children.add(StaggeredGridTile.count(
          mainAxisCellCount: .7,
          crossAxisCellCount: 2,
          child: buildBannerV1(item.cardData),
        ));
        canRemove.add(false);
      } else if (item.cardType == "area_entrance_v3") {
        children.add(StaggeredGridTile.count(
          mainAxisCellCount: .2,
          crossAxisCellCount: 2,
          child: buildAreaEntranceV3(item.cardData),
        ));
        canRemove.add(false);
      } else if (item.cardType == "activity_card_v1") {
        children.add(StaggeredGridTile.count(
          mainAxisCellCount: .5,
          crossAxisCellCount: 2,
          child: buildActivityCardV1(item.cardData),
        ));
        canRemove.add(false);
      } else if (item.cardType == "small_card_v1") {
        children.add(StaggeredGridTile.count(
          mainAxisCellCount: .8,
          crossAxisCellCount: 1,
          child: buildSmallCardV1(item.cardData),
        ));
        canRemove.add(true);
      } else {
        if (Constant.isDebug) {
          print("不存在${item.cardType}");
        }
      }
    }
    return Scaffold(
      body: Container(
        color: HYAppTheme.norWhite06Color,
        child: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            children: children,
          ),
        ),
      ),
    );
  }

  ///初始化广告
  Widget buildBannerV1(CardData item) {
    return Container(
      color: HYAppTheme.norWhite01Color,
      padding: EdgeInsets.symmetric(
        vertical: 5.r,
        horizontal: 10.r
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

  Widget buildAreaEntranceV3(CardData cardData) {
    List<String> tabs = ['推荐'];
    for (var item in cardData.areaEntranceV3!.list) {
      tabs.add(item.title);
    }
    return Container(
      padding: EdgeInsets.all(10.r),
      color: HYAppTheme.norWhite01Color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: .85.sw,
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                    right: 13.r,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      logic.selectLabelAndFetchData(index);
                    },
                    child: Text(
                      tabs[index],
                      style: TextStyle(
                          color: state.selectedNumber == index
                              ? HYAppTheme.norTextColors
                              : HYAppTheme.norGrayColor,
                          fontSize: 14.sp),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: tabs.length,
            ),
          ),
          Image.asset(
            ImageAssets.moreBlockPNG,
            width: 18.w,
            height: 18.w,
          )
        ],
      ),
    );
  }

  Widget buildActivityCardV1(CardData item) {
    return Container(
      color: Colors.yellow,
    );
  }

  Widget buildSmallCardV1(CardData item) {
    return Container(
      margin: EdgeInsets.all(5.r),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(5.r)),
        elevation: 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(5.r)),
                  child: Image.network(
                    item.smallCardV1!.cover,
                    fit: BoxFit.cover,
                    height: 90.w,
                    width: 1.sw,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: 1.sw,
                    height: 25.w,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(.6),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )),
                  ),
                ),
                Positioned(
                  left: 8.r,
                  bottom: 5.r,
                  child: SizedBox(
                    height: 12.sp,
                    child: Text(
                      item.smallCardV1!.coverLeftStyle.text,
                      style: TextStyle(
                        color: HYAppTheme.norWhite01Color,
                        fontSize: 10.sp,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 8.r,
                  bottom: 5.r,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 12.sp,
                        child: Image.asset(
                          ImageAssets.seenPNG,
                          height: 12.sp,
                          width: 12.sp,
                        ),
                      ),
                      5.horizontalSpace,
                      Container(
                        alignment: Alignment.center,
                        height: 12.sp,
                        child: Text(
                          item.smallCardV1!.coverRightStyle.text,
                          style: TextStyle(
                            color: HYAppTheme.norWhite01Color,
                            fontSize: 10.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 4.r),
              width: 1.sw,
              child: Text(
                item.smallCardV1!.title,
                style: TextStyle(
                  color: HYAppTheme.norTextColors,
                  fontSize: 12.sp,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4.r),
              width: 1.sw,
              child: Text(
                item.smallCardV1!.subtitleStyle.text,
                style: TextStyle(
                  color: HYAppTheme.norGrayColor,
                  fontSize: 10.sp,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
