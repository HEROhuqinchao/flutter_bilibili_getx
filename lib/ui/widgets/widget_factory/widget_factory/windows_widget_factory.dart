import 'dart:ui';

import 'package:bilibili_getx/ui/widgets/widget_factory/abstract_factory/widget_abstract_factory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';

class WindowsWidgetFactory extends WidgetFactory {
  @override
  Widget buildButton({
    Color? color,
    Size? size,
    Widget? child,
    Function()? onTap,
    BorderRadius? borderRadius,
    double? elevation,
  }) {
    // TODO: implement buildButton
    throw UnimplementedError();
  }

  @override
  void buildDialog(
    BuildContext context, {
    BorderRadius? borderRadius,
    double? elevation,
    Color? color,
    Size? size,
    Widget? child,
  }) {
    // TODO: implement buildDialog
  }
}
