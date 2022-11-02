import 'dart:math';

import 'package:bilibili_getx/ui/pages/video_play/video_play_view.dart';
import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'blue_tooth_device_operation_logic.dart';

class BlueToothDeviceOperationView extends StatelessWidget {
  static String routeName = "/blue_tooth_device_operation";
  final logic = Get.find<BlueToothDeviceOperationLogic>();
  final state = Get.find<BlueToothDeviceOperationLogic>().state;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BlueToothDeviceOperationLogic>(builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          title: Text("蓝牙设备操作"),
        ),
        body: state.bluetoothDevice != null
            ? buildBlueToothDeviceOperationBody()
            : Center(
                child: Text("正在获取蓝牙设备..."),
              ),
      );
    });
  }

  Widget buildBlueToothDeviceOperationBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          20.verticalSpace,
          Text(
            "蓝牙设备名称：${state.bluetoothDevice!.name}",
            style: TextStyle(fontSize: 17.sp),
          ),
          8.verticalSpace,
          Text(
            "蓝牙Mac地址：${state.bluetoothDevice!.id.id}",
            style: TextStyle(fontSize: 17.sp),
          ),
          8.verticalSpace,
          Text(
            "蓝牙设备类型：${state.bluetoothDevice!.type.name}",
            style: TextStyle(fontSize: 17.sp),
          ),
          8.verticalSpace,
          StreamBuilder<BluetoothDeviceState>(
            stream: state.bluetoothDevice!.state,
            initialData: BluetoothDeviceState.connecting,
            builder: (c, snapshot) => ListTile(
              leading: (snapshot.data == BluetoothDeviceState.connected)
                  ? Icon(Icons.bluetooth_connected)
                  : Icon(Icons.bluetooth_disabled),
              title:
                  Text('Device is ${snapshot.data.toString().split('.')[1]}.'),
              subtitle: Text('${state.bluetoothDevice!.id}'),
              trailing: StreamBuilder<bool>(
                stream: state.bluetoothDevice!.isDiscoveringServices,
                initialData: false,
                builder: (c, snapshot) => IndexedStack(
                  index: snapshot.data! ? 1 : 0,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () =>
                          state.bluetoothDevice!.discoverServices(),
                    ),
                    const IconButton(
                      icon: SizedBox(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.grey),
                        ),
                        width: 18.0,
                        height: 18.0,
                      ),
                      onPressed: null,
                    )
                  ],
                ),
              ),
            ),
          ),
          StreamBuilder<int>(
            initialData: 0,
            stream: state.bluetoothDevice!.mtu,
            builder: (c, s) => ListTile(
              title: const Text('数据传输包(MTU Size)：'),
              subtitle: Text("${s.data} 字节(bytes)"),
              trailing: IconButton(
                onPressed: () => state.bluetoothDevice!.requestMtu(223),
                icon: const Icon(Icons.edit),
              ),
            ),
          ),
          StreamBuilder<List<BluetoothService>>(
            stream: state.bluetoothDevice!.services,
            builder: (c, s) {
              return Column(
                children: buildServiceTiles(s.data!),
              );
            },
            initialData: const [],
          )
        ],
      ),
    );
  }

  List<int> _getRandomBytes() {
    final math = Random();
    return [
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255)
    ];
  }

  List<Widget> buildServiceTiles(List<BluetoothService> services) {
    return services
        .map((service) => ServiceTile(
              service: service,
              characteristicTiles: service.characteristics
                  .map((c) => CharacteristicTile(
                        characteristic: c,
                        onReadPressed: () => c.read(),
                        onWritePressed: () async {
                          await c.write(_getRandomBytes(),
                              withoutResponse: true);
                          await c.read();
                        },
                        onNotificationPressed: () async {
                          await c.setNotifyValue(!c.isNotifying);
                          await c.read();
                        },
                        descriptorTiles: c.descriptors
                            .map(
                              (d) => DescriptorTile(
                                descriptor: d,
                                onReadPressed: () => d.read(),
                                onWritePressed: () =>
                                    d.write(_getRandomBytes()),
                              ),
                            )
                            .toList(),
                      ))
                  .toList(),
            ))
        .toList();
  }
}

class ServiceTile extends StatelessWidget {
  final BluetoothService service;
  final List<CharacteristicTile> characteristicTiles;

  const ServiceTile(
      {Key? key, required this.service, required this.characteristicTiles})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (characteristicTiles.isNotEmpty) {
      return ExpansionTile(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Service'),
            Text('0x${service.uuid.toString().toUpperCase().substring(4, 8)}',
                style: TextStyle(color: Colors.blue))
          ],
        ),
        children: characteristicTiles,
      );
    } else {
      return ListTile(
        title: Text('Service'),
        subtitle:
            Text('0x${service.uuid.toString().toUpperCase().substring(4, 8)}'),
      );
    }
  }
}

class CharacteristicTile extends StatelessWidget {
  final BluetoothCharacteristic characteristic;
  final List<DescriptorTile> descriptorTiles;
  final VoidCallback? onReadPressed;
  final VoidCallback? onWritePressed;
  final VoidCallback? onNotificationPressed;

  const CharacteristicTile(
      {Key? key,
      required this.characteristic,
      required this.descriptorTiles,
      this.onReadPressed,
      this.onWritePressed,
      this.onNotificationPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<int>>(
      stream: characteristic.value,
      initialData: characteristic.lastValue,
      builder: (c, snapshot) {
        final value = snapshot.data;
        return ExpansionTile(
          title: ListTile(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Characteristic'),
                Text(
                    '0x${characteristic.uuid.toString().toUpperCase().substring(4, 8)}',
                    style: TextStyle(color: Colors.blue))
              ],
            ),
            subtitle: Text(value.toString()),
            contentPadding: EdgeInsets.all(0.0),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.file_download,
                  color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
                ),
                onPressed: onReadPressed,
              ),
              IconButton(
                icon: Icon(Icons.file_upload,
                    color: Theme.of(context).iconTheme.color?.withOpacity(0.5)),
                onPressed: onWritePressed,
              ),
              IconButton(
                icon: Icon(
                    characteristic.isNotifying
                        ? Icons.sync_disabled
                        : Icons.sync,
                    color: Theme.of(context).iconTheme.color?.withOpacity(0.5)),
                onPressed: onNotificationPressed,
              )
            ],
          ),
          children: descriptorTiles,
        );
      },
    );
  }
}

class DescriptorTile extends StatelessWidget {
  final BluetoothDescriptor descriptor;
  final VoidCallback? onReadPressed;
  final VoidCallback? onWritePressed;

  const DescriptorTile(
      {Key? key,
      required this.descriptor,
      this.onReadPressed,
      this.onWritePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Descriptor'),
          Text('0x${descriptor.uuid.toString().toUpperCase().substring(4, 8)}',
              style: TextStyle(color: Colors.blue))
        ],
      ),
      subtitle: StreamBuilder<List<int>>(
        stream: descriptor.value,
        initialData: descriptor.lastValue,
        builder: (c, snapshot) => Text(snapshot.data.toString()),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.file_download,
              color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
            ),
            onPressed: onReadPressed,
          ),
          IconButton(
            icon: Icon(
              Icons.file_upload,
              color: Theme.of(context).iconTheme.color?.withOpacity(0.5),
            ),
            onPressed: onWritePressed,
          )
        ],
      ),
    );
  }
}

class AdapterStateTile extends StatelessWidget {
  const AdapterStateTile({Key? key, required this.state}) : super(key: key);

  final BluetoothState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: ListTile(
        title: Text(
          'Bluetooth adapter is ${state.toString().substring(15)}',
          style: TextStyle(color: Colors.blue),
        ),
        trailing: Icon(
          Icons.error,
          color: Colors.blueGrey,
        ),
      ),
    );
  }
}
