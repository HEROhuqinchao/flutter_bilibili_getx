import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import '../../../shared/rive_asset.dart';
import 'animation_compoent_state.dart';

class AnimationCompoentLogic extends GetxController {
  final AnimationCompoentState state = AnimationCompoentState();

  @override
  void onReady() {
    ///海星Switch
    rootBundle.load(RiveAssets.seaStarSwitch).then((value) {
      state.seaStarSwitchArtBoard = RiveFile.import(value).mainArtboard;
      var controller = StateMachineController.fromArtboard(
          state.seaStarSwitchArtBoard!, 'State Machine 1');
      state.seaStarSwitchArtBoard!.addController(controller!);
      state.isPressed = controller.findInput('isPressed');
      update();
    });

    ///液体下载
    rootBundle.load(RiveAssets.liquidDownload).then((value) {
      state.liquidDownloadArtBoard = RiveFile.import(value).mainArtboard;
      var controller = StateMachineController.fromArtboard(
          state.liquidDownloadArtBoard!, 'Download');
      state.liquidDownloadArtBoard!.addController(controller!);
      state.startDownload = controller.findInput('Download');
      state.downloadProgress = controller.findInput('Progress');
      update();
    });
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ///开启按钮
  void togglePlay() {
    state.isPressed!.value = !state.isPressed!.value;
    update();
  }

  ///开始下载
  void startDownloadFile() {
    state.startDownload!.value = true;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      state.downloadProgress!.value += 2;
      if (state.downloadProgress!.value == 100) {
        timer.cancel();
      }
    });
    update();
  }
}
