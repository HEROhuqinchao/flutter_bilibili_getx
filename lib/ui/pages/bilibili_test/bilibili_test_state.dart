import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class BilibiliTestState {
  Artboard? seaStarSwitchArtBoard;
  Artboard? liquidDownloadArtBoard;
  late StateMachineController? controller;
  late SMIInput<bool>? isPressed;
  late SMIInput<bool>? startDownload;
  late SMIInput<double>? downloadProgress;

  BilibiliTestState() {
  }
}
