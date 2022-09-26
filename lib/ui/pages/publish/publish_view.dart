import 'dart:io';

import 'package:bilibili_getx/ui/pages/publish/upload/upload_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/I18n/str_res_keys.dart';
import '../../shared/app_theme.dart';
import '../../widgets/round_underline_tab_indicator.dart';

class PublishView extends StatelessWidget {
  static const String routeName = "/publish";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 2,
        length: 5,
        child: Scaffold(
          backgroundColor: HYAppTheme.norTextColors,
          bottomNavigationBar: Container(
            height: 50.w,
            child: TabBar(
              labelColor: HYAppTheme.norWhite01Color,
              tabs: [
                Tab(text: SR.createLiveRoom.tr),
                Tab(text: SR.photograph.tr),
                Tab(text: SR.upload.tr),
                Tab(text: SR.shareDynamic.tr),
                Tab(text: SR.templateAuthoring.tr),
              ],
              indicator: BilibiliRoundUnderlineTabIndicator(
                insets: EdgeInsets.symmetric(horizontal: 3.r),
                  borderSide: BorderSide(
                      width: 5.sp, color: HYAppTheme.norMainThemeColors)),
              indicatorSize: TabBarIndicatorSize.label,
              padding: EdgeInsets.only(bottom: 15.r),
              labelPadding: EdgeInsets.symmetric(vertical: 2.r),
              labelStyle: TextStyle(
                color: HYAppTheme.norWhite01Color,
                fontWeight: FontWeight.normal,
                fontSize: 14.sp,
                fontFamily: 'bilibiliFonts',
              ),
            ),
          ),
          body: buildPublishView(),
        ),
      ),
    );
  }

  Widget buildPublishView() {
    if (kIsWeb) {
      ///web端
      return Container();
    } else {
      if (Platform.isAndroid) {
        return TabBarView(
          children: [
            Container(),
            Container(),
            UploadView(),
            Container(),
            Container(),
          ],
        );
      } else {
        return Container();
      }
    }
  }

  Widget buildLoadingView() {
    return Center(
      child: (SizedBox(
        width: 30.w,
        height: 30.w,
        child: const CircularProgressIndicator(
          color: HYAppTheme.norMainThemeColors,
        ),
      )),
    );
  }
}
