import 'dart:async';

import 'package:bilibili_getx/core/service/request/home_request.dart';
import 'package:bilibili_getx/ui/widgets/fade_image_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';

import '../../../../../core/model/android/home/pgc_page_bangumi_model.dart';
import '../../../../../core/service/utils/constant.dart';
import '../../../../shared/app_theme.dart';
import '../../../../shared/color_radix_change.dart';
import '../../../../shared/image_asset.dart';
import '../../../../shared/params_sign.dart';
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
    Map<String, dynamic> params = {
      'appkey': Constant.appKey,
      'access_key': '',
      'ad_extra': '',
      'build': '7110300',
      'c_locale': 'zh_CN',
      'channel': 'bili',
      'cursor': '',
      'disable_rcmd': '0',
      'feed_related_season_ids': '',
      'fnval': '272',
      'fnver': '0',
      'fourk': '0',
      'from_context': '',
      'from_scene': '0',
      'is_refresh': '1',
      'jump_module': '',
      'jump_rank_id': '',
      'mobi_app': 'android',
      'platform': 'android',
      's_locale': 'zh_CN',
      'statistics':
          '%7B%22appId%22%3A1%2C%22platform%22%3A3%2C%22version%22%3A%227.11.0%22%2C%22abtest%22%3A%22%22%7D',
      'ts': '1673228123',
    };
    final signEntry = <String, dynamic>{'sign': ParamsSign.getSign(params)};
    params.addEntries(signEntry.entries);

    HYHomeRequest.fetchPageBangumiData(params).then((value) {
      if (value.code == 0) {
        for (final module in value.result!.modules!) {
          String? style = module!.style;
          if (style == "banner_v3") {
            state.widgets.add(buildHomeComicSwiper(module));
          } else if (style == "function") {
            state.widgets.add(buildHomeComicFunctionButton(module));
          } else if (style == "card") {
            state.widgets.add(buildDoubleFeedZone(module));
          } else if (style == "double_feed") {
            state.widgets.add(buildDoubleFeedZone(module));
          } else if (style == "fall_feed") {
          } else {
            print("未知类型");
          }
        }
      }
      Timer(const Duration(seconds: 2), () {
        update();
      });
    });
  }

  ///广告栏
  Widget buildHomeComicSwiper(Module module) {
    return SizedBox(
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
                  itemCount: module.items!.length);
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
                    module.items![index]!.cover!,
                  ),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.low,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8.r))),
          );
        },
        itemCount: module.items!.length,
      ),
    );
  }

  ///功能按钮
  Widget buildHomeComicFunctionButton(Module module) {
    return Container(
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
                      module.items![index]!.cover!,
                    ),
                    fit: BoxFit.fill,
                    placeholderFit: BoxFit.fill,
                  ),
                ),
                10.verticalSpace,
                Text(
                  module.items![index]!.title!,
                  style: TextStyle(
                    color: HYAppTheme.norTextColors,
                    fontSize: 10.sp,
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: module.items!.length,
      ),
    );
  }

  ///一行两个
  Widget buildDoubleFeedZone(Module module) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 4.r),
      itemCount: module.items!.length,
      controller: state.customScrollController,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.1,
        crossAxisSpacing: 8.r,
        mainAxisSpacing: 8.r,
      ),
      itemBuilder: (ctx, index) {
        return Container(
          decoration: BoxDecoration(
              boxShadow: [HYAppTheme.norBoxShadow],
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              color: HYAppTheme.norWhite01Color),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    child: DefaultFadeImage(
                      imageUrl: module.items![index]!.cover!,
                      height: 105.r,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      height: 40.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        gradient: LinearGradient(
                          colors: [
                            HYAppTheme.norTextColors.withOpacity(.7),
                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding:
                          EdgeInsets.only(right: 8.r, left: 8.r, bottom: 6.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            module.items![index]!.bottomLeftBadge!.text!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                            ),
                          ),
                          Text(
                            module.items![index]!.stat!.followView!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  module.items![index]!.badgeInfo != null
                      ? Positioned(
                          right: 0,
                          top: 5.r,
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorRadixChange.hexColor(module
                                  .items![index]!.badgeInfo!.bgColor!
                                  .substring(1)),
                              borderRadius: BorderRadius.horizontal(
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
                              module.items![index]!.badgeInfo!.text!,
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
                padding: EdgeInsets.only(left: 5.r),
                alignment: Alignment.centerLeft,
                child: Text(
                  module.items![index]!.title!,
                  style: TextStyle(
                    color: HYAppTheme.norTextColors,
                    fontSize: 13.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              5.verticalSpace,
              Container(
                margin: EdgeInsets.only(left: 5.r),
                padding: EdgeInsets.all(2.r),
                decoration: BoxDecoration(
                    color: HYAppTheme.norWhite05Color,
                    borderRadius: BorderRadius.all(
                      const Radius.circular(2).r,
                    )),
                child: Text(
                  module.items![index]!.subTitleLeftBadge == null
                      ? "0.0"
                      : module.items![index]!.subTitleLeftBadge!.text!,
                  style: TextStyle(
                    color: const Color.fromRGBO(241, 129, 56, 1),
                    fontSize: 12.sp,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
