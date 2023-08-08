import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

///手机垂直还是水平
class SystemPreferredOrientationsUtil {
  ///水平
  static void setHorizontal() {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    }
  }

  ///垂直
  static setVertical() {
    if (defaultTargetPlatform == TargetPlatform.android ||
        defaultTargetPlatform == TargetPlatform.iOS) {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    }
  }
}
