import 'package:flutter/services.dart';

///隐藏顶部、底部手机状态栏
class SystemUIModeUtil {
  SystemUIModeUtil._internal();

  static final SystemUIModeUtil _instance = SystemUIModeUtil._internal();

  factory SystemUIModeUtil() => _instance;

  ///隐藏顶部和底部
  void hideAll() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  ///显示顶部和底部
  void showAll() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);
  }
}
