import 'package:flutter/services.dart';

///隐藏顶部、底部手机状态栏
class SystemUIModeUtil {
  static hideAll() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  static showAll() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
  }
}
