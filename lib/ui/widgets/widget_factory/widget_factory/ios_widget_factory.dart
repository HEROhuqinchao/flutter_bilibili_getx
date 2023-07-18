import 'dart:ui';

import 'package:bilibili_getx/ui/widgets/widget_factory/abstract_factory/widget_abstract_factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// IOS风格组件工厂
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
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(10.r)),
      child: Material(
        elevation: elevation ?? 1,
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(10.r)),
        color: color ?? Colors.grey.shade200,
        child: Ink(
          child: InkWell(
            borderRadius:
                borderRadius ?? BorderRadius.all(Radius.circular(10.r)),
            onTap: onTap,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
              child: Opacity(
                opacity: .5,
                child: Container(
                  alignment: Alignment.center,
                  width: size != null ? size.width : 100.r,
                  height: size != null ? size.height : 50.r,
                  child: child,
                ),
              ),
            ),
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
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  overlayEntry?.remove();
                },
                child: Container(
                  color: Colors.grey.shade400.withOpacity(.5),
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
          ),
        );
      },
      opaque: false,
    );

    overlayState.insert(overlayEntry);
  }
}
