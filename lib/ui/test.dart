import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:bilibili_getx/ui/widgets/fade_image_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stack"),
        ),
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                color: HYAppTheme.norGray04Color,
                child: DefaultFadeImage(
                  imageUrl:
                      "http://i0.hdslb.com/bfs/bangumi/image/2719084adaed21fd49d9fd9ecd2fc7b304a06b3a.png",
                  height: 200,
                ),
              ),
            ),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
