import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    Directionality(
      textDirection: TextDirection.ltr,
      child: Container(),
    ),
  );
}

class RawGestureDetectorDemo extends StatefulWidget {
  const RawGestureDetectorDemo({Key? key}) : super(key: key);

  @override
  State<RawGestureDetectorDemo> createState() => _RawGestureDetectorDemoState();
}

class _RawGestureDetectorDemoState extends State<RawGestureDetectorDemo> {
  String action = "";
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    var gesture = <Type, GestureRecognizerFactory>{
      NTapGestureRecognizer:
          GestureRecognizerFactoryWithHandlers<NTapGestureRecognizer>(
        () => NTapGestureRecognizer(8),
        (NTapGestureRecognizer instance) {
          instance
            ..onNTap = _onNTap
            ..onNTapDown = _onNTapDown
            ..onNTapCancel = _onNTapCancel;
        },
      ),
    };
    return RawGestureDetector(
      gestures: gesture,
      child: Container(
        alignment: Alignment.center,
        color: color,
        child: Text(action),
      ),
    );
  }

  _onNTap() {
    setState(() {
      action = 'onNTap';
      color = Colors.green;
    });
  }

  _onNTapDown(TapDownDetails details, int n) {
    setState(() {
      action = 'onNTapDown';
      color = Colors.orange;
    });
  }

  _onNTapCancel(int n) {
    setState(() {
      action = 'onNTapCancel';
      color = Colors.red;
    });
  }
}

typedef GestureNTapCallback = void Function();
typedef GestureNTapDownCallback = void Function(TapDownDetails details, int n);
typedef GestureNTapCancelCallback = void Function(int n);

class NTapGestureRecognizer extends GestureRecognizer {
  GestureNTapCallback? onNTap;
  GestureNTapDownCallback? onNTapDown;
  GestureNTapCancelCallback? onNTapCancel;
  int maxN;
  _TapTracker? _prevTap;
  final Map<int, _TapTracker> _trackers = <int, _TapTracker>{};
  int tapCount = 0;
  Timer? _tapTimer;

  NTapGestureRecognizer(this.maxN);

  @override
  void acceptGesture(int pointer) {
    // TODO: implement acceptGesture
  }

  @override
  // TODO: implement debugDescription
  String get debugDescription => 'N tap';

  @override
  void rejectGesture(int pointer) {
    // TODO: implement rejectGesture
  }

  @override
  void addAllowedPointer(PointerDownEvent event) {
    tapCount++;
    if (_prevTap != null) {
      if (!_prevTap!.isWithinGlobalTolerance(event, kDoubleTapSlop)) {
        return;
      } else if (!_prevTap!.hasElapsedMinTime() ||
          !_prevTap!.hasSameButton(event)) {
        _reset();
        return _trackTap(event);
      } else if (onNTapDown != null) {
        final TapDownDetails details = TapDownDetails(
          globalPosition: event.position,
          localPosition: event.localPosition,
          kind: getKindForPointer(event.pointer),
        );
        invokeCallback<void>(
            'onDoubleTapDown', () => onNTapDown!(details, tapCount));
      }
    }
    _trackTap(event);
  }

  @override
  bool isPointerAllowed(PointerDownEvent event) {
    if (_prevTap == null) {
      switch (event.buttons) {
        case kPrimaryButton:
          if (onNTap == null || onNTapCancel == null || onNTapDown == null) {
            return false;
          }
          break;
        default:
          return false;
      }
    }
    return super.isPointerAllowed(event);
  }

  void _trackTap(PointerDownEvent event) {
    _stopDoubleTapTimer();
    final _TapTracker tracker = _TapTracker(
      event: event,
      entry: GestureBinding.instance.gestureArena.add(event.pointer, this),
      doubleTapMinTime: kDoubleTapMinTime,
      gestureSettings: gestureSettings,
    );
    _trackers[event.pointer] = tracker;
    tracker.startTrackingPointer(_handleEvent, event.transform);
  }

  void _reset() {
    _stopDoubleTapTimer();
    if (_prevTap != null) {
      if (_trackers.isNotEmpty) {
        _checkCancel();
      }
      // Note, order is important below in order for the resolve -> reject logic
      // to work properly.
      final _TapTracker tracker = _prevTap!;
      _prevTap = null;
      _reject(tracker);
      GestureBinding.instance.gestureArena.release(tracker.pointer);
    }
    _clearTrackers();
  }

  void _stopDoubleTapTimer() {
    if (_tapTimer != null) {
      _tapTimer!.cancel();
      _tapTimer = null;
    }
  }

  void _checkCancel() {
    if (onNTapCancel != null) {
      invokeCallback<void>('onDoubleTapCancel', () => onNTapCancel!(tapCount));
    }
  }

  void _reject(_TapTracker tracker) {
    _trackers.remove(tracker.pointer);
    tracker.entry.resolve(GestureDisposition.rejected);
    _freezeTracker(tracker);
    if (_prevTap != null) {
      if (tracker == _prevTap) {
        _reset();
      } else {
        _checkCancel();
        if (_trackers.isEmpty) {
          _reset();
        }
      }
    }
  }

  void _freezeTracker(_TapTracker tracker) {
    tracker.stopTrackingPointer(_handleEvent);
  }

  void _clearTrackers() {
    _trackers.values.toList().forEach(_reject);
    assert(_trackers.isEmpty);
  }

  void _handleEvent(PointerEvent event) {
    final _TapTracker tracker = _trackers[event.pointer]!;
    if (event is PointerUpEvent) {
      if (_prevTap == null || tapCount != maxN) {
        _registerTap(tracker);
      } else {
        _registerLastTap(tracker);
      }
    } else if (event is PointerMoveEvent) {
      if (!tracker.isWithinGlobalTolerance(event, kDoubleTapTouchSlop)) {
        _reject(tracker);
      }
    } else if (event is PointerCancelEvent) {
      _reject(tracker);
    }
  }

  void _registerTap(_TapTracker tracker) {
    _startDoubleTapTimer();
    GestureBinding.instance.gestureArena.hold(tracker.pointer);
    _freezeTracker(tracker);
    _trackers.remove(tracker.pointer);
    _clearTrackers();
    _prevTap = tracker;
  }

  void _registerLastTap(_TapTracker tracker) {
    _prevTap!.entry.resolve(GestureDisposition.accepted);
    tracker.entry.resolve(GestureDisposition.accepted);
    _freezeTracker(tracker);
    _trackers.remove(tracker.pointer);
    _checkUp(tracker.initialButtons);
    _reset();
  }

  void _startDoubleTapTimer() {
    _tapTimer ??= Timer(kDoubleTapTimeout, _reset);
  }

  void _checkUp(int buttons) {
    if (onNTap != null) {
      invokeCallback<void>('onNTap', onNTap!);
    }
  }
}

class _TapTracker {
  _TapTracker({
    required PointerDownEvent event,
    required this.entry,
    required Duration doubleTapMinTime,
    required this.gestureSettings,
  })  : pointer = event.pointer,
        _initialGlobalPosition = event.position,
        initialButtons = event.buttons,
        _doubleTapMinTimeCountdown =
            _CountdownZoned(duration: doubleTapMinTime);

  final DeviceGestureSettings? gestureSettings;
  final int pointer;
  final GestureArenaEntry entry;
  final Offset _initialGlobalPosition;
  final int initialButtons;
  final _CountdownZoned _doubleTapMinTimeCountdown;

  bool _isTrackingPointer = false;

  void startTrackingPointer(PointerRoute route, Matrix4? transform) {
    if (!_isTrackingPointer) {
      _isTrackingPointer = true;
      GestureBinding.instance.pointerRouter.addRoute(pointer, route, transform);
    }
  }

  void stopTrackingPointer(PointerRoute route) {
    if (_isTrackingPointer) {
      _isTrackingPointer = false;
      GestureBinding.instance.pointerRouter.removeRoute(pointer, route);
    }
  }

  bool isWithinGlobalTolerance(PointerEvent event, double tolerance) {
    final Offset offset = event.position - _initialGlobalPosition;
    return offset.distance <= tolerance;
  }

  bool hasElapsedMinTime() {
    return _doubleTapMinTimeCountdown.timeout;
  }

  bool hasSameButton(PointerDownEvent event) {
    return event.buttons == initialButtons;
  }
}

class _CountdownZoned {
  _CountdownZoned({required Duration duration}) {
    Timer(duration, _onTimeout);
  }

  bool _timeout = false;

  bool get timeout => _timeout;

  void _onTimeout() {
    _timeout = true;
  }
}
