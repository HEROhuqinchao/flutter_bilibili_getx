import 'package:flutter/gestures.dart';

class PhotoPanGestureRecognizer extends ScaleGestureRecognizer {
  @override
  void handleEvent(PointerEvent event) {
    if(event is PointerMoveEvent) {
      acceptGesture(event.pointer);
    }
    super.handleEvent(event);
  }
}