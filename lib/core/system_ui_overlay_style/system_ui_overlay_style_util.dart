import 'package:flutter/services.dart';

import '../../ui/shared/app_theme.dart';

///沉浸式体验（设置状态栏颜色和字体颜色）
class SystemUiOverlayStyleUtil {
  static setMainThemeSystemUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: HYAppTheme.norMainThemeColors,
      ),
    );
  }
  static setWhiteSystemUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: HYAppTheme.norWhite01Color,
      ),
    );
  }
}