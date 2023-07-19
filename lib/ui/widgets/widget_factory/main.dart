import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:bilibili_getx/ui/widgets/widget_factory/widget_factory/android_widget_factory.dart';
import 'package:bilibili_getx/ui/widgets/widget_factory/widget_factory/ios_widget_factory.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'abstract_factory/widget_abstract_factory.dart';
import 'abstract_factory/widget_factory_singleton.dart';

main() {
  runApp(
    ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          home: MyApp(),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget with WidgetFactoryPlugin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              ImageAssets.appLogoPNG,
              width: 50.r,
              height: 50.r,
            ),
            200.verticalSpace,
            wFactory().buildButton(
              child: const Text("button"),
              onTap: () {
                wFactory().buildDialog(
                  context,
                  child: Container(
                    color: Colors.white,
                    alignment: Alignment.center,
                    width: 200.r,
                    height: 200.r,
                    child: const Text("Dialog"),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
