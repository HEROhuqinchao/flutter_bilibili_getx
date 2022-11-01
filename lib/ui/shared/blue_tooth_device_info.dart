import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class BlueToothDeviceInfo extends StatelessWidget {
  BluetoothDevice device;

  BlueToothDeviceInfo({required this.device});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("设备名称：${device.name}"),
        actions: [
          StreamBuilder<BluetoothDeviceState>(builder: (c, snapshot) {
            VoidCallback? onPressed;
            String text;
            switch (snapshot.data) {
              case BluetoothDeviceState.connected:
                onPressed = () => device.connect();
                text = '断开连接';
                break;
              case BluetoothDeviceState.disconnected:
                onPressed = () => device.disconnect();
                text = "连接";
                break;
              default:
                onPressed = null;
                text = snapshot.data.toString().substring(21).toUpperCase();
                break;
            }
            return ElevatedButton(
              onPressed: onPressed,
              child: Text(text),
            );
          })
        ],
      ),
    );
  }
}
