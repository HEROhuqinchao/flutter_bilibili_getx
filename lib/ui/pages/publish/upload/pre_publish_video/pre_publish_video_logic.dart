import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import '../../../../../core/I18n/str_res_keys.dart';
import '../../../../shared/app_theme.dart';
import '../../../../widgets/profile_edit_dialog.dart';
import '../../../../widgets/pop_route.dart';
import 'pre_publish_video_state.dart';

class PrePublishVideoLogic extends GetxController {
  final PrePublishVideoState state = PrePublishVideoState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void checkAgreePolicy(value) {
    state.agreePolicy = value!;
    update();
  }

  void checkTransshipment() {
    state.transshipment = true;
    state.selfMade = false;
    update();
  }

  void checkSelfMade() {
    state.selfMade = true;
    state.transshipment = false;
    update();
  }
}
