import 'package:bilibili_getx/ui/pages/publish/upload/search_location/search_location_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_baidu_mapapi_search/flutter_baidu_mapapi_search.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/I18n/str_res_keys.dart';
import '../../../../shared/app_theme.dart';
import '../../../../shared/image_asset.dart';
import 'bai_du_map_location_logic.dart';

class BaiDuMapLocationScreen extends StatelessWidget {
  final logic = Get.find<BaiDuMapLocationLogic>();
  final state = Get.find<BaiDuMapLocationLogic>().state;
  static String routeName = "/baidu_map_location";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaiDuMapLocationLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: HYAppTheme.norWhite01Color,
          elevation: .5,
          title: Text(
            SR.iamHere.tr,
            style: TextStyle(
                color: HYAppTheme.norTextColors,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
                fontFamily: 'bilibiliFonts'),
          ),
          leading: Icon(
            Icons.arrow_back,
            size: 20.sp,
            color: HYAppTheme.norTextColors,
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 20).r,
              alignment: Alignment.center,
              child: Text(
                SR.hideLocation.tr,
                style:
                    TextStyle(fontSize: 12.sp, color: HYAppTheme.norTextColors),
              ),
            )
          ],
        ),
        body: Container(
          color: HYAppTheme.norWhite01Color,
          padding: EdgeInsets.symmetric(vertical: 10.r, horizontal: 10.r),
          child: Column(
            children: [
              buildBaiduMapAppBarBottom(),
              Expanded(
                child: state.poiInfoList.isNotEmpty
                    ? ListView.builder(
                        padding: EdgeInsets.zero,
                        itemBuilder: (ctx, index) {
                          return buildLocationItem(index);
                        },
                        itemCount: state.poiInfoList.length,
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                        color: HYAppTheme.norMainThemeColors,
                      )),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget buildBaiduMapAppBarBottom() {
    return GestureDetector(
      onTap: () {
        Get.toNamed(SearchLocationScreen.routeName);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20).r,
        decoration: BoxDecoration(
            color: HYAppTheme.norGrayColor.withOpacity(.1),
            borderRadius: BorderRadius.all(Radius.circular(40.r))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 15.sp,
              height: 15.sp,
              child: Image.asset(ImageAssets.searchCustomPNG),
            ),
            8.horizontalSpace,
            Container(
              height: 15.sp,
              alignment: Alignment.center,
              child: Text(
                SR.searchNearbyLocation.tr,
                style:
                    TextStyle(color: HYAppTheme.norGrayColor, fontSize: 12.sp),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildLocationItem(index) {
    BMFPOIDetailInfo? detailInfo = state.poiInfoList[index].detailInfo;
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 5.r),
      title: Text(
        state.poiInfoList[index].name!,
        style: TextStyle(fontSize: 12.sp),
      ),
      subtitle: Text(
        "距离${detailInfo?.distance}米 · ${state.poiInfoList[index].address!}",
        style: TextStyle(fontSize: 12.sp),
      ),
    );
  }
}
