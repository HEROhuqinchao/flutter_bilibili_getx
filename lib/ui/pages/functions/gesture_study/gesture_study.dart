import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(
    MaterialApp(
      home: GestureHome(),
    ),
  );
}

class GestureHome extends StatefulWidget {
  const GestureHome({Key? key}) : super(key: key);

  @override
  State<GestureHome> createState() => _GestureHomeState();
}

class _GestureHomeState extends State<GestureHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _onTap,
          onTapDown: _onTapDown,
          onTapCancel: _onTapCancel,
          onTapUp: _onTapUp,
          child: Container(
            color: Colors.blue,
            height: 100,
            width: 100,
          ),
        ),
      ),
    );
  }

  void _onTap() {
    print('-----_onTap---------');
  }

  void _onTapDown(TapDownDetails details) {
    print('-----_onTapDown---${details.localPosition}------');
    print('-----_onTapDown---${details.globalPosition}------');
    print('-----_onTapDown---${details.kind}------');
  }

  void _onTapCancel() {
    print('-----_onTapCancel---------');
  }

  void _onTapUp(TapUpDetails details) {
    print('-----_onTapUp---${details.localPosition}------');
    print('-----_onTapUp---${details.globalPosition}------');
    print('-----_onTapUp---${details.kind}------');
  }
}
