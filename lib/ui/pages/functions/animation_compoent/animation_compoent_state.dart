import 'package:rive/rive.dart';

class AnimationCompoentState {
  Artboard? seaStarSwitchArtBoard;
  Artboard? liquidDownloadArtBoard;
  late StateMachineController? controller;
  late SMIInput<bool>? isPressed;
  late SMIInput<bool>? startDownload;
  late SMIInput<double>? downloadProgress;
  AnimationCompoentState() {
    ///Initialize variables
  }
}
