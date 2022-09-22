import 'package:bilibili_getx/ui/pages/video_play/bilibili_video_player/bilibili_video_player_view.dart';
import 'package:bilibili_getx/ui/widgets/primary_scroll_container.dart';
import 'package:flutter/material.dart';

// GlobalKey<PrimaryScrollContainerState> key1 =
//     GlobalKey<PrimaryScrollContainerState>();
// GlobalKey<PrimaryScrollContainerState> key2 =
//     GlobalKey<PrimaryScrollContainerState>();

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:brightness_volume/brightness_volume.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 300,
                  width: 500,
                  color: Colors.blue,
                ),
                Expanded(
                  child: Container(
                    width: 500,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 250,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(40),color: Colors.green,),
                width: 500,
                height: 300,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Container(
                      width: 500,
                      height: 30,
                      color: Colors.yellow,
                    );
                  },
                  itemCount: 50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
