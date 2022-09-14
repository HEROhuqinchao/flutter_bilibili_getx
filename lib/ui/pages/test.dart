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

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double volume         = 0.0;
  double brightness     = 0.0;
  bool   keepOn         = false;
  double freeDiskSpace  = 0;
  double totalDiskSpace = 0;

  @override
  void initState() {
    super.initState();
    this.init();
  }

  void init() async{

    this.brightness     = (await BVUtils.brightness).clamp(0.0, 1.0);
    this.volume         = (await BVUtils.volume).clamp(0.0, 1.0);
    this.keepOn         = await BVUtils.isKeptOn;
    this.freeDiskSpace  = await BVUtils.freeDiskSpace;
    this.totalDiskSpace = await BVUtils.totalDiskSpace;
    print("brightness::$brightness volume:$volume isKeptOn:$keepOn");
    this.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Column(children: [
            SizedBox(height: 100),
            Text("volume $volume"),
            Slider(value: volume, onChanged: (e){
              this.setState(() {
                this.volume = e;
                BVUtils.setVolume(e);
              });
            }),
            SizedBox(height: 50),
            Text("brightness $brightness"),
            Slider(value: brightness, onChanged: (e){
              this.setState(() {
                this.brightness = e;
                BVUtils.setBrightness(e);
              });
            }),
            SizedBox(height: 50),
            MaterialButton(
              child: Text('Reset brightness'),
              onPressed: () {
                BVUtils.resetCustomBrightness();
              },
            ),
            SizedBox(height: 50),
            Text("keep $keepOn"),
            CupertinoSwitch(value: this.keepOn, onChanged: (e){
              this.setState(() {
                this.keepOn = e;
                BVUtils.keepOn(e);
              });
            }),
            SizedBox(height: 50),
            Text("disk space $freeDiskSpace/$totalDiskSpace"),
          ])
      ),
    );
  }
}
