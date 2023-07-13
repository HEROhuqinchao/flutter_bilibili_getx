import 'package:flutter/gestures.dart';

///处理图片平移与PageView左右滑动
class PhotoPanGestureRecognizer extends ScaleGestureRecognizer {
  Offset? _initialFocalPoint;
  Offset? _currentFocalPoint;
  late Map<int, Offset> _pointerLocations = <int, Offset>{};

  ///限制接受两个点
  bool ready = true;

  PhotoPanGestureRecognizer();

  @override
  void handleEvent(PointerEvent event) {
    _operatePointerEvent(event);
    _updateDistance();
    _decideIfWeAcceptPointerEvent(event);
    super.handleEvent(event);
  }

  @override
  void addAllowedPointer(PointerDownEvent event) {
    if (ready) {
      ready = false;
      _pointerLocations = <int, Offset>{};
    }
    super.addAllowedPointer(event);
  }

  @override
  void didStopTrackingLastPointer(int pointer) {
    ready = true;
    super.didStopTrackingLastPointer(pointer);
  }

  _operatePointerEvent(PointerEvent event) {
    if (event is PointerMoveEvent) {
      if (!event.synthesized) {
        _pointerLocations[event.pointer] = event.position;
      }
    } else if (event is PointerDownEvent) {
      _pointerLocations[event.pointer] = event.position;
    } else if (event is PointerUpEvent || event is PointerCancelEvent) {
      _pointerLocations.remove(event.pointer);
    }
    _initialFocalPoint = _currentFocalPoint;
  }

  _updateDistance() {
    final int count = _pointerLocations.keys.length;
    Offset focalPoint = Offset.zero;
    for (int pointer in _pointerLocations.keys) {
      focalPoint += _pointerLocations[pointer]!;
      _currentFocalPoint =
          count > 0 ? focalPoint / count.toDouble() : Offset.zero;
    }
  }

  _decideIfWeAcceptPointerEvent(PointerEvent event) {
    if (event is! PointerMoveEvent) {
      return;
    }
    final move = _initialFocalPoint! - _currentFocalPoint!;
    // final bool shouldMove = hitDetector!;
  }
}
