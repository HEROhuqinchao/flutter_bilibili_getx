import 'dart:ui';

import 'package:bilibili_getx/ui/widgets/widget_factory/abstract_factory/widget_abstract_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// android风格组件工厂
class AndroidWidgetFactory extends WidgetFactory {
  AndroidWidgetFactory._internal();

  static final AndroidWidgetFactory _instance =
      AndroidWidgetFactory._internal();

  factory AndroidWidgetFactory.getInstance() => _instance;

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
          onTap: onTap,
          child: Container(
            alignment: Alignment.center,
            width: size != null ? size.width : 100.r,
            height: size != null ? size.height : 50.r,
            child: child,
          ),
        ),
      ),
    );
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
    ///获取OverlayState
    OverlayState? overlayState = Overlay.of(context);

    ///覆盖层
    OverlayEntry? overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (ctx) {
        return Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                overlayEntry?.remove();
              },
              child: Container(
                color: Colors.black.withOpacity(.5),
                width: 1.sw,
                height: 1.sh,
              ),
            ),
            ClipRRect(
              borderRadius:
                  borderRadius ?? BorderRadius.all(Radius.circular(10.r)),
              child: Material(
                elevation: elevation ?? 1,
                borderRadius:
                    borderRadius ?? BorderRadius.all(Radius.circular(10.r)),
                color: color ?? Colors.white,
                child: child,
              ),
            )
          ],
        );
      },
      opaque: false,
    );

    overlayState.insert(overlayEntry);
  }

  @override
  Widget buildRightTag({
    Widget? mainPart,
    Color? color,
    Widget? tagPart,
    bool? showTagPart,
  }) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(4.r)),
          ),
          width: 40.r,
          height: 40.r,
          child: mainPart,
        ),
        Positioned(
          right: 5.r,
          top: 5.r,
          child: tagPart ??
              Container(
                width: 10.r,
                height: 10.r,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.red),
              ),
        ),
      ],
    );
  }
}
