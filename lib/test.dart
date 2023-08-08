import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color color = const Color(0xffff4422);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ColorInheritedWidget(
        color: color,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const PoetryOneWidget(),
            const PoetryTwoWidget(),
            ElevatedButton(
              onPressed: () {
                color = Colors.green;
                setState(() {});
              },
              child: const Text("更改颜色"),
            )
          ],
        ),
      ),
    );
  }
}

class ColorInheritedWidget extends InheritedWidget {
  final Color color;

  const ColorInheritedWidget({
    super.key,
    required this.color,
    required super.child,
  });

  static ColorInheritedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ColorInheritedWidget>();
  }

  @override
  bool updateShouldNotify(covariant ColorInheritedWidget oldWidget) {
    return color != oldWidget.color;
  }
}

class PoetryOneWidget extends StatefulWidget {
  const PoetryOneWidget({super.key});

  @override
  State<PoetryOneWidget> createState() => _PoetryOneWidgetState();
}

class _PoetryOneWidgetState extends State<PoetryOneWidget> {
  @override
  void didChangeDependencies() {
    print("didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: Text(
        "文字一",
        style: TextStyle(
          fontSize: 24,
          color: ColorInheritedWidget.of(context)!.color,
        ),
      ),
    );
  }
}

class PoetryTwoWidget extends StatelessWidget {
  const PoetryTwoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: Text(
        "文字二",
        style: TextStyle(
          fontSize: 24,
          // color: ColorInheritedWidget.of(context)!.color,
        ),
      ),
    );
  }
}
