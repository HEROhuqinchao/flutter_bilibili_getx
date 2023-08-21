import 'dart:typed_data';
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
    allSprites.add(Sprite(
        position: Rect.fromLTWH(0, 0, 257, 166),
        offset: Offset(0, 0),
        alpha: 255,
        rotation: 0));

    allSprites.add(Sprite(
        position: Rect.fromLTWH(0, 0, 257, 166),
        offset: Offset(257, 130),
        alpha: 255,
        rotation: 0));

    Float32List rectList = Float32List(allSprites.length * 4);
    Float32List transformList = Float32List(allSprites.length * 4);

    for (int i = 0; i < allSprites.length; i++) {
      final Sprite sprite = allSprites[i];
      rectList[i * 4 + 0] = sprite.position.left;
      rectList[i * 4 + 1] = sprite.position.top;
      rectList[i * 4 + 2] = sprite.position.right;
      rectList[i * 4 + 3] = sprite.position.bottom;
      final RSTransform transform = RSTransform.fromComponents(
        rotation: sprite.rotation,
        scale: 1.0,
        anchorX: sprite.position.center.dx,
        anchorY: sprite.position.center.dy,
        translateX: sprite.offset.dx,
        translateY: sprite.offset.dy,
      );
      transformList[i * 4 + 0] = transform.scos;
      transformList[i * 4 + 1] = transform.ssin;
      transformList[i * 4 + 2] = transform.tx;
      transformList[i * 4 + 3] = transform.ty;
    }
    canvas.drawRawAtlas(
        image!, transformList, rectList, null, null, null, _paint);
  }

  @override
  bool shouldRepaint(PaperCustomPainter oldDelegate) =>
      image != oldDelegate.image;
}
