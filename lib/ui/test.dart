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
        body: LiveCycleWidget(),
      ),
    );
  }
}

class LiveCycleWidget extends StatefulWidget {
  const LiveCycleWidget({Key? key}) : super(key: key);

  @override
  State<LiveCycleWidget> createState() {
    print("createState");
    return _LiveCycleWidgetState();
  }
}

class _LiveCycleWidgetState extends State<LiveCycleWidget> {
  _LiveCycleWidgetState() {
    print("构造函数");
  }

  List<Widget> children = [];

  @override
  void initState() {
    print("initState()");
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LiveCycleWidget oldWidget) {
    print("didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            children.add(Container(
              child: Text("data"),
            ));
            setState(() {});
          },
          child: Text("点击"),
        ),
        ...children,
      ],
    );
  }
}

// class BasicMessageExample extends StatefulWidget {
//   const BasicMessageExample({Key? key}) : super(key: key);
//
//   @override
//   State<BasicMessageExample> createState() => _BasicMessageExampleState();
// }
//
// class _BasicMessageExampleState extends State<BasicMessageExample> {
//   static const _channel =
//       BasicMessageChannel('basic_message_001', JSONMessageCodec());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final String reply = await _channel.send('Hello World') as String;
//           print(reply);
//         },
//       ),
//     );
//   }
// }
