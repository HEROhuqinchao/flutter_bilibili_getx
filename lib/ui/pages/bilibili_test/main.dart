import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/permission/bilibili_permission.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _openResult = 'Unknown';

  Future<void> openFile() async {
    // const filePath = '/storage/emulated/0/click.png';
    const filePath = '/storage/emulated/0/Android/data/com.example.bilibili_getx/files/video_downloads/video01';
    File file = File(filePath);
    var fileIsExist = await file.exists();
    print(fileIsExist);
    final result = await OpenFile.open(filePath);
    setState(() {
      _openResult = "type=${result.type}  message=${result.message}";
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Future requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          requestPermission();
        }),
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('open result: $_openResult\n'),
              TextButton(
                child: Text('Tap to open file'),
                onPressed: openFile,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
