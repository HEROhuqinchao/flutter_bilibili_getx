import 'package:flare_flutter/flare.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flare_flutter/flare_cache_builder.dart';
import 'package:flare_flutter/flare_controller.dart';
import 'package:flare_flutter/provider/asset_flare.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'bilibili_test_logic.dart';

///只用于测试的界面!!!!
///到main.dart切换初始路由
class BilibiliTestScreen extends StatelessWidget {
  final logic = Get.find<BilibiliTestLogic>();
  final state = Get.find<BilibiliTestLogic>().state;
  static String routeName = "/test";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BilibiliTestLogic>(builder: (logic) {
      return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: MyHomePage(title: '',),
            // child: GestureDetector(
            //   onTap: () {
            //     logic.exchangeIsFav();
            //   },
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min,
            //     children: [
            //       Container(
            //         width: 30.w,
            //         height: 30.w,
            //         child: FlareActor("assets/flare/Favorite.flr",
            //             shouldClip: false,
            //             // Play the animation depending on the state.
            //             animation: state.isFav
            //                 ? "Favorite"
            //                 : "Unfavorite" //_animationName
            //             ),
            //       ),
            //       Text(
            //         "Like",
            //         style: TextStyle(
            //             fontSize: 11,
            //             fontFamily: "Montserrat",
            //             color: Colors.black45),
            //       ),
            //     ],
            //   ),
            // ), // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: state.option
            //       .asMap()
            //       .map(
            //         (key, value) => MapEntry(
            //           key,
            //           SmileySwitch(
            //               isOn: value,
            //               onToggle: () {
            //                 logic.exchangeSmileySwitch(key, value);
            //               },
            //               snapToEnd: state.snapToEnd),
            //         ),
            //       )
            //       .values
            //       .toList()
            //       .cast<Widget>(),
            // ),
            ),
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _useAA = true;
  final String _animationName = 'idle';
  final asset = AssetFlare(bundle: rootBundle, name: 'assets/flare/filip.flr');

  /// Toggle antialiasing on [FlareActor]
  void _toggleAntialiasing() {
    setState(() {
      _useAA = !_useAA;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: FlareCacheBuilder(
                [asset],
                builder: (BuildContext context, bool isWarm) {
                  return !isWarm
                      ? Container(child: Text('NO'))
                      : FlareActor.asset(
                    asset,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: _animationName,
                    antialias: _useAA,
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _toggleAntialiasing,
          child: Icon(
              _useAA ? Icons.center_focus_strong : Icons.center_focus_weak)),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> with FlareController {
//   double _rockAmount = 0.5;
//   double _speed = 1.0;
//   double _rockTime = 0.0;
//   bool _isPaused = false;
//
//   late ActorAnimation _rock;
//
//   @override
//   void initialize(FlutterActorArtboard artboard) {
//     _rock = artboard.getAnimation("music_walk")!;
//   }
//
//   @override
//   void setViewTransform(Mat2D viewTransform) {}
//
//   @override
//   bool advance(FlutterActorArtboard artboard, double elapsed) {
//     _rockTime += elapsed * _speed;
//     _rock.apply(_rockTime % _rock.duration, artboard, _rockAmount);
//     return true;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(title: Text(widget.title)),
//       body: Stack(
//         children: [
//           Positioned.fill(
//               child: FlareActor("assets/flare/penguin.flr",
//                   alignment: Alignment.center,
//                   isPaused: _isPaused,
//                   fit: BoxFit.cover,
//                   animation: "walk",
//                   controller: this)),
//           Positioned.fill(
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                 Container(
//                     height: 200,
//                     color: Colors.black.withOpacity(0.5),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         const Text("Mix Amount",
//                             style: TextStyle(color: Colors.white)),
//                         Slider(
//                           value: _rockAmount,
//                           min: 0.0,
//                           max: 1.0,
//                           divisions: null,
//                           onChanged: (double value) {
//                             setState(() {
//                               _rockAmount = value;
//                             });
//                           },
//                         ),
//                         const Text("Speed", style: TextStyle(color: Colors.white)),
//                         Slider(
//                           value: _speed,
//                           min: 0.2,
//                           max: 3.0,
//                           divisions: null,
//                           onChanged: (double value) {
//                             setState(() {
//                               _speed = value;
//                             });
//                           },
//                         ),
//                         const Text("Paused", style: TextStyle(color: Colors.white)),
//                         Checkbox(
//                           value: _isPaused,
//                           onChanged: (bool? value) {
//                             setState(() {
//                               _isPaused = value!;
//                             });
//                           },
//                         )
//                       ],
//                     )),
//               ]))
//         ],
//       ),
//     );
//   }
// }

class SmileySwitch extends StatelessWidget {
  final bool isOn;
  final VoidCallback onToggle;
  final bool snapToEnd;

  const SmileySwitch({
    required this.isOn,
    required this.onToggle,
    required this.snapToEnd,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: SizedBox(
        width: 100.w,
        height: 100.w,
        child: FlareActor(
          "assets/flare/smiley_switch.flr",
          snapToEnd: snapToEnd,
          animation: isOn ? "On" : "Off",
        ),
      ),
    );
  }
}
