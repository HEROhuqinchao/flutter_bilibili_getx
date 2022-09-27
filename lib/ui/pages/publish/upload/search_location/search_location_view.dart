import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/I18n/str_res_keys.dart';
import 'search_location_logic.dart';

class SearchLocationScreen extends StatelessWidget {
  static String routeName = "/search_location";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<SearchLocationLogic>();
    final state = Get.find<SearchLocationLogic>().state;

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
                    Container(
                      width: 15.sp,
                      height: 15.sp,
                      child: Image.asset(ImageAssets.searchCustomPNG),
                    ),
                    8.horizontalSpace,
                    Expanded(
                      child: TextField(
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
            Container(
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
    );
  }
}
