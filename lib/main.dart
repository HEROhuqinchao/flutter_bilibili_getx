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
import 'package:provider/provider.dart';

import 'core/I18n/string_res.dart';
import 'core/notifier/player_notifier.dart';
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

      ///实例化sharedPreference
      SharedPreferenceUtil.getInstance();

      ///初始化屏幕适配
      ScreenUtil.ensureScreenSize();

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
      ///实例化sharedPreference
      SharedPreferenceUtil.getInstance();

      ///初始化屏幕适配
      ScreenUtil.ensureScreenSize();
    } else if (Platform.isIOS) {
      ///实例化sharedPreference
      SharedPreferenceUtil.getInstance();

      ///初始化屏幕适配
      ScreenUtil.ensureScreenSize();
    }
  } else {
    ///实例化sharedPreference
    SharedPreferenceUtil.getInstance();

    ///初始化屏幕适配
    ScreenUtil.ensureScreenSize();
  }
  runApp(
    ///视频播放界面有使用到Provider，在此处注册它
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => PlayerNotifier.init()),
      ],
      child: const MyApp(),
    ),
  );
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
