import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pre_publish_video_logic.dart';

class PrePublishVideoView extends StatelessWidget {
  static String routeName = "/pre_publish_video";
  final logic = Get.find<PrePublishVideoLogic>();
  final state = Get.find<PrePublishVideoLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
