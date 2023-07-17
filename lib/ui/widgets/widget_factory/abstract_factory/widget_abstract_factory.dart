import 'package:flutter/material.dart';

///定义抽象工厂类，生产一系列组件
abstract class WidgetFactory {
  ///按钮
  Widget buildButton();

  Widget buildDialog();
}
