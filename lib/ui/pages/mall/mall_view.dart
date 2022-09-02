import 'dart:io';

import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';

import '../../widgets/price_mark.dart';
import 'mall_logic.dart';

class MallScreen extends StatelessWidget {
  static const String routeName = "/mall";
  final logic = Get.find<MallLogic>();
  final state = Get.find<MallLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<MallLogic>(
        builder: (logic) {
          if (state.isLoadingMallData == false) {
            if (kIsWeb) {
              return initWebMallView();
            } else if (Platform.isAndroid) {
              return initAndroidMallView();
            } else if (Platform.isWindows) {
              // return initWebMallView();
              return initAndroidMallView();
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

  ///初始化android界面
  Widget initAndroidMallView() {
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        logic.hideTitle(notification);
        return true;
      },
      child: Scaffold(
        body: CustomScrollView(
          controller: ScrollController(),
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              expandedHeight: 90.h,
              title: Opacity(
                opacity: state.appBarOpacity,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "会员购",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: HYAppTheme.norTextColors,
                        fontSize: 15.sp,
                        fontFamily: 'bilibiliFonts',
                      ),
                    ),
                    5.horizontalSpace,
                    Text(
                      state.vo.slogan,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: HYAppTheme.norGrayColor,
                        fontSize: 10.sp,
                        fontFamily: 'bilibiliFonts',
                      ),
                    ),
                  ],
                ),
              ),
              elevation: .1,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding:
                    EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
                centerTitle: false,
                title: Opacity(
                  opacity: 1 - state.appBarOpacity,
                  child: buildAndroidMallViewSimpleSearch(),
                ),
                background: Container(
                  alignment: Alignment.bottomCenter,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 10.r, bottom: 10.r),
                  child: buildAndroidMallViewSearch(),
                ),
                collapseMode: CollapseMode.parallax,
              ),
              actions: buildAndroidMallViewActions(),
              pinned: true,
              floating: false,
              snap: false,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (ctx, index) {
                  if (index == 0) {
                    return buildAndroidMallViewSliverListItem01();
                  } else if (index == 1) {
                    return buildAndroidMallViewSliverListItem02();
                  } else if (index == 2) {
                    return buildAndroidMallViewSliverListItem03();
                  } else if (index == 3) {
                    return Container(
                      child: Text("data"),
                    );
                  } else {
                    return Container();
                  }
                },
                childCount: 4,
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              delegate: SliverChildBuilderDelegate(
                (ctx, index) {
                  return Container(
                    child: Text("data"),
                  );
                },
                childCount: 50,
              ),
            )
          ],
        ),
      ),
    );
  }

  ///搜索（上拉后的搜索）
  Widget buildAndroidMallViewSimpleSearch() {
    return Container(
      height: 30.h,
      width: 230.w,
      decoration: BoxDecoration(
        color: HYAppTheme.norWhite07Color,
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          5.horizontalSpace,
          Image.asset(
            ImageAssets.searchCustomPNG,
            width: 15.sp,
            height: 15.sp,
          ),
          5.horizontalSpace,
          Text(
            state.vo.searchUrl.titleList[0],
            style: TextStyle(
                color: HYAppTheme.norGrayColor,
                fontSize: 12.sp,
                fontFamily: 'bilibiliFonts',
                fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }

  ///搜索（初始搜索）
  Widget buildAndroidMallViewSearch() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 30.h,
            decoration: BoxDecoration(
              color: HYAppTheme.norWhite07Color,
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    5.horizontalSpace,
                    Image.asset(
                      ImageAssets.searchCustomPNG,
                      width: 15.sp,
                      height: 15.sp,
                    ),
                    5.horizontalSpace,
                    Text(
                      state.vo.searchUrl.titleList[0],
                      style: TextStyle(
                        color: HYAppTheme.norGrayColor,
                        fontSize: 12.sp,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.r),
                  child: Image.asset(ImageAssets.arPNG,
                      width: 14.sp, height: 14.sp),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 25.sp,
          width: 25.sp,
          margin: EdgeInsets.symmetric(horizontal: 10.r),
          child: FadeInImage(
            placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
            image: NetworkImage(
                "http://${state.vo.categoryTabVo.imageUrl.substring(2)}"),
            fit: BoxFit.cover,
            placeholderFit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  ///actions
  List<Widget> buildAndroidMallViewActions() {
    List<Widget> actions = [];
    for (var action in state.vo.entryList) {
      actions.add(
        Container(
          width: 20.sp,
          height: 20.sp,
          margin: EdgeInsets.only(right: 15.r),
          child: FadeInImage(
            placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
            image: NetworkImage("http://${action.imgUrl.substring(2)}"),
            fit: BoxFit.contain,
            placeholderFit: BoxFit.contain,
          ),
        ),
      );
    }
    return actions;
  }

  ///第一大部分
  Widget buildAndroidMallViewSliverListItem01() {
    return SizedBox(
      width: 1.sw,
      height: 80.h,
      child: Swiper(
        itemBuilder: (ctx, index) {
          if (index == 0) {
            List<Widget> children = [];
            for (var item in state.vo.ipTabVo.ipTabs) {
              Widget child = Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 80.h,
                    color: Colors.white,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        offset: const Offset(1, 1),
                        spreadRadius: 1,
                        blurRadius: 1,
                      )
                    ]),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      child: Image.network(
                        "http://${item.bgImage.substring(2)}",
                        height: 56.h,
                        width: 110.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.network(
                      "http://${item.itemImage.substring(2)}",
                      height: 72.h,
                      width: 50.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    left: 3.r,
                    bottom: 3.r,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.name,
                          style: TextStyle(
                              color: HYAppTheme.norTextColors, fontSize: 12.sp),
                        ),
                        25.verticalSpace,
                        Text(
                          item.imgTag,
                          style: TextStyle(
                              color: HYAppTheme.norTextColors, fontSize: 10.sp),
                        )
                      ],
                    ),
                  ),
                ],
              );
              children.add(child);
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: children,
            );
          } else {
            return Container(
              child: Text("data"),
            );
          }
        },
        itemCount: 2,
      ),
    );
  }

  ///第二大部分（手办、周边.....）
  Widget buildAndroidMallViewSliverListItem02() {
    List<Widget> children = [];
    for (var item in state.vo.tabs) {
      Widget child = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            "http://${item.imageUrl.substring(2)}",
            width: 40.sp,
            height: 40.sp,
          ),
          2.verticalSpace,
          Text(
            item.name,
            style: TextStyle(
              fontSize: 12.sp,
              color: HYAppTheme.norTextColors,
              fontWeight: FontWeight.normal,
              fontFamily: 'bilibiliFonts',
            ),
          )
        ],
      );
      children.add(child);
    }
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.r),
      width: 1.sw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: children,
      ),
    );
  }

  ///瀑布流布局（轮播图、一大块、四小块）
  Widget buildAndroidMallViewSliverListItem03() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 8.r,
        crossAxisSpacing: 8.r,
        children: [
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1.6,
            child: buildAndroidMallViewSliverListItem0301(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: 1.6,
            child: buildAndroidMallViewSliverListItem0302(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: buildAndroidMallViewSliverListItem0303(),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Container(
              child: Text("11111111"),
              width: 100.w,
              height: 100.w,
              color: Colors.red,
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Container(
              child: Text("11111111"),
              width: 100.w,
              height: 100.w,
              color: Colors.red,
            ),
          ),
          StaggeredGridTile.count(
            crossAxisCellCount: 1,
            mainAxisCellCount: 1,
            child: Container(
              child: Text("11111111"),
              width: 100.w,
              height: 100.w,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  ///第三部分的第1个子部分（轮播图）
  Widget buildAndroidMallViewSliverListItem0301() {
    return Swiper(
      autoplay: true,
      pagination: SwiperPagination(
        builder: DotSwiperPaginationBuilder(
          activeColor: HYAppTheme.norMainThemeColors,
          color: Colors.white,
          size: 5.sp,
          activeSize: 6.sp,
          space: 2.sp,
        ),
      ),
      itemBuilder: (ctx, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(5.r),
          child: Image.network(
            "http://${state.vo.banners[index].pic.substring(2)}",
            fit: BoxFit.fill,
          ),
        );
      },
      itemCount: state.vo.banners.length,
    );
  }

  ///第三部分的第2个子部分（一大块）
  Widget buildAndroidMallViewSliverListItem0302() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(3.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.r)),
            gradient: LinearGradient(
              begin: const Alignment(0, -1),
              end: const Alignment(0, 1),
              colors: [
                Colors.deepPurple.withOpacity(.2),
                Colors.deepPurple.withOpacity(0)
              ],
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.sp,
                child: Text(
                  state.vo.newBlocks[0].title,
                  style: TextStyle(
                    color: HYAppTheme.norTextColors,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'bilibiliFonts',
                    fontSize: 16.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.sp,
                child: Text(
                  state.vo.newBlocks[0].tags![0],
                  style: TextStyle(
                    color: HYAppTheme.norGrayColor,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'bilibiliFonts',
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 60.w,
                  height: 60.w,
                  child: Image.network(
                    state.vo.newBlocks[0].blockItemVOs[0].imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                10.verticalSpace,
                PriceMark(
                  text:
                      (state.vo.newBlocks[0].blockItemVOs[0].priceSymbol! == "¥"
                              ? "￥"
                              : state.vo.newBlocks[0].blockItemVOs[0]
                                  .priceSymbol!) +
                          state.vo.newBlocks[0].blockItemVOs[0].priceDesc![0],
                  color: Colors.deepPurple.withOpacity(.7),
                )
              ],
            ),
            10.horizontalSpace,
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 60.w,
                  height: 60.w,
                  child: Image.network(
                    state.vo.newBlocks[0].blockItemVOs[1].imageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                10.verticalSpace,
                PriceMark(
                  text:
                      (state.vo.newBlocks[0].blockItemVOs[0].priceSymbol! == "¥"
                              ? "￥"
                              : state.vo.newBlocks[0].blockItemVOs[0]
                                  .priceSymbol!) +
                          state.vo.newBlocks[0].blockItemVOs[0].priceDesc![0],
                  color: Colors.deepPurple.withOpacity(.7),
                )
              ],
            ),
          ],
        )
      ],
    );
  }

  ///第三部分的第3个子部分（四小块）
  Widget buildAndroidMallViewSliverListItem0303() {
    return Row(
      children: [

      ],
    );
  }

  ///初始化Web界面
  Widget initWebMallView() {
    return state.result.isNotEmpty
        ? Scaffold(
            body: GridView.builder(
              controller: ScrollController(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 120.w,
                  mainAxisSpacing: 10.r,
                  crossAxisSpacing: 10.r),
              itemBuilder: (ctx, index) {
                return Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    buildMallItemBackGround(index),
                    buildMallItemContent(index),
                  ],
                );
              },
              itemCount: state.total,
            ),
          )
        : Container(
            margin: EdgeInsets.only(top: 30.h),
            alignment: Alignment.topCenter,
            width: 1.sw,
            child: const RefreshProgressIndicator(
              value: null,
              color: HYAppTheme.norMainThemeColors,
            ),
          );
  }

  ///会员购列表的每一项背景
  Widget buildMallItemBackGround(index) {
    return MouseRegion(
      onHover: (event) {
        logic.mouseHoverAction(index);
      },
      onExit: (event) {
        logic.mouseExitAction(index);
      },
      child: Container(
        width: 172.w,
        height: 72.w,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black.withOpacity(.1),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.2),
                offset: state.backgroundOffset[index],
                blurRadius: state.backgroundBlurRadius[index],
                spreadRadius: state.backgroundSpreadRadius[index],
              ),
            ],
            borderRadius: BorderRadius.circular(5.r)),
      ),
    );
  }

  ///内容
  Widget buildMallItemContent(int index) {
    return Positioned(
      left: 6.w,
      bottom: 5.w,
      child: MouseRegion(
        onHover: (event) {
          logic.mouseHoverAction(index);
        },
        onExit: (event) {
          logic.mouseExitAction(index);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              child: Container(
                width: 55.w,
                height: 75.w,
                margin: EdgeInsets.only(bottom: state.coverBottomGap[index]),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.3),
                      offset: const Offset(1.0, 1.0),
                      blurRadius: 2,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: FadeInImage(
                  placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
                  image: NetworkImage("http:${state.result[index].cover}"),
                  fit: BoxFit.cover,
                  placeholderFit: BoxFit.cover,
                ),
              ),
            ),
            8.horizontalSpace,
            Container(
              margin: EdgeInsets.only(bottom: 5.r),
              height: 52.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100.w,
                    child: Text(
                      state.result[index].projectName,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: HYAppTheme.norTextColors,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 10.sp,
                        width: 10.sp,
                        child: Image.asset(ImageAssets.schedulePNG),
                      ),
                      3.horizontalSpace,
                      SizedBox(
                        height: 10.sp,
                        child: Text(
                          "${state.result[index].startTime} - ${state.result[index].endTime}",
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: HYAppTheme.norGrayColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 10.sp,
                        width: 10.sp,
                        child: Image.asset(ImageAssets.locationPNG),
                      ),
                      3.horizontalSpace,
                      SizedBox(
                        height: 10.sp,
                        child: Text(
                          state.result[index].venueName,
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: HYAppTheme.norGrayColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: "￥",
                                style: TextStyle(
                                  color: HYAppTheme.norMainThemeColors,
                                  fontSize: 14.sp,
                                )),
                            TextSpan(
                              text: (state.result[index].priceLow ~/ 100)
                                  .toString(),
                              style: TextStyle(
                                color: HYAppTheme.norMainThemeColors,
                                fontSize: 20.sp,
                              ),
                            ),
                            TextSpan(
                              text: "  起  ",
                              style: TextStyle(
                                color: HYAppTheme.norGrayColor,
                                fontSize: 10.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(2.r),
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: HYAppTheme.norMainThemeColors)),
                        child: Text(
                          "独家",
                          style: TextStyle(
                            color: HYAppTheme.norMainThemeColors,
                            fontSize: 10.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
