import 'package:bilibili_getx/core/router.dart';
import 'package:bilibili_getx/ui/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: MainScreen.routeName,
      getPages: AsRouter.getPages,
    );
  }
}
