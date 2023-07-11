import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///Canvas绘制图片（暂时不用）
class ImageCustomPainter extends CustomPainter {
  ui.Image image; //图片
  ValueListenable scale;

  ImageCustomPainter({
    required this.image,
    required this.scale,
  }) : super(repaint: scale);

  @override
  void paint(Canvas canvas, Size size) {
    ///计算图片的高度宽度
    double width = 1.sw;
    double height = image.height.toDouble() / image.width.toDouble() * 1.sw;

    ///画布居中
    canvas.translate(size.width / 2, size.height / 2);

    ///绘制背景色
    canvas.drawColor(Colors.black, BlendMode.srcIn);

    ///裁剪矩形
    Rect src = Rect.fromLTWH(
      0,
      0,
      image.width.toDouble(),
      image.height.toDouble(),
    );

    ///位置矩形
    Rect dst = Rect.fromLTWH(
      -width / 2,
      -height / 2,
      width * scale.value,
      height * scale.value,
    );
    canvas.drawImageRect(
      image,
      src,
      dst,
      Paint()
        ..style = PaintingStyle.fill
        ..strokeWidth = .5
        ..color = Colors.blue,
    );
  }

  @override
  bool shouldRepaint(ImageCustomPainter oldDelegate) {
    return (image != oldDelegate.image || scale != oldDelegate.scale);
  }
}
