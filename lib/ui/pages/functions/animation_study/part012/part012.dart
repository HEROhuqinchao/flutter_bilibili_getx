import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
      // home: GreenPage(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AnimDemo(),
        // child: CupertinoActivityIndicatorExample(),
        // child: AnimatedCrossFadeExample(),
        // child: AnimatedSwitcherExample(),
      ),
    );
  }
}

///AnimatedIcon
class AnimDemo extends StatefulWidget {
  const AnimDemo({Key? key}) : super(key: key);

  @override
  State<AnimDemo> createState() => _AnimDemoState();
}

class _AnimDemoState extends State<AnimDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addListener(() {
        print("监听");
      });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => animationController.forward(from: 0),
      child: AnimatedIcon(
        size: 50,
        icon: AnimatedIcons.arrow_menu,
        progress: animationController,
      ),
    );
  }
}

///CupertinoActivityIndicator
class CupertinoActivityIndicatorExample extends StatefulWidget {
  const CupertinoActivityIndicatorExample({Key? key}) : super(key: key);

  @override
  State<CupertinoActivityIndicatorExample> createState() =>
      _CupertinoActivityIndicatorExampleState();
}

class _CupertinoActivityIndicatorExampleState
    extends State<CupertinoActivityIndicatorExample>
    with SingleTickerProviderStateMixin {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Switch(
          value: switchValue,
          onChanged: (value) {
            setState(() {
              switchValue = !switchValue;
            });
          },
        ),
        CupertinoActivityIndicator(
          animating: switchValue,
          radius: 20,
        ),
      ],
    );
  }
}

///AnimatedCrossFade
class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({Key? key}) : super(key: key);

  @override
  State<AnimatedCrossFadeExample> createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample> {
  bool switchValue = true;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Switch(
          value: switchValue,
          onChanged: (value) {
            switchValue = !switchValue;
            setState(() {});
          },
        ),
        AnimatedCrossFade(
          firstCurve: Curves.easeInCirc,
          secondCurve: Curves.easeInToLinear,
          firstChild: buildFirstChild(),
          secondChild: buildSecondChild(),
          crossFadeState: switchValue
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          duration: Duration(seconds: 1),
        )
      ],
    );
  }

  Widget buildFirstChild() {
    return Container(
      height: 60,
      width: 60,
      color: Colors.grey.withAlpha(22),
      alignment: Alignment.center,
      child: FlutterLogo(
        size: 40,
      ),
    );
  }

  Widget buildSecondChild() {
    return Image.asset(
      ImageAssets.appLogoPNG,
      width: 100,
      height: 100,
    );
  }
}

///AnimatedSwitcher
class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({Key? key}) : super(key: key);

  @override
  State<AnimatedSwitcherExample> createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        buildBtn(Icons.remove, Colors.red, () {
          count--;
          setState(() {});
        }),
        SizedBox(
          width: 80,
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 2000),
            transitionBuilder: (child, animation) => ScaleTransition(
              scale: animation,
              child: child,
            ),
            child: Text(
              '$count',

              ///count状态变化，AnimatedSwitcher开启动画
              key: ValueKey<int>(count),
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        buildBtn(Icons.add, Colors.blue, () {
          count++;
          setState(() {});
        })
      ],
    );
  }

  Widget buildBtn(IconData icon, Color color, VoidCallback onPressed) =>
      MaterialButton(
        padding: EdgeInsets.zero,
        textColor: Color(0xffffffff),
        elevation: 3,
        onPressed: onPressed,
        highlightColor: Color(0xffF88B0A),
        splashColor: Colors.red,
        child: Icon(
          icon,
          color: Colors.white,
        ),
        shape: CircleBorder(
          side: BorderSide(
            width: 2,
            color: Color(0xFFFFDFDFDF),
          ),
        ),
      );
}

///路由动画
class GreenPage extends StatelessWidget {
  const GreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => go2Red(context),
            icon: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }

  go2Red(BuildContext context) {
    Navigator.of(context).push(
      // MaterialPageRoute(
      //   builder: (ctx) => RedPage(),
      // ),
      PageRouteBuilder(
        pageBuilder: (ctx, a1, a2) => RedPage(),
        transitionDuration: Duration(milliseconds: 300),
        reverseTransitionDuration: Duration(milliseconds: 300),
        transitionsBuilder: (ctx, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: FadeTransition(
              opacity: Tween<double>(
                begin: 0.5,
                end: 1.0,
              ).animate(animation),
              child: child,
            ),
          );
        },
      ),
    );
  }
}

class RedPage extends StatefulWidget {
  const RedPage({Key? key}) : super(key: key);

  @override
  State<RedPage> createState() => _RedPageState();
}

class _RedPageState extends State<RedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => go2Green(context),
            icon: Icon(Icons.navigate_before),
          )
        ],
      ),
    );
  }

  go2Green(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => GreenPage()));
  }
}
