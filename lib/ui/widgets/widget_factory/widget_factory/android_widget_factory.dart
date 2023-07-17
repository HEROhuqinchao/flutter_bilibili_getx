import 'package:bilibili_getx/ui/widgets/widget_factory/abstract_factory/widget_abstract_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AndroidWidgetFactory extends WidgetFactory {
  @override
  Widget buildButton({
    Color? color,
    Size? size,
    Widget? child,
    Function()? onTap,
    BorderRadius? borderRadius,
    double? elevation,
  }) {
    return Material(
      elevation: elevation ?? .5,
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(6.r)),
      color: color ?? Colors.blue,
      child: Ink(
        child: InkWell(
          borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(6.r)),
          onTap: () => onTap,
          child: SizedBox(
            width: size != null ? size.width : 100.r,
            height: size != null ? size.height : 50.r,
            child: child,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildDialog() {
    // TODO: implement buildDialog
    throw UnimplementedError();
  }
}
