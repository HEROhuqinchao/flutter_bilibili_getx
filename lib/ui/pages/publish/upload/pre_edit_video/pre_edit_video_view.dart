import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/I18n/str_res_keys.dart';
import '../../../../shared/app_theme.dart';
import '../../../../widgets/custom_floating_action_button_location.dart';
import '../../../video_play/bilibili_video_player/bilibili_video_player_view.dart';
import '../pre_publish_video/pre_publish_video_view.dart';
import 'pre_edit_video_logic.dart';

class PreEditVideoView extends StatelessWidget {
  static String routeName = "/pre_edit_video";
  @override
  Widget build(BuildContext context) {
    final logic = Get.find<PreEditVideoLogic>();
    final state = Get.find<PreEditVideoLogic>().state;

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
      floatingActionButtonLocation: CustomFloatingActionButtonLocation(
          FloatingActionButtonLocation.endFloat, -5, -80),
    );
  }
}