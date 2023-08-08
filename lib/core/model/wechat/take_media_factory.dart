import 'package:flutter/material.dart';

import '../../channel/channel_util.dart';

///拍摄媒体（Android & Ios）
abstract class TakeMediaFactory {
  late String invokeMethod;

  ///构建拍摄媒体界面
  void setInvokeMethod();

  ///展示
  void show() {
    // ChannelUtil()
    //     .media
    //     ?.invokeMethod("takeMediaAndroid", "")
    //     .then((value) => print(value));
    print(ChannelUtil().media == ChannelUtil().media);
  }
}

///Android拍摄媒体
class AndroidTakeMedia extends TakeMediaFactory {
  @override
  void setInvokeMethod() {
    invokeMethod = "takeMediaAndroid";
  }
}

///ios拍摄媒体
class IosTakeMedia extends TakeMediaFactory {
  @override
  void setInvokeMethod() {
    invokeMethod = "takeMediaIos";
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AndroidTakeMedia().show();
        },
        child: const Icon(Icons.phone_iphone_outlined),
      ),
    );
  }
}
