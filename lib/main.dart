import 'dart:io';

import 'package:bilibili_getx/core/package_info/package_info_util.dart';
import 'package:bilibili_getx/core/router/router.dart';
import 'package:bilibili_getx/core/service/utils/constant.dart';
import 'package:bilibili_getx/core/work_manager/work_manager_util.dart';
import 'package:bilibili_getx/core/wx_util/wx_util.dart';
import 'package:bilibili_getx/ui/pages/functions/animation_compoent/animation_compoent_view.dart';
import 'package:bilibili_getx/ui/pages/functions/canvas_paint_study/canvas_paint_study_view.dart';
import 'package:bilibili_getx/ui/pages/functions/download_file/download_file_view.dart';
import 'package:bilibili_getx/ui/pages/main/home/comic/comic_view.dart';
import 'package:bilibili_getx/ui/pages/main/main_view.dart';
import 'package:bilibili_getx/ui/pages/video_play/video_play_view.dart';
import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
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

void main() async {
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  if (kIsWeb) {
    ///网页端目前403，无法运行
    ///屏幕适配初始化&持久化存储初始化（运行web端请运行cors目录下的cors.dart）
    ScreenUtil.ensureScreenSize();
    SharedPreferenceUtil.getInstance();
    PackageInfoUtil.getInstance();
    // initialization();
  } else {
    await ScreenUtil.ensureScreenSize();
    await SharedPreferenceUtil.getInstance();
    await PackageInfoUtil.getInstance();
    // await WorkManagerUtil.initialize();
    await initialization();
  }
  runApp(const MyApp());
}

///初始化
Future<void> initialization() async {
  if (!kIsWeb) {
    if (Platform.isAndroid) {
      ///极光推送
      // JPushUtil.startJPush();

      ///下载（flutter_downloader）
      WidgetsFlutterBinding.ensureInitialized();
      await FlutterDownloader.initialize(
        // optional: set to false to disable printing logs to console (default: true)
        debug: Constant.isDebug,
        // option: set to false to disable working with http links (default: false)
        ignoreSsl: true,
      );

      ///手机状态栏的背景颜色及状态栏文字颜色
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          ///状态栏字体颜色（黑色）
          // statusBarIconBrightness: Brightness.dark,

          ///状态栏背景色
          statusBarColor: Colors.transparent,
        ),
      );

      ///注册微信
      WxUtil.wxRegisterWxApi();

      ///监听微信回调结果
      WxUtil.wxDebugResult();


    } else if (Platform.isWindows) {
      initWindowsSize();
    } else if (Platform.isIOS) {}
  } else {}
}

///设置windows端窗口大小,设置最大窗口和最小窗口
Future<void> initWindowsSize() async {
  await DesktopWindow.setWindowSize(Size(1040, 1040));
  await DesktopWindow.setMinWindowSize(Size(1040, 1040));
  await DesktopWindow.setMaxWindowSize(Size(1040, 1040));
  // await DesktopWindow.setWindowSize(Size(540, 950));
  // await DesktopWindow.setMinWindowSize(Size(503, 900));
  // await DesktopWindow.setMaxWindowSize(Size(551, 1000));
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

        ///移除闪屏
        // FlutterNativeSplash.remove();
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
          // initialRoute: WxShareView.routeName,
          // initialRoute: DynamicCircleScreen.routeName,
          initialRoute: MainScreen.routeName,
          // initialRoute: MiniWindowView.routeName,
          // initialRoute: DownloadFileView.routeName,

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
