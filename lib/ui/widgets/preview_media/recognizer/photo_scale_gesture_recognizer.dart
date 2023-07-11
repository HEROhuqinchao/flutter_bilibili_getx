import 'dart:ui' as ui;
import 'package:flutter/gestures.dart';

///处理左滑右滑和缩放图片的手势冲突问题
class PhotoScaleGestureRecognizer extends ScaleGestureRecognizer {
  ///记录当前屏幕上有几根手指按着
  late Map<int, Offset> _pointerLocations = <int, Offset>{};

  ///左右滑动，触点离开时，_pointerLocations要清空
  bool ready = true;

  ///注册触点（当手指放上屏幕时，触发）
  @override
  void addAllowedPointer(event) {
    if (ready) {
      ready = false;
      _pointerLocations = <int, Offset>{};
    }
    super.addAllowedPointer(event);
  }

  ///当手指离开时，触发
  @override
  void didStopTrackingLastPointer(int pointer) {
    ready = true;
    super.didStopTrackingLastPointer(pointer);
  }

  ///接收触点信息
  @override
  void handleEvent(PointerEvent event) {
    ///更新触点们的位置
    _computeEvent(event);

    ///判断是否要接受触点（双指和单指）
    _decideIfWeAcceptEvent(event);
    super.handleEvent(event);
  }

  ///获取触点并加入数据
  void _computeEvent(PointerEvent event) {
    if (event is PointerMoveEvent) {
      if (!event.synthesized) {
        _pointerLocations[event.pointer] = event.position;
      }
    } else if (event is PointerDownEvent) {
      _pointerLocations[event.pointer] = event.position;
    } else if (event is PointerUpEvent || event is PointerCancelEvent) {
      _pointerLocations.remove(event.pointer);
    }
  }

  void _decideIfWeAcceptEvent(PointerEvent event) {
    if (event is! PointerMoveEvent) {
      return;
    }
    ///当双指时，接受触点
    if (_pointerLocations.keys.length > 1) {
      acceptGesture(event.pointer);
    }
  }
}
