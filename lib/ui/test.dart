import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:bilibili_getx/ui/widgets/fade_image_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      home: TestExample(),
    );
  }
}

class TestExample extends StatefulWidget {
  const TestExample({Key? key}) : super(key: key);

  @override
  State<TestExample> createState() => _TestExampleState();
}

class _TestExampleState extends State<TestExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AsrManager.start().then((value) {
            print(value);
          });
        },
      ),
      body: Container(),
    );
  }
}


class AsrManager {
  static const MethodChannel _channel = MethodChannel('asr_plugin');

  ///开始录音
  static Future<String> start({Map? params}) async {
    return await _channel.invokeMethod('start', params ?? {});
  }

  ///停止录音
  static Future<String> stop() async {
    return await _channel.invokeMethod('stop');
  }

  ///取消录音
  static Future<String> cancel() async {
    return await _channel.invokeMethod('cancel');
  }
}
