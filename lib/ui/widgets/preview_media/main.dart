import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/widgets/preview_media/widget/preview_media_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

final List<String> images = [];

void main() {
  for (int i = 0; i < 100; i++) {
    if (i % 2 == 0) {
      images.add(
          "https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg");
    } else {
      images.add(
          "https://fuss10.elemecdn.com/e/5d/4a731a90594a4af544c0c25941171jpeg.jpeg");
    }
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (ctx, child) {
        return MaterialApp(
          navigatorObservers: [FlutterSmartDialog.observer],
          builder: FlutterSmartDialog.init(),
          home: Scaffold(
            body: Center(
              child: GestureDetector(
                onTap: () {
                  SmartDialog.show(builder: (ctx) {
                    return PreviewMediaWidget(images);
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: HYAppTheme.norMainThemeColors,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
