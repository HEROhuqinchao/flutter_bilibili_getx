import 'dart:async';

import 'package:flutter_blue/flutter_blue.dart';

import '../../../../core/blue_tooth/blue_tooth_util.dart';

class BlueToothConnectionState {
  late Stream<bool> isScanning;
  late Stream<BluetoothState> blueToothState;
  late Stream<List<BluetoothDevice>> connectedDevices;
  late Stream<List<ScanResult>> scanResults;
  BlueToothConnectionState() {
    isScanning = BlueToothUtil.fetchIsScanningStream();
    blueToothState = BlueToothUtil.fetBluetoothState();
    connectedDevices = BlueToothUtil.fetchConnectedDevicesStream(3);
    scanResults = BlueToothUtil.fetchScanResultStream();
  }
}
