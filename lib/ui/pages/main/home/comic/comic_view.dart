import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../shared/app_theme.dart';
import 'comic_logic.dart';

class ComicScreen extends StatelessWidget {
  static const String routeName = "/home/comic";

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ComicLogic>();
    final state = Get.find<ComicLogic>().state;

    return GetBuilder<ComicLogic>(builder: (logic) {
      return Scaffold(
        body: state.widgets.isNotEmpty
            ? Container(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10).r,
                child: EasyRefresh(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: state.widgets,
                  ),
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
              ),
      );
    });
  }
}
