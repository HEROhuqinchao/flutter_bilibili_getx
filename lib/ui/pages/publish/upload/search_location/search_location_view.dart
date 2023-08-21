import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/I18n/str_res_keys.dart';
import 'search_location_logic.dart';

class SearchLocationScreen extends StatelessWidget {
  static String routeName = "/search_location";
  final logic = Get.find<SearchLocationLogic>();
  final state = Get.find<SearchLocationLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchLocationLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          elevation: .5,
          backgroundColor: HYAppTheme.norWhite01Color,
          automaticallyImplyLeading: false,
          leading: null,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0).r,
                  decoration: BoxDecoration(
                      color: HYAppTheme.norGrayColor.withOpacity(.1),
                      borderRadius: BorderRadius.all(Radius.circular(40.r))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 15.sp,
                        height: 15.sp,
                        child: Image.asset(ImageAssets.searchCustomPNG),
                      ),
                      8.horizontalSpace,
                      Expanded(
                        child: TextField(
                          textInputAction: TextInputAction.search,
                          onSubmitted: (value) {
                            logic.clearSearchLocationCache(value);
                            logic.fetchSearchLocationResult();
                          },
                          autofocus: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: SR.searchNearbyLocation.tr,
                              contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.r),
                              isCollapsed: true),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              10.horizontalSpace,
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Text(
                  SR.cancel.tr,
                  style: TextStyle(
                      color: HYAppTheme.norMainThemeColors,
                      fontSize: 14.sp,
                      fontFamily: 'bilibiliFonts',
                      fontWeight: FontWeight.normal),
                ),
              )
            ],
          ),
        ),
        body: buildSearchLocationBody(),
      );
    });
  }

  Widget buildSearchLocationBody() {
    if (state.poiInfoList.isEmpty) {
      return const Center(
        child: Text("暂时未查询到地名，请尝试重新搜索..."),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20.r),
        child: ListView.separated(
          controller: state.scrollController,
          itemBuilder: (ctx, index) {
            BMFPOIDetailInfo? detailInfo = state.poiInfoList[index].detailInfo;
            return ListTile(
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 15.sp,
                    height: 15.sp,
                    child: buildSearchLocationItemIcon(detailInfo!.type),
                  ),
                  5.horizontalSpace,
                  Container(
                    alignment: Alignment.center,
                    height: 20.sp,
                    child: Text(
                      state.poiInfoList[index].name!,
                      style: TextStyle(
                          color: HYAppTheme.norTextColors, fontSize: 14.sp),
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                "距离${detailInfo.distance}米 · ${state.poiInfoList[index].address!}",
                style:
                    TextStyle(color: HYAppTheme.norGrayColor, fontSize: 12.sp),
              ),
            );
          },
          itemCount: state.poiInfoList.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider();
          },
        ),
      );
    }
  }

  Widget buildSearchLocationItemIcon(type) {
    if (type == "enterprise") {
      return Image.asset(ImageAssets.enterprisePNG);
    } else if (type == "shopping") {
      return Image.asset(ImageAssets.shoppingPNG);
    } else if (type == "life") {
      return Image.asset(ImageAssets.lifePNG);
    } else if (type == "education") {
      return Image.asset(ImageAssets.educationPNG);
    } else {
      return Container();
    }
  }
}
