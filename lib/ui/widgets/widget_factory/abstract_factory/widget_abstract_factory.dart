import 'package:flutter/material.dart';

///定义抽象工厂类，生产一系列组件
abstract class WidgetFactory {
  ///按钮
  Widget buildButton({
    Color? color,
    Size? size,
    Widget? child,
    Function()? onTap,
    BorderRadius? borderRadius,
    double? elevation,
  });

  ///构建弹框
  void buildDialog(
    BuildContext context, {
    BorderRadius? borderRadius,
    double? elevation,
    Color? color,
    Size? size,
    Widget? child,
  });

  ///组件右上角标志
  Widget buildRightTag({
    Widget? mainPart,
    Color? color,
    Widget? tagPart,
  });
}