import 'dart:io';

import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';

import '../../../core/I18n/str_res_keys.dart';
import '../../shared/math_compute.dart';
import '../../widgets/bangumi_swiper_pagination.dart';
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
              return initWebMallView();
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
        return false;
      },
      child: Scaffold(
        body: EasyRefresh(
          onLoad: () async {
            ///下拉加载
            logic.loadingAndroidMallData();
          },
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
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
                        SR.vipMall.tr,
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
                    } else {
                      return Container();
                    }
                  },
                  childCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///搜索（顶部的简单搜索框）
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

  ///搜索（初始搜索框）
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
    return NotificationListener(
      onNotification: (ScrollNotification notification) {
        logic.expandSwiperHeight(notification);
        return false;
      },
      child: SizedBox(
        width: 1.sw,
        height: state.swiperHeight,
        child: Swiper(
          loop: false,
          pagination: SwiperPagination(
            builder: SwiperCustomPagination(
              builder: (ctx, config) {
                return RoundRectSwiperPagination(
                  currentIndex: config.activeIndex,
                  itemCount: 2,
                );
              },
            ),
          ),
          itemBuilder: (ctx, index) {
            if (index == 0) {
              List<Widget> children = [];
              for (var item in state.vo.ipTabVo.ipTabs) {
                Widget child = Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 75.w,
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
                                color: HYAppTheme.norTextColors,
                                fontSize: 12.sp),
                          ),
                          25.verticalSpace,
                          Text(
                            item.imgTag,
                            style: TextStyle(
                                color: HYAppTheme.norTextColors,
                                fontSize: 10.sp),
                          )
                        ],
                      ),
                    ),
                  ],
                );
                children.add(child);
              }
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: children,
              );
            } else {
              return Container(
                width: 1.sw,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 5,
                  ),
                  itemBuilder: (ctx, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(4.r)),
                          child: FadeInImage(
                            width: 45.w,
                            height: 45.w,
                            fit: BoxFit.cover,
                            placeholderFit: BoxFit.cover,
                            placeholder:
                                AssetImage(ImageAssets.icUpperVideoDefaultPNG),
                            image: NetworkImage(
                                getImageHttpUrl(state.vo.ipTabVo.subIpTabs[index].imageUrl)),
                          ),
                        ),
                        3.verticalSpace,
                        Text(
                          state.vo.ipTabVo.subIpTabs[index].name,
                          style: TextStyle(
                            color: HYAppTheme.norTextColors,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'bilibiliFonts'
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: state.vo.ipTabVo.subIpTabs.length,
                ),
              );
            }
          },
          itemCount: 2,
        ),
      ),
    );
  }

  ///第二大部分（手办、周边.....）
  Widget buildAndroidMallViewSliverListItem02() {
    List<Widget> children = [];
    for (var item in state.vo.tabs) {
      Widget child = Container(
        padding: EdgeInsets.symmetric(horizontal: 15.r),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              "http://${item.imageUrl.substring(2)}",
              width: 40.w,
              height: 40.w,
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
        ),
      );
      children.add(child);
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      height: 70.w,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: children,
      ),
    );
  }

  ///瀑布流布局（轮播图、一大块、四小块，两个一行的多块）
  Widget buildAndroidMallViewSliverListItem03() {
    List<Widget> children = [];
    children.add(StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 1.6,
      child: buildAndroidMallViewSliverListItem0301(),
    ));
    children.add(StaggeredGridTile.count(
      crossAxisCellCount: 2,
      mainAxisCellCount: 1.6,
      child: buildAndroidMallViewSliverListItem0302(),
    ));
    children.add(StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: buildAndroidMallViewSliverListItem0303(1),
    ));
    children.add(StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: buildAndroidMallViewSliverListItem0303(2),
    ));
    children.add(StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: buildAndroidMallViewSliverListItem0303(3),
    ));
    children.add(StaggeredGridTile.count(
      crossAxisCellCount: 1,
      mainAxisCellCount: 1,
      child: buildAndroidMallViewSliverListItem0303(4),
    ));
    children.addAll(buildAndroidMallViewSliverListItem0304());

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.r),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 5.r,
        crossAxisSpacing: 5.r,
        children: children,
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
  Widget buildAndroidMallViewSliverListItem0303(index) {
    List<Color> colors = [
      HYAppTheme.norTextColors,
      HYAppTheme.norYellow04Colors,
      HYAppTheme.norYellow05Colors,
      HYAppTheme.norBlue05Colors,
      HYAppTheme.norTextColors,
    ];
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              offset: const Offset(1, 1),
              spreadRadius: .5,
              blurRadius: 1,
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(3.r))),
      child: Stack(
        children: [
          SizedBox(
            width: 70.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                4.verticalSpace,
                Text(
                  state.vo.newBlocks[index].title,
                  style: TextStyle(
                      color: HYAppTheme.norTextColors,
                      fontSize: 12.sp,
                      fontFamily: 'bilibiliFonts'),
                ),
                Image.network(
                  getImageHttpUrl(
                      state.vo.newBlocks[index].blockItemVOs[0].imageUrl),
                  height: 60.w,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
          state.vo.newBlocks[index].blockItemVOs[0].benefitInfo != null &&
                  state.vo.newBlocks[index].blockItemVOs[0].benefitInfo!
                          .partOne !=
                      null
              ? Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    alignment: Alignment.center,
                    width: 1.sw,
                    padding:
                        EdgeInsets.symmetric(horizontal: 6.r, vertical: 2.r),
                    decoration: BoxDecoration(
                        color: HYAppTheme.norGrayColor.withOpacity(.2),
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Text(
                      state.vo.newBlocks[index].blockItemVOs[0].benefitInfo!
                              .partOne! +
                          state.vo.newBlocks[index].blockItemVOs[0].benefitInfo!
                              .partTwo!,
                      style: TextStyle(
                        color: colors[index],
                        fontFamily: 'bilibiliFonts',
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  ///第四部分（一行两个的最大块部分）
  List<Widget> buildAndroidMallViewSliverListItem0304() {
    List<Widget> feeds = [];
    for (var item in state.vo.feeds.list) {
      List<InlineSpan> titleTagNames = [];
      List<InlineSpan> recommendTagNames = [];
      List<InlineSpan> serviceTagNames = [];
      List<InlineSpan> marketingTagNames = [];
      if (item.tags != null) {
        ///标签（位于标题头部的标签）
        if (item.tags!.titleTagNames != null) {
          for (var tag in item.tags!.titleTagNames!) {
            titleTagNames.add(
              WidgetSpan(
                child: Container(
                  margin: EdgeInsets.only(right: 5.r),
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                      color: HYAppTheme.norGrayColor.withOpacity(.1),
                      borderRadius: BorderRadius.circular(2.r)),
                  child: Text(
                    tag,
                    style: TextStyle(
                        color: HYAppTheme.norGrayColor.withOpacity(1),
                        fontSize: 10.sp,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'bilibiliFonts'),
                  ),
                ),
              ),
            );
          }
        }

        ///标签（标题下一行的标签）recommendTagNames
        if (item.tags!.recommendTagNames != null) {
          for (var tag in item.tags!.recommendTagNames!) {
            recommendTagNames.add(
              WidgetSpan(
                child: Container(
                  margin: EdgeInsets.only(right: 5.r, top: 3.r),
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                      color: HYAppTheme.norYellow03Colors.withOpacity(.2),
                      borderRadius: BorderRadius.circular(3.r)),
                  child: Text(
                    tag,
                    style: TextStyle(
                        color: HYAppTheme.norYellow03Colors.withOpacity(1),
                        fontSize: 9.sp,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'bilibiliFonts'),
                  ),
                ),
              ),
            );
          }
        }

        ///标签（标题下一行的标签）serviceTagNames
        if (item.tags!.serviceTagNames != null) {
          for (var tag in item.tags!.serviceTagNames!) {
            serviceTagNames.add(
              WidgetSpan(
                child: Container(
                  margin: EdgeInsets.only(right: 5.r, top: 3.r),
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                      color: HYAppTheme.norBlue04Colors.withOpacity(.2),
                      borderRadius: BorderRadius.circular(3.r)),
                  child: Text(
                    tag,
                    style: TextStyle(
                        color: HYAppTheme.norBlue04Colors.withOpacity(1),
                        fontSize: 9.sp,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'bilibiliFonts'),
                  ),
                ),
              ),
            );
          }
        }

        ///标签（标题下一行的标签）marketingTagNames
        if (item.tags!.marketingTagNames != null) {
          for (var tag in item.tags!.marketingTagNames!) {
            marketingTagNames.add(
              WidgetSpan(
                child: Container(
                  margin: EdgeInsets.only(right: 5.r, top: 3.r),
                  padding: EdgeInsets.all(2.r),
                  decoration: BoxDecoration(
                      color: HYAppTheme.norMainThemeColors.withOpacity(.2),
                      borderRadius: BorderRadius.circular(3.r)),
                  child: Text(
                    tag,
                    style: TextStyle(
                        color: HYAppTheme.norMainThemeColors.withOpacity(1),
                        fontSize: 9.sp,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'bilibiliFonts'),
                  ),
                ),
              ),
            );
          }
        }
      }

      Widget child = StaggeredGridTile.fit(
        crossAxisCellCount: 2,
        child: Card(
          margin: EdgeInsets.zero,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(5.r)),
                  child: FadeInImage(
                    height: 190.w,
                    placeholder: AssetImage(ImageAssets.icUpperVideoDefaultPNG),
                    placeholderFit: BoxFit.cover,
                    fit: BoxFit.cover,
                    image: NetworkImage(getImageHttpUrl(item.imageUrls[0])),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.r, horizontal: 5.r),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            item.tags != null
                                ? TextSpan(children: titleTagNames)
                                : TextSpan(),
                            TextSpan(
                              text: item.title,
                              style: TextStyle(
                                  color: HYAppTheme.norTextColors,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'bilibiliFonts'),
                            )
                          ],
                        ),
                      ),
                      2.verticalSpace,
                      Text.rich(
                        TextSpan(
                          children: [
                            item.tags != null
                                ? TextSpan(children: recommendTagNames)
                                : TextSpan(),
                            item.tags != null
                                ? TextSpan(children: serviceTagNames)
                                : TextSpan(),
                            item.tags != null
                                ? TextSpan(children: marketingTagNames)
                                : TextSpan(),
                          ],
                        ),
                      ),
                      10.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            item.priceDesc != null
                                ? Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "￥",
                                          style: TextStyle(
                                            color:
                                                HYAppTheme.norMainThemeColors,
                                            fontSize: 14.sp,
                                            fontFamily: 'bilibiliFonts',
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        TextSpan(
                                          text: item.priceDesc![0],
                                          style: TextStyle(
                                            color:
                                                HYAppTheme.norMainThemeColors,
                                            fontSize: 18.sp,
                                            fontFamily: 'bilibiliFonts',
                                            fontWeight: FontWeight.normal,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                : Container(),
                            item.like != null
                                ? Text.rich(TextSpan(children: [
                                    WidgetSpan(
                                        child: Image.asset(
                                      ImageAssets.heartPNG,
                                      width: 14.sp,
                                      height: 14.sp,
                                    )),
                                    TextSpan(
                                      text: " ${item.like}",
                                      style: TextStyle(
                                        color: HYAppTheme.norGrayColor,
                                        fontSize: 12.sp,
                                        fontFamily: 'bilibiliFonts',
                                        fontWeight: FontWeight.normal,
                                      ),
                                    )
                                  ]))
                                : Container()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      feeds.add(child);
    }
    return feeds;
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
