import 'dart:ui';

class ScaleBoundaries {
  late final dynamic minScale;
  late final dynamic maxScale;
  late final dynamic initialScale;
  late final Size? outerSize;
  late final Size? childSize;

  ScaleBoundaries({
    this.minScale,
    this.maxScale,
    this.initialScale,
    this.outerSize,
    this.childSize,
  });
}
