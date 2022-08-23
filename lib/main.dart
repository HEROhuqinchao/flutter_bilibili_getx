import 'dart:io';

import 'package:bilibili_getx/core/router/router.dart';
import 'package:bilibili_getx/ui/pages/main/main_view.dart';
import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'core/I18n/string_res.dart';
import 'core/shared_preferences/bilibili_shared_preference.dart';
import 'core/shared_preferences/shared_preference_util.dart';
import 'dart:ui' as ui;

Size defaultSize = const Size(360, 690);
Size androidScreenSize = const Size(360, 690);
Size windowsScreenSize = const Size(1080, 1920);
Size webScreenSize = const Size(360, 690);

void main() {
  if (!kIsWeb) {
    if (Platform.isAndroid) {
      WidgetsFlutterBinding.ensureInitialized();

      ///手机状态栏的背景颜色及状态栏文字颜色
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          ///状态栏字体颜色（黑色）
          statusBarIconBrightness: Brightness.dark,

          ///状态栏背景色
          statusBarColor: Colors.white,
        ),
      );
    } else if (Platform.isWindows) {
    } else if (Platform.isIOS) {}
  } else {
  }
  ///初始化
  initMain();
  runApp(const MyApp());
}

initMain() async{
  ///实例化sharedPreference
  await SharedPreferenceUtil.getInstance();
  ///初始化屏幕适配
  await ScreenUtil.ensureScreenSize();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: defaultSize,
      builder: (ctx, child) {
        ///保存本地语言
        String? locale =
            SharedPreferenceUtil.getString(BilibiliSharedPreference.locale);
        if (locale!.isEmpty) {
          SharedPreferenceUtil.setString(
              BilibiliSharedPreference.locale, ui.window.locale.languageCode);
        }
        return GetMaterialApp(
          ///去掉右上角的debug
          debugShowCheckedModeBanner: false,

          ///APP名称
          title: '哔哩哔哩',

          ///主题
          theme: HYAppTheme.norTheme,

          ///I18n国际化
          translations: StringRes(),
          locale: locale == "en"
              ? const Locale('en', 'US')
              : const Locale('zh', 'CN'),
          fallbackLocale: const Locale('zh', 'CN'),

          ///起始路由
          initialRoute: MainScreen.routeName,

          ///路由和绑定
          getPages: AsRouter.getPages,

          ///smartDialog 插件需要初始化
          navigatorObservers: [FlutterSmartDialog.observer],
          builder: FlutterSmartDialog.init(),
        );
      },
    );
  }
}
