import 'dart:async';

import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'canvas_paint_study_state.dart';

class CanvasPaintStudyLogic extends GetxController {
  final CanvasPaintStudyState state = CanvasPaintStudyState();

  @override
  void onReady() {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    loadImage();
    super.onReady();
  }

  void loadImage() async {
    state.img = await decodeImageFromList(
        (await rootBundle.load(ImageAssets.rightChatPng)).buffer.asUint8List());
    update();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
