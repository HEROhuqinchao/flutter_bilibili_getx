import 'package:bilibili_getx/ui/pages/video_play/video_play_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'blue_tooth_connection_logic.dart';

class BlueToothConnectionView extends StatelessWidget {
  static const String routeName = "/blue_tooth_connection";
  final logic = Get.find<BlueToothConnectionLogic>();
  final state = Get
      .find<BlueToothConnectionLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlueToothConnectionLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          title: Text("蓝牙连接"),
        ),
        body: state.bluetoothState == BluetoothState.on
            ? SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("已经连接的蓝牙设备"),
              buildConnectedBlueToothDevicesBody(),
              10.verticalSpace,
              Text("周围的蓝牙设备"),
              buildFindScanResults(),
            ],
          ),
        )
            : buildBlueToothOffBody(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.bluetooth),
          onPressed: () {
            if (state.bluetoothState == BluetoothState.on) {
              logic.startScanBlueTooth();
            } else {
              SmartDialog.showToast("请先打开蓝牙开关");
            }
          },
        ),
      );
    });
  }

  Widget buildBlueToothOffBody() {
    return Center(
      child: Text("准备就绪中，点击按钮开始搜索..."),
    );
  }

  Widget buildConnectedBlueToothDevicesBody() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text("设备名称：${state.blueToothDevices[index].name}"),
          subtitle: Text("设备ID：${state.blueToothDevices[index].id.toString()}"),
          trailing: StreamBuilder(
            builder: (c, snapshot) {
              if (snapshot.data == BluetoothDeviceState.connected) {
                return ElevatedButton(
                  onPressed: () {},
                  child: Text("打开"),
                );
              }
              return Text(snapshot.data.toString());
            },
          ),
        );
      },
      itemCount: state.blueToothDevices.length,
    );
  }

  Widget buildFindScanResults() {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text(
              "设备名称：${state.scanResults[index].device.name.isEmpty
                  ? "未命名"
                  : state.scanResults[index].device.name}"),
          subtitle: Text(
              "MAC地址：${state.scanResults[index].device.id.id} - 设备类型：${state
                  .scanResults[index].device.type.name}"),
        );
      },
      itemCount: state.scanResults.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }
}
