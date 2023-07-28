import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:bilibili_getx/ui/shared/image_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Sprite {
  Rect position; // 雪碧图 中 图片矩形区域
  Offset offset; // 移动偏倚
  int alpha; // 透明度
  double rotation; // 旋转角度
  Sprite({
    required this.offset,
    required this.alpha,
    this.rotation = 0,
    required this.position,
  });
}

class Paper extends StatelessWidget {
  const Paper({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.white,
      child: FutureBuilder<ui.Image?>(
        future: _loadImage(),
        builder: (ctx, snapshot) {
          return CustomPaint(
            painter: PaperCustomPainter(snapshot.data),
          );
        },
      ),
    );
  }

  Future<ui.Image?> _loadImage() async {
    ui.Image? image = await loadImageFromAssets(ImageAssets.canvasAvatarPng);
    return image;
  }

  ///从Assets中获取图片数据
  Future<ui.Image>? loadImageFromAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    return decodeImageFromList(data.buffer.asUint8List());
  }
}

class PaperCustomPainter extends CustomPainter {
  late Paint _paint;
  final ui.Image? image;
  final List<Sprite> allSprites = []; // Sprite 列表

  PaperCustomPainter(this.image) {
    _paint = Paint();
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (image == null) {
      return;
    }
    // 添加一个 Sprite
    allSprites.add(Sprite(
        position: Rect.fromLTWH(0, 0, 50, 50),
        offset: Offset(0, 0),
        alpha: 255,
        rotation: 0));
    // 通过 allSprites 创建 RSTransform 集合
    final List<RSTransform> transforms = allSprites
        .map((sprite) => RSTransform.fromComponents(
              rotation: sprite.rotation,
              scale: 1.0,
              anchorX: 0,
              anchorY: 0,
              translateX: sprite.offset.dx,
              translateY: sprite.offset.dy,
            ))
        .toList();
    // 通过 allSprites 创建 Rect 集合
    final List<Rect> rects =
        allSprites.map((sprite) => sprite.position).toList();

    canvas.drawAtlas(image!, transforms, rects, null, null, null, _paint);
  }

  @override
  bool shouldRepaint(PaperCustomPainter oldDelegate) => image != oldDelegate.image;
}
