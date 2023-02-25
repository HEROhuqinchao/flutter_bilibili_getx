import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/services.dart';


///沉浸式体验（设置状态栏颜色和字体颜色）
class SystemUiOverlayStyleUtil {
  ///主题色状态栏
  static setMainThemeSystemUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: HYAppTheme.norMainThemeColors,
      ),
    );
  }
  ///白色主题
  static setWhiteSystemUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: HYAppTheme.norWhite01Color,
      ),
    );
  }
  ///黑色主题
  static setBlackSystemUiOverlayStyle() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: HYAppTheme.norBlackColors,
      ),
    );
  }
}