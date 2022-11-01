import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';

class BlueToothConnectionState {
  late BluetoothState bluetoothState;
  late Stream<BluetoothState> bluetoothStateStream;
  late Stream<List<ScanResult>> scanResultStream;
  late List<BluetoothDevice> blueToothDevices;
  late List<ScanResult> scanResults;
  late Timer timerBlueToothDevices;

  BlueToothConnectionState() {
    bluetoothState = BluetoothState.unknown;
    bluetoothStateStream = FlutterBlue.instance.state;
    scanResultStream = FlutterBlue.instance.scanResults;
    blueToothDevices = [];
    scanResults = [];
  }
}
