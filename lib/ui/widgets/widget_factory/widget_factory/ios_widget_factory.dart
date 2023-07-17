import 'package:bilibili_getx/ui/widgets/widget_factory/abstract_factory/widget_abstract_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IosWidgetFactory extends WidgetFactory {
  @override
  Widget buildButton({
    Color? color,
    Widget? child,
    Size? size,
    BorderRadius? borderRadius,
    double? elevation,
    Function()? onTap,
  }) {
    return Material(
      elevation: elevation ?? .5,
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(6.r)),
      color: color ?? Colors.white,
      child: Ink(
        child: InkWell(
          borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(6.r)),
          onTap: () => onTap,
          child: Opacity(
            opacity: 1,
            child: SizedBox(
              width: size != null ? size.width : 100.r,
              height: size != null ? size.height : 50.r,
              child: child,
            ),
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
