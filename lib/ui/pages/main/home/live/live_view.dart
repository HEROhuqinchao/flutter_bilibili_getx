import 'dart:io';

import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:bilibili_getx/ui/pages/main/home/home_logic.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:bilibili_getx/ui/widgets/fade_image_default.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';

import '../../../../../core/model/xliveAppInterfaceV2IndexFeedModel.dart';
import '../../../../shared/app_theme.dart';
import 'live_logic.dart';

class LiveScreen extends StatefulWidget {
  static const String routeName = "/home/live";

  @override
  State<LiveScreen> createState() => LiveScreenState();
}

class LiveScreenState extends State<LiveScreen>
    with AutomaticKeepAliveClientMixin {
  final logic = Get.find<LiveLogic>();
  final state = Get.find<LiveLogic>().liveState;
  final homeState = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<LiveLogic>(
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
    );
  }

  Widget initWebLiveView() {
    return Container(
      child: Text("data"),
    );
  }

  ///初始化Android界面
  Widget initAndroidLiveView() {
    for (var item in state.cardList) {
      if (item.cardType == "banner_v1") {
        state.cardDataBannerV1 = item.cardData;
      } else if (item.cardType == "area_entrance_v3") {
        state.cardDataAreaEntranceV3 = item.cardData;
      } else if (item.cardType == "activity_card_v1") {
        // state.cardDataActivityCardV1 = item.cardData;
      } else if (item.cardType == "small_card_v1") {
        state.cardDataSmallCardV1.add(item.cardData);
      } else {
        if (Constant.isDebug) {
          print("不存在${item.cardType}");
        }
      }
    }
    return Padding(
      padding: EdgeInsets.all(4.r),
      child: CustomScrollView(
        // controller: state.customScrollViewScrollController,
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: buildBannerV1(),
          ),
          SliverAppBar(
            elevation: 0,
            backgroundColor: HYAppTheme.norWhite01Color,
            pinned: true,
            leading: null,
            automaticallyImplyLeading: false,
            title: buildAreaEntranceV3(state.cardDataAreaEntranceV3),
            actions: [
              Image.asset(
                ImageAssets.moreBlockPNG,
                width: 18.sp,
                height: 18.sp,
              ),
              10.horizontalSpace,
            ],
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return buildSmallCardV1(
                  state.cardDataSmallCardV1[index],
                );
              },
              childCount: state.cardDataSmallCardV1.length,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 6.r,
                crossAxisSpacing: 6.r,
                mainAxisExtent: 140.w),
          )
        ],
      ),
    );
  }

  ///初始化广告
  Widget buildBannerV1() {
    return Container(
      color: HYAppTheme.norWhite01Color,
      height: state.headerHeight,
      width: 1.sw,
      child: Swiper(
        autoplay: state.isAutoPlay,
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
            child: DefaultFadeImage(
              imageUrl: state.cardDataBannerV1.bannerV1!.list[index].pic,
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: state.cardList[0].cardData.bannerV1!.list.length,
      ),
    );
  }

  ///导航栏
  Widget buildAreaEntranceV3(CardData cardData) {
    List<Tab> tabs = [const Tab(text: '推荐')];
    for (var item in cardData.areaEntranceV3!.list) {
      tabs.add(Tab(
        text: item.title,
      ));
    }
    return DefaultTabController(
      // key: state.liveTabBarGlobalKey,
      length: tabs.length,
      child: SizedBox(
        width: .87.sw,
        child: TabBar(
          onTap: (index) {
            logic.selectLabelAndFetchData(index);
          },
          indicatorColor: Colors.transparent,
          unselectedLabelColor: HYAppTheme.norGrayColor,
          labelColor: HYAppTheme.norTextColors,
          labelPadding: EdgeInsets.symmetric(horizontal: 8.r),
          indicatorSize: TabBarIndicatorSize.label,
          labelStyle: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.normal,
            fontFamily: 'bilibiliFonts',
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.normal,
            fontFamily: 'bilibiliFonts',
          ),
          indicatorWeight: 1.h,
          isScrollable: true,
          tabs: tabs,
        ),
      ),
    );
  }

  // Widget buildActivityCardV1(CardData item) {
  //   return state.cardDataActivityCardV1 == null
  //       ? Container(
  //           color: Colors.yellow,
  //         )
  //       : Container();
  // }

  Widget buildSmallCardV1(CardData item) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(5.r)),
      elevation: 1,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(5.r)),
                child: DefaultFadeImage(
                  imageUrl: item.smallCardV1!.cover,
                  width: 1.sw,
                  height: 90.w,
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
