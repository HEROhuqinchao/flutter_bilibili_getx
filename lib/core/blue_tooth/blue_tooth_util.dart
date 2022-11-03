import 'package:flutter_blue/flutter_blue.dart';

class BlueToothUtil {
  ///开始扫描
  static Future startScan() {
    return FlutterBlue.instance.startScan(timeout: Duration(seconds: 10), scanMode: ScanMode.lowPower);
  }

  ///已经连接的蓝牙设备
  static Stream<List<BluetoothDevice>> fetchConnectedDevicesStream(
      int seconds) {
    return Stream.periodic(Duration(seconds: seconds))
        .asyncMap((event) => FlutterBlue.instance.connectedDevices);
  }

  ///是否在扫描
  static Stream<bool> fetchIsScanningStream() {
    return FlutterBlue.instance.isScanning;
  }

  ///停止扫描
  static Future stopScan() {
    return FlutterBlue.instance.stopScan();
  }

  ///扫描蓝牙设备（未连接上的蓝牙设备）
  static Stream<List<ScanResult>> fetchScanResultStream() {
    return FlutterBlue.instance.scanResults;
  }

  ///获取当前蓝牙开关的状态
  static Stream<BluetoothState> fetBluetoothState() {
    return FlutterBlue.instance.state;
  }
}
