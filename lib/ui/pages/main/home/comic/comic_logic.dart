import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';

import '../../../../../core/model/pgc_page_bangumi_model.dart';
import '../../../../../core/service/request/pgc_page_bangumi_request.dart';
import '../../../../shared/app_theme.dart';
import '../../../../shared/color_radix_change.dart';
import '../../../../shared/image_asset.dart';
import '../../../../widgets/bangumi_rank_zone.dart';
import '../../../../widgets/bangumi_swiper_pagination.dart';
import 'comic_state.dart';

class ComicLogic extends GetxController {
  final ComicState state = ComicState();

  @override
  void onReady() {
    fetchComicData();
    super.onReady();
  }

  @override
  void onClose() {
    state.easyRefreshScrollController.dispose();
    state.buttonsScrollController.dispose();
    state.swiperController.dispose();
    super.onClose();
  }

  void fetchComicData() {
    ///获取动画的json数据
    HYGrcPageBangumiRequest.getPageBangumiData().then((value) {
      state.modules.addAll(value.modules);
      state.modulesList00.addAll(value.modules.getRange(2, 3));
      state.modulesList01.addAll(value.modules.getRange(3, 8));
      state.modulesList02.addAll(value.modules.getRange(9, 14));

      ///动态添加
      state.widgets.addAll([
        buildHomeComicSwiper(),
        10.verticalSpace,
        buildHomeComicFunctionButton(),
        10.verticalSpace,
        buildDoubleFeedZone(state.modulesList00),
        20.verticalSpace,
        BuildBangumiRankZone(8, state.modules),
        buildDoubleFeedZone(state.modulesList01),
        20.verticalSpace,
        BuildBangumiRankZone(14, state.modules),
        buildDoubleFeedZone(state.modulesList02),
      ]);
      Timer(const Duration(seconds: 2), () {
        update();
      });
    });
  }

  ///广告栏
  Widget buildHomeComicSwiper() {
    return state.modules.isNotEmpty
        ? SizedBox(
            height: 200.w,
            width: 1.sw,
            child: Swiper(
              scale: 1,
              viewportFraction: 1,
              autoplay: true,
              autoplayDelay: 3000,
              controller: state.swiperController,
              pagination: SwiperPagination(
                alignment: Alignment.bottomCenter,
                builder: SwiperCustomPagination(
                  builder: (ctx, config) {
                    return BangumiSwiperPagination(
                        currentIndex: config.activeIndex,
                        itemCount: state.modules[0].items.length);
                  },
                ),
              ),
              itemBuilder: (ctx, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 30).r,
                  height: 260.h,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          state.modules[0].items[index].cover!,
                        ),
                        fit: BoxFit.fill,
                        filterQuality: FilterQuality.low,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(8.r))),
                );
              },
              itemCount: state.modules[0].items.length,
            ),
          )
        : Container();
  }

  ///功能按钮
  Widget buildHomeComicFunctionButton() {
    return state.modules.isNotEmpty
        ? Container(
            width: .9.sw,
            height: 80.w,
            alignment: Alignment.center,
            child: ListView.builder(
              shrinkWrap: true,
              controller: state.buttonsScrollController,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 20).r,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 35.r,
                        height: 35.r,
                        child: FadeInImage(
                          placeholder: AssetImage(
                            ImageAssets.icUpperVideoDefaultPNG,
                          ),
                          image: NetworkImage(
                            state.modules[1].items[index].cover!,
                          ),
                          fit: BoxFit.fill,
                          placeholderFit: BoxFit.fill,
                        ),
                      ),
                      10.verticalSpace,
                      Text(
                        state.modules[1].items[index].title,
                        style: TextStyle(
                          color: HYAppTheme.norTextColors,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: state.modules[1].items.length,
            ),
          )
        : Container();
  }

  ///一行两个
  Widget buildDoubleFeedZone(List<Module> modulesList) {
    List<Item> items = [];
    for (var module in modulesList) {
      items.addAll(module.items);
    }
    return modulesList.isNotEmpty
        ? CustomScrollView(
            controller: state.customScrollController,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            slivers: [
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    return SizedBox(
                      height: 200.w,
                      child: Card(
                        elevation: .3,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(items[index].cover!),
                                        fit: BoxFit.fill,
                                        filterQuality: FilterQuality.low),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5.r),
                                    ),
                                  ),
                                  height: 110.w,
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: Container(
                                    height: 40.w,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          HYAppTheme.norTextColors
                                              .withOpacity(.7),
                                          Colors.transparent,
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding:
                                        const EdgeInsets.only(right: 8, left: 8)
                                            .r,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          items[index].bottomLeftBadge!.text,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                        Text(
                                          items[index].stat!.followView,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                items[index].badgeInfo != null
                                    ? Positioned(
                                        right: 0.w,
                                        top: 10.h,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: ColorRadixChange.hexColor(
                                                items[index]
                                                    .badgeInfo!
                                                    .bgColor!
                                                    .substring(1)),
                                            borderRadius:
                                                BorderRadius.horizontal(
                                              left: Radius.circular(8.r),
                                            ),
                                          ),
                                          padding: const EdgeInsets.only(
                                            left: 5,
                                            right: 3,
                                            top: 2,
                                            bottom: 4,
                                          ).r,
                                          child: Text(
                                            items[index].badgeInfo!.text!,
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                            5.verticalSpace,
                            Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10).r,
                              child: Text(
                                items[index].title,
                                style: TextStyle(
                                  color: HYAppTheme.norTextColors,
                                  fontSize: 12.sp,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            5.verticalSpace,
                            Container(
                              padding: const EdgeInsets.only(left: 10).r,
                              child: Container(
                                padding: const EdgeInsets.all(2).r,
                                decoration: BoxDecoration(
                                    color: HYAppTheme.norWhite05Color,
                                    borderRadius: BorderRadius.all(
                                      const Radius.circular(2).r,
                                    )),
                                child: Text(
                                  items[index].subTitleLeftBadge == null
                                      ? "0.0"
                                      : items[index].subTitleLeftBadge!.text,
                                  style: TextStyle(
                                    color:
                                        const Color.fromRGBO(241, 129, 56, 1),
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: items.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              ),
            ],
          )
        : Container();
  }
}
