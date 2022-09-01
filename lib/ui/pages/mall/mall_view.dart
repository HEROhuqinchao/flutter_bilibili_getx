import 'dart:io';

import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
        return true;
      },
      child: Scaffold(
        body: CustomScrollView(
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
                        color: HYAppTheme.norTextColors,
                        fontSize: 15.sp,
                      ),
                    ),
                    5.horizontalSpace,
                    Text(
                      state.vo.slogan,
                      style: TextStyle(
                        color: HYAppTheme.norGrayColor,
                        fontSize: 10.sp,
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
              floating: true,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (ctx, index) {
                  if (index == 0) {
                    return Container(
                      child: Text("data"),
                    );
                  } else if (index == 1) {
                    return Container(
                      child: Text("data"),
                    );
                  } else if (index == 2) {
                    return Container(
                      child: Text("data"),
                    );
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
            ),
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
