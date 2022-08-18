import 'dart:io';

import 'package:bilibili_getx/core/router/router.dart';
import 'package:bilibili_getx/ui/pages/main/main_view.dart';
import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';

import 'core/I18n/string_res.dart';
import 'core/shared_preferences/bilibili_shared_preference.dart';
import 'core/shared_preferences/shared_preference_util.dart';
import 'dart:ui' as ui;

void main() async {
  ///初始化项目
  initBilibili();
  runApp(const MyApp());
}
void initBilibili() async{
  if (!kIsWeb) {
    if (Platform.isAndroid) {
      WidgetsFlutterBinding.ensureInitialized();

      ///实例化sharedPreference
      await SharedPreferenceUtil.getInstance();
    } else if(Platform.isWindows){
      ///实例化sharedPreference
      await SharedPreferenceUtil.getInstance();
    } else if(Platform.isIOS) {

    }
  } else {
    ///网页端
    ///实例化sharedPreference
    await SharedPreferenceUtil.getInstance();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(360, 690),
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
          locale: locale == "zh"
              ? const Locale('zh', 'CN')
              : const Locale('en', 'US'),
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
