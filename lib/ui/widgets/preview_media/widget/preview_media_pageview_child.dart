import 'dart:async';

import 'package:bilibili_getx/ui/widgets/preview_media/util/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../shared/app_theme.dart';
import '../mixin/hit_corners_detector.dart';
import '../model/media_type_model.dart';
import '../model/scale_state_enum.dart';
import '../model/transform_value.dart';
import '../recognizer/photo_pan_gesture_recognizer.dart';

class PreviewMediaPageViewChild extends StatefulWidget {
  ///媒体网络地址
  final String url;

  ///图片缩放速度(下拉）
  final int kScaleSpeed;

  ///双击放大
  final double doubleTapScale;

  ///最小缩放
  final double minScale;

  ///下拉多少距离关闭预览
  final double closePreviewDistance;

  const PreviewMediaPageViewChild({
    super.key,
    required this.url,
    this.kScaleSpeed = 300,
    this.doubleTapScale = 1.5,
    this.minScale = .5,
    this.closePreviewDistance = 50,
  });

  @override
  State<PreviewMediaPageViewChild> createState() =>
      PreviewMediaPageViewChildState();
}

class PreviewMediaPageViewChildState extends State<PreviewMediaPageViewChild>
    with
        AutomaticKeepAliveClientMixin,
        SingleTickerProviderStateMixin,
        HitCornersDetector {
  ///缩放之前
  late double scaleBefore;

  ///旋转之前
  late double rotationBefore;

  ///旋转之后角度
  late double newRotation;

  ///缩放值之后
  late double newScale;

  ///图片位置
  late Offset newPosition;

  ///移动矢量
  late Offset delta;

  ///变形值（缩放scale、位置position、旋转角度rotation）
  late StreamController<TransformValue> streamController;

  ///是否下拉拖动关闭图片
  late bool closePreView;

  ///开始拖动起点
  late Offset dragBefore;

  ///单指情况下的状态
  late ScaleState scaleState;

  ///动画控制器
  late AnimationController animationController;

  ///转换为矩阵的区间动画
  late Tween<Matrix4> tweenMatrix4;

  ///维护手势检测器
  late Map<Type, GestureRecognizerFactory<GestureRecognizer>> gestures;

  ///外部容器大小
  late Size outerSize;

  ///容器内child大小
  late Size childSize;

  ///平移量
  late double panX;

  @override
  void initState() {
    scaleBefore = 1;
    rotationBefore = 0;
    newScale = 1;
    newRotation = 0;
    newPosition = const Offset(0.0, 0.0);
    delta = const Offset(0.0, 0.0);
    streamController = StreamController<TransformValue>.broadcast();
    scaleState = ScaleState.none;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    gestures = {};

    ///双击手势检测
    gestures[DoubleTapGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<DoubleTapGestureRecognizer>(
      () => DoubleTapGestureRecognizer(),
      (DoubleTapGestureRecognizer instance) {
        ///双击放大和回到初始状态
        instance.onDoubleTap = onDoubleTap;
      },
    );

    ///scale手势检测
    gestures[PhotoPanGestureRecognizer] =
        GestureRecognizerFactoryWithHandlers<PhotoPanGestureRecognizer>(
      () => PhotoPanGestureRecognizer(),
      (PhotoPanGestureRecognizer instance) {
        instance
          ..onStart = onScaleStart
          ..onUpdate = onScaleUpdate
          ..onEnd = onScaleEnd;
      },
    );
    panX = 0;
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return LayoutBuilder(
      builder: (ctx, constraints) {
        outerSize = constraints.biggest;
        childSize = outerSize;
        return StreamBuilder<TransformValue>(
          initialData: TransformValue(
            scale: newScale,
            rotation: newRotation,
            offset: delta,
            scaleBefore: newScale,
            rotationBefore: newRotation,
            offsetBefore: delta,
          ),
          stream: streamController.stream,
          builder: (ctx, transformValue) {
            return Container(
              color: HYAppTheme.norBlackColors
                  .withOpacity(opacityValue(transformValue.data!.scale)),
              child: _mediaType == MediaTypeModel.images
                  ? buildImageEdit(
                      imageUrl: widget.url,
                      transformValue: transformValue,
                    )
                  : _mediaType == MediaTypeModel.video
                      ? Container()
                      : Container(
                          child: const Text("非视频和图片类型"),
                        ),
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;

  ///图片
  Widget buildImageEdit({
    required String imageUrl,
    required AsyncSnapshot<TransformValue> transformValue,
  }) {
    return RawGestureDetector(
      gestures: gestures, //ClipRect 放大范围裁剪
      child: transformValue.hasData
          ? AnimatedBuilder(
              animation: animationController,
              builder: (ctx, child) {
                tweenMatrix4 = Tween(
                  begin: transformValue.data!.formBeforeMatrix4,
                  end: transformValue.data!.formMatrix4,
                );
                return Transform(
                  alignment: Alignment.center,
                  transform: tweenMatrix4.transform(animationController.value),
                  child: Image(
                    image: NetworkImage(widget.url),
                    fit: BoxFit.contain,
                  ),
                );
              },
            )
          : Container(),
    );
  }

  ///双击回调方法
  onDoubleTap() {
    scaleState = ScaleState.pan;
    notifyUpdate(
      scale: getNewScale,
      rotation: 0,
      offset: const Offset(0, 0),
    );
  }

  ///缩放开始
  onScaleStart(details) {
    ///双指放大
    if (details.pointerCount == 2) {
      scaleState = ScaleState.doubleTapScale;
    }

    ///单指
    if (details.pointerCount == 1) {
      dragBefore = details.focalPoint;

      ///已经放大，平移图片
      if (newScale != 1) {
        scaleState = ScaleState.pan;
      } else {
        ///下拉收起图片
        scaleState = ScaleState.backToOriginal;
      }
    }
  }

  ///缩放更新
  onScaleUpdate(details) {
    delta = details.focalPointDelta;
    if (details.pointerCount == 2) {
      // panX += delta.dx;
      // print("平移量$panX");
      notifyUpdate(
        scale: scaleBefore * details.scale,
        rotation: rotationBefore + details.rotation,
        offset: newPosition + delta,
      );
    }
    if (details.pointerCount == 1) {
      if (scaleState == ScaleState.pan) {
        panX += delta.dx;
        notifyUpdate(
          offset: newPosition + delta,
        );
      } else {
        Offset nowLocalFocalPoint = details.localFocalPoint;
        delta = details.focalPointDelta;

        ///最初按下的位置更下则缩放，高于最初的位置则不缩放
        if (pointsHigher(dragBefore, nowLocalFocalPoint)) {
          notifyUpdate(
            scale: (newScale - (delta.dy / widget.kScaleSpeed))
                .clamp(widget.minScale, 1),
            offset: newPosition + details.focalPointDelta,
          );
        } else {
          notifyUpdate(
            offset: newPosition + details.focalPointDelta,
          );
        }

        ///返回原大小原位置
        if (pointsDistance(nowLocalFocalPoint, dragBefore) >
                widget.closePreviewDistance &&
            pointsHigher(dragBefore, nowLocalFocalPoint)) {
          scaleState = ScaleState.dragOut;
        } else {
          scaleState = ScaleState.backToOriginal;
        }
      }
    }
  }

  ///缩放结束
  onScaleEnd(details) {
    if (scaleState == ScaleState.dragOut) {
      SmartDialog.dismiss();
    } else if (scaleState == ScaleState.backToOriginal) {
      notifyUpdate(
        scale: 1,
        rotation: 0,
        offset: const Offset(0, 0),
      );
    }
    scaleBefore = newScale;
    rotationBefore = newRotation;
  }

  ///获取媒体类型
  MediaTypeModel get _mediaType => getMediaType(widget.url);

  ///透明度
  double opacityValue(double scale) =>
      scaleState == ScaleState.dragOut ? scale.clamp(0, 1) : 1;

  ///点位高低
  bool pointsHigher(Offset pointA, Offset pointB) =>
      pointA.dy < pointB.dy ? true : false;

  ///点与点之间的距离
  double pointsDistance(Offset pointA, Offset pointB) =>
      (pointA - pointB).distance;

  double get getNewScale => newScale == 1 ? widget.doubleTapScale : 1;

  ///通知更新
  void notifyUpdate({
    double? scale,
    double? rotation,
    Offset? offset,
  }) {
    streamController.sink.add(
      TransformValue(
        scale: scale ?? newScale,
        rotation: rotation ?? newRotation,
        offset: offset ?? newPosition,
        scaleBefore: newScale,
        rotationBefore: newRotation,
        offsetBefore: newPosition,
      ),
    );
    if (scale != null) {
      newScale = scale;
    }
    if (offset != null) {
      newPosition = offset;
    }
    if (rotation != null) {
      newRotation = rotation;
    }
    animationController.forward(from: 0);
    // print("外部大小${outerSize.width}");
    // print("内部大小${childSize.width * (scale ?? newScale)}");
    final double computedWidth = outerSize.width;
    final double screenWidth = childSize.width * (scale ?? newScale);
    final double widthDiff = computedWidth - screenWidth;
    final double minX = ((0 - 1).abs() / 2) * widthDiff * -1;
    final double maxX = ((0 + 1).abs() / 2) * widthDiff;
    // print("移动区间范围$minX 到 $maxX");
  }
}
