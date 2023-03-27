import 'package:flutter/services.dart';

///隐藏顶部、底部手机状态栏
class SystemUIModeUtil {
  ///隐藏顶部和底部
  static hideAll() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  ///显示顶部和底部
  static showAll() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
  }
}
