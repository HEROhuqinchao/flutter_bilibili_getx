import 'dart:io';

import 'package:bilibili_getx/ui/pages/publish/ready2_publish/ready2_publish_view.dart';
import 'package:bilibili_getx/ui/pages/publish/upload/upload_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/I18n/str_res_keys.dart';
import '../../shared/app_theme.dart';

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
          bottomNavigationBar: TabBar(
            labelColor: HYAppTheme.norWhite01Color,
            tabs: [
              Tab(text: SR.createLiveRoom.tr),
              Tab(text: SR.photograph.tr),
              Tab(text: SR.upload.tr),
              Tab(text: SR.shareDynamic.tr),
              Tab(text: SR.templateAuthoring.tr),
            ],
            indicatorColor: HYAppTheme.norMainThemeColors,
            indicatorWeight: 4.h,
            indicatorSize: TabBarIndicatorSize.label,
            padding: const EdgeInsets.all(10).r,
            labelPadding: const EdgeInsets.symmetric(vertical: 5).r,
            labelStyle: TextStyle(
                color: HYAppTheme.norWhite01Color,
                fontWeight: FontWeight.normal,
                fontSize: 16.sp,fontFamily: 'bilibiliFonts',),
          ),
          body: buildPublishView(),

          ///压扁的floatingActionButton
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: HYAppTheme.norMainThemeColors,
            onPressed: () {
              Get.toNamed(Ready2PublishView.routeName);
            },
            label: Text(
              "去发布",
              style: TextStyle(
                fontSize: 14.sp,
                color: HYAppTheme.norWhite01Color,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
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
