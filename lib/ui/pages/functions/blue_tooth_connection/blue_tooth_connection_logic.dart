import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';

import '../../../../core/permission/bilibili_permission.dart';
import 'blue_tooth_connection_state.dart';

class BlueToothConnectionLogic extends GetxController {
  final BlueToothConnectionState state = BlueToothConnectionState();

  @override
  void onReady() {
    state.bluetoothStateStream.listen((event) {
      state.bluetoothState = event;
      update();
    });
    super.onReady();
  }

  @override
  void onClose() {
    state.timerBlueToothDevices.cancel();
    super.onClose();
  }

  ///开始扫描蓝牙
  Future<void> startScanBlueTooth() async {
    BilibiliPermission.requestBlueToothPermissions();
    state.scanResultStream.listen((event) {
      state.scanResults = event;
      update();
    });
    FlutterBlue.instance.startScan(timeout: Duration(seconds: 3));
    state.timerBlueToothDevices = Timer.periodic(Duration(seconds: 2), (timer) {
      FlutterBlue.instance.connectedDevices.then((value) {
        state.blueToothDevices = value;
        update();
      });
    });
  }
}
