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
    state.img = await _loadImage(AssetImage(ImageAssets.appLogoPNG));
    update();
  }

  Future<ui.Image> _loadImage(ImageProvider provider) {
    Completer<ui.Image> completer = Completer<ui.Image>();
    ImageStream stream = provider.resolve(ImageConfiguration());
    state.listener = ImageStreamListener((info, synchronousCall) {
      final ui.Image image = info.image;
      completer.complete(image);
      stream.removeListener(state.listener);
    });
    stream.addListener(state.listener);
    return completer.future;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
