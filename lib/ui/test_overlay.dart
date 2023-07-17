import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(home: MyApp(),),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Toast.show(context: context, message: "弹窗");
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

//通过 Overlay 实现 Toast
class Toast {
  static void show({
    required BuildContext context,
    required String message,
  }) {
    //1、创建 overlayEntry
    OverlayEntry overlayEntry = OverlayEntry(builder: (context) {
      return Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Material(
              child: Container(
                color: Colors.green,
                width: 100,
                height: 100,
                alignment: Alignment.center,
                child: Center(
                  child: Card(
                    color: Colors.grey.withOpacity(0.6),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(message),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    });

    //插入到 Overlay中显示 OverlayEntry
    Overlay.of(context).insert(overlayEntry);

    //延时两秒，移除 OverlayEntry
    Future.delayed(Duration(seconds: 2)).then((value) {
      overlayEntry.remove();
    });
  }
}
