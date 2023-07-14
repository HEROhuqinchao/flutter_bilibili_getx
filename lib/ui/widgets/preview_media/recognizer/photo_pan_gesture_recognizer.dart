import 'package:bilibili_getx/ui/widgets/preview_media/change_notifier/view_size_change_notifier.dart';
import 'package:flutter/gestures.dart';

///处理图片平移与PageView左右滑动
class PhotoPanGestureRecognizer extends ScaleGestureRecognizer {
  Offset? _initialFocalPoint;
  Offset? _currentFocalPoint;
  late Map<int, Offset> _pointerLocations = <int, Offset>{};

  ///限制接受两个点
  bool ready = true;

  late ViewSizeChangeNotifier viewSizeChangeNotifier;

  PhotoPanGestureRecognizer(this.viewSizeChangeNotifier);

  ///接收触点信息
  @override
  void handleEvent(PointerEvent event) {
    _operatePointerEvent(event);
    _updateDistance();
    _decideIfWeAcceptPointerEvent(event);
    super.handleEvent(event);
  }

  ///加入允许的触点（触点入场）
  @override
  void addAllowedPointer(PointerDownEvent event) {
    if (ready) {
      ready = false;
      _pointerLocations = <int, Offset>{};
    }
    super.addAllowedPointer(event);
  }

  ///停止追踪触点
  @override
  void didStopTrackingLastPointer(int pointer) {
    ready = true;
    super.didStopTrackingLastPointer(pointer);
  }

  ///维护触点数组
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

  ///似乎算了个平均值（参考PhotoView里面的）
  _updateDistance() {
    final int count = _pointerLocations.keys.length;
    Offset focalPoint = Offset.zero;
    for (int pointer in _pointerLocations.keys) {
      focalPoint += _pointerLocations[pointer]!;
      _currentFocalPoint =
          count > 0 ? focalPoint / count.toDouble() : Offset.zero;
    }
  }

  ///关键（宣判哪些手势/触点获胜）
  _decideIfWeAcceptPointerEvent(PointerEvent event) {
    if (event is! PointerMoveEvent) {
      return;
    }
    viewSizeChangeNotifier.setMove = _initialFocalPoint! - _currentFocalPoint!;
    final bool shouldMove = viewSizeChangeNotifier.decideIfPan();
    if (shouldMove || _pointerLocations.keys.length > 1) {
      acceptGesture(event.pointer);
    }
  }
}
