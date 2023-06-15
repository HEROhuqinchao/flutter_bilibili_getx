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
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stack"),
        ),
        body: BasicMessageExample(),
      ),
    );
  }
}

class BasicMessageExample extends StatefulWidget {
  const BasicMessageExample({Key? key}) : super(key: key);

  @override
  State<BasicMessageExample> createState() => _BasicMessageExampleState();
}

class _BasicMessageExampleState extends State<BasicMessageExample> {
  static const _channel =
      BasicMessageChannel('basic_message_001', JSONMessageCodec());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final String reply = await _channel.send('Hello World') as String;
          print(reply);
        },
      ),
    );
  }
}
