import 'package:bilibili_getx/ui/pages/publish/pre_publish_video/pre_publish_video_view.dart';
import 'package:bilibili_getx/ui/pages/video_play/bilibili_video_player/bilibili_video_player_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/I18n/str_res_keys.dart';
import '../../../shared/app_theme.dart';
import 'bilibili_pre_edit_video_logic.dart';

class BilibiliPreEditVideoView extends StatefulWidget {
  static String routeName = "/edit_video";
  @override
  _BilibiliPreEditVideoViewState createState() => _BilibiliPreEditVideoViewState();
}

class _BilibiliPreEditVideoViewState extends State<BilibiliPreEditVideoView> {
  final logic = Get.put(BilibiliPreEditVideoLogic());
  final state = Get.find<BilibiliPreEditVideoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BilibiliVideoPlayerComponent(),
      ///压扁的floatingActionButton
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: HYAppTheme.norMainThemeColors,
        onPressed: () {
          Get.toNamed(PrePublishVideoView.routeName);
        },
        label: Text(
          SR.go2Publish.tr,
          style: TextStyle(
            fontSize: 14.sp,
            color: HYAppTheme.norWhite01Color,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}