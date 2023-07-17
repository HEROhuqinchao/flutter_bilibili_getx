import 'package:bilibili_getx/ui/widgets/widget_factory/widget_factory/android_widget_factory.dart';
import 'package:bilibili_getx/ui/widgets/widget_factory/widget_factory/ios_widget_factory.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class MyApp extends StatelessWidget {
  final AndroidWidgetFactory androidWidgetFactory = AndroidWidgetFactory();
  final IosWidgetFactory iosWidgetFactory = IosWidgetFactory();

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      // return Scaffold(
      //   body: Center(
      //     child: androidWidgetFactory.buildButton(child: null),
      //   ),
      // );
      return Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: iosWidgetFactory.buildButton(),
        ),
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return Scaffold(
        body: Center(
          child: iosWidgetFactory.buildButton(),
        ),
      );
    } else {
      return Container();
    }
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: GestureDetector(
//           onTap: () {
//             Toast.show(context: context, message: "弹窗");
//           },
//           child: Container(
//             width: 100,
//             height: 100,
//             color: Colors.red,
//           ),
//         ),
//       ),
//     );
//   }
// }

// //通过 Overlay 实现 Toast
// class Toast {
//   static void show({
//     required BuildContext context,
//     required String message,
//   }) {
//     //1、创建 overlayEntry
//     OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
//       return Stack(
//         alignment: Alignment.center,
//         children: [
//           SizedBox(
//             width: 100,
//             height: 100,
//             child: Material(
//               child: Container(
//                 color: Colors.green,
//                 width: 100,
//                 height: 100,
//                 alignment: Alignment.center,
//                 child: Center(
//                   child: Card(
//                     color: Colors.grey.withOpacity(0.6),
//                     child: Padding(
//                       padding: EdgeInsets.all(8),
//                       child: Text(message),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           )
//         ],
//       );
//     });
//
//     //插入到 Overlay中显示 OverlayEntry
//     Overlay.of(context).insert(overlayEntry);
//
//     //延时两秒，移除 OverlayEntry
//     Future.delayed(Duration(seconds: 2)).then((value) {
//       overlayEntry.remove();
//     });
//   }
// }
