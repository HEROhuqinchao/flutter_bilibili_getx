import 'package:bilibili_getx/core/blue_tooth/blue_tooth_util.dart';
import 'package:bilibili_getx/ui/pages/functions/blue_tooth_connection/blue_tooth_device_operation/blue_tooth_device_operation_logic.dart';
import 'package:bilibili_getx/ui/pages/functions/blue_tooth_connection/blue_tooth_device_operation/blue_tooth_device_operation_state.dart';
import 'package:bilibili_getx/ui/pages/functions/blue_tooth_connection/blue_tooth_device_operation/blue_tooth_device_operation_view.dart';
import 'package:bilibili_getx/ui/pages/video_play/video_play_view.dart';
import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'blue_tooth_connection_logic.dart';

///整体采用StreamBuilder来构建，代码更简洁
class BlueToothConnectionView extends StatelessWidget {
  static const String routeName = "/blue_tooth_connection";
  final logic = Get.find<BlueToothConnectionLogic>();
  final state = Get.find<BlueToothConnectionLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlueToothConnectionLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          title: Text("蓝牙连接"),
        ),
        body: StreamBuilder<BluetoothState>(
          builder: (c, s) {
            return s.data == BluetoothState.on
                ? buildFindDevicesScreen()
                : buildBluetoothOffScreen();
          },
          stream: state.blueToothState,
          initialData: BluetoothState.unknown,
        ),
        floatingActionButton: StreamBuilder<bool>(
          initialData: false,
          stream: state.isScanning,
          builder: (c, snapshot) {
            return snapshot.data!
                ? FloatingActionButton(
                    backgroundColor: HYAppTheme.norWhite01Color,
                    onPressed: () {
                      logic.stopScanBlueTooth();
                    },
                    child: Icon(
                      Icons.stop,
                      color: Colors.red,
                    ),
                  )
                : FloatingActionButton(
                    onPressed: () {
                      logic.startScanBlueTooth();
                    },
                    child: Icon(Icons.search),
                  );
          },
        ),
      );
    });
  }

  Widget buildFindDevicesScreen() {
    return RefreshIndicator(
      child: SingleChildScrollView(
        child: Column(
          children: [
            20.verticalSpace,
            Text(
              "已连接的蓝牙设备",
              style: TextStyle(
                color: HYAppTheme.norBlue01Colors,
                fontSize: 20.sp,
              ),
            ),
            10.verticalSpace,
            StreamBuilder<List<BluetoothDevice>>(
              initialData: const [],
              stream: state.connectedDevices,
              builder: (c, s) {
                return Column(
                  children: s.data!
                      .map((e) => buildConnectedBlueToothDevice(e))
                      .toList(),
                );
              },
            ),
            20.verticalSpace,
            Text(
              "扫描到的蓝牙设备",
              style: TextStyle(
                color: HYAppTheme.norTextColors,
                fontSize: 20.sp,
              ),
            ),
            10.verticalSpace,
            StreamBuilder<List<ScanResult>>(
              builder: (c, s) {
                return Column(
                  children: s.data!
                      // .where((element) => element.device.name.isNotEmpty)
                      .map((e) => buildScanResult(e))
                      .toList(),
                );
              },
              stream: state.scanResults,
              initialData: const [],
            )
          ],
        ),
      ),
      onRefresh: () {
        return logic.startScanBlueTooth();
      },
    );
  }

  Widget buildConnectedBlueToothDevice(BluetoothDevice bluetoothDevice) {
    return ListTile(
      title: Text("名称 - ${bluetoothDevice.name}"),
      subtitle: Text("Mac地址 - ${bluetoothDevice.id.id}"),
      trailing: buildConnectedDeviceTrailing(bluetoothDevice),
    );
  }

  Widget buildScanResult(ScanResult e) {
    return ExpansionTile(
      title: Text("${e.device.name.isEmpty ? e.device.id : e.device.name}"),
      subtitle: e.device.name.isEmpty ? null : Text("${e.device.id}"),
      leading: Text(e.rssi.toString()),
      childrenPadding: EdgeInsets.only(left: 15.r, right: 10.r, bottom: 10.r),
      trailing: e.advertisementData.connectable
          ? ElevatedButton(
              child: Text('连接蓝牙'),
              onPressed: () {
                logic.connectBlueToothDevice(e);
              },
            )
          : const ElevatedButton(
              onPressed: null,
              child: Text("不可连接"),
            ),
      children: [
        buildAdvertisementDataDetail(
            '广播本地名称(Complete Local Name)：', e.advertisementData.localName),
        buildAdvertisementDataDetail('发射功率级别(Tx Power Level)：',
            '${e.advertisementData.txPowerLevel ?? 'N/A'}'),
        buildAdvertisementDataDetail('制造商数据(Manufacturer Data)：',
            getNiceManufacturerData(e.advertisementData.manufacturerData)),
        buildAdvertisementDataDetail(
            '服务唯一识别码(Service UUIDs)：',
            (e.advertisementData.serviceUuids.isNotEmpty)
                ? e.advertisementData.serviceUuids.join(', ').toUpperCase()
                : 'N/A'),
        buildAdvertisementDataDetail('服务数据(Service Data)：',
            getNiceServiceData(e.advertisementData.serviceData)),
      ],
    );
  }

  Widget buildConnectedDeviceTrailing(BluetoothDevice bluetoothDevice) {
    return StreamBuilder(
      builder: (c, s) {
        return s.data == BluetoothDeviceState.connected
            ? ElevatedButton(
                onPressed: () {
                  logic.goToBlueToothDeviceOperation(bluetoothDevice);
                },
                child: Text("查看"),
              )
            : Text(
                s.data.toString(),
              );
      },
      stream: bluetoothDevice.state,
      initialData: BluetoothDeviceState.disconnected,
    );
  }

  Widget buildBluetoothOffScreen() {
    return const Center(
      child: Text("蓝牙开关未开启，请先打开蓝牙开关"),
    );
  }

  Widget buildAdvertisementDataDetail(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Expanded(
          child: Text(
            value.isNotEmpty ? value : "N/A",
            softWrap: true,
          ),
        )
      ],
    );
  }

  String getNiceHexArray(List<int> bytes) {
    return '[${bytes.map((i) => i.toRadixString(16).padLeft(2, '0')).join(', ')}]'
        .toUpperCase();
  }

  String getNiceManufacturerData(Map<int, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add(
          '${id.toRadixString(16).toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }

  String getNiceServiceData(Map<String, List<int>> data) {
    if (data.isEmpty) {
      return 'N/A';
    }
    List<String> res = [];
    data.forEach((id, bytes) {
      res.add('${id.toUpperCase()}: ${getNiceHexArray(bytes)}');
    });
    return res.join(', ');
  }
}
