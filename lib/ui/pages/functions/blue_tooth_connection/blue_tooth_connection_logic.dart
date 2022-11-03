import 'package:bilibili_getx/core/permission/bilibili_permission.dart';
import 'package:bilibili_getx/ui/pages/functions/blue_tooth_connection/blue_tooth_device_operation/blue_tooth_device_operation_state.dart';
import 'package:bilibili_getx/ui/pages/functions/blue_tooth_connection/blue_tooth_device_operation/blue_tooth_device_operation_view.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:get/get.dart';
import '../../../../core/blue_tooth/blue_tooth_util.dart';
import 'blue_tooth_connection_state.dart';
import 'blue_tooth_device_operation/blue_tooth_device_operation_logic.dart';

class BlueToothConnectionLogic extends GetxController {
  final BlueToothConnectionState state = BlueToothConnectionState();

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future startScanBlueTooth() {
    BilibiliPermission.requestBlueToothPermissions();
    return BlueToothUtil.startScan();
  }

  Future stopScanBlueTooth() {
    return BlueToothUtil.stopScan();
  }

  void connectBlueToothDevice(ScanResult e) {
    e.device.connect(timeout: Duration(seconds: 10));
    startScanBlueTooth();
  }

  void goToBlueToothDeviceOperation(BluetoothDevice bluetoothDevice) {
    BlueToothDeviceOperationState deviceOperationState =
        Get.find<BlueToothDeviceOperationLogic>().state;
    deviceOperationState.bluetoothDevice = bluetoothDevice;
    Get.toNamed(BlueToothDeviceOperationView.routeName);
  }
}
