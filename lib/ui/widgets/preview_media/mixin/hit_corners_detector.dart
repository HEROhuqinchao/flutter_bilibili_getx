import 'package:flutter/cupertino.dart';

import '../widget/preview_media_pageview_child.dart';

mixin HitCornersDetector on State<PreviewMediaPageViewChild>{
  bool _shouldMoveX(Offset move) {
    final hitCornersX = _hitCornersX();
    final mainAxisMove = move.dx;
    final crossAxisMove = move.dy;

    return _shouldMoveAxis(hitCornersX, mainAxisMove, crossAxisMove);
  }
}