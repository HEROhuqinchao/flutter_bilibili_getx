import 'dart:async';

import 'package:bilibili_getx/ui/widgets/preview_media/recognizer/photo_scale_gesture_recognizer.dart';
import 'package:bilibili_getx/ui/widgets/preview_media/util/util.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import '../../../shared/app_theme.dart';
import '../model/media_type_model.dart';
import '../model/scale_state_enum.dart';
import '../model/transform_value.dart';

class PreviewMediaPageViewChild extends StatefulWidget {
  final String url;

  const PreviewMediaPageViewChild(this.url, {super.key});

  @override
  State<PreviewMediaPageViewChild> createState() =>
      _PreviewMediaPageViewChildState();
}

class _PreviewMediaPageViewChildState extends State<PreviewMediaPageViewChild>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  ///缩放之前
  late double scaleBefore;

  ///旋转之前
  late double rotationBefore;

  ///旋转之后角度
  late double newRotation;

  ///缩放值之后
  late double newScale;

  ///图片位置
  late Offset position;

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

  @override
  void initState() {
    scaleBefore = 1;
    rotationBefore = 0;
    newScale = 1;
    newRotation = 0;
    position = const Offset(0.0, 0.0);
    delta = const Offset(0.0, 0.0);
    streamController = StreamController<TransformValue>.broadcast();
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  MediaTypeModel get _mediaType => getMediaType(widget.url);

  int get kScale => 300;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return StreamBuilder<TransformValue>(
      initialData: TransformValue(
        scale: newScale,
        rotation: newRotation,
        offset: delta,
      ),
      stream: streamController.stream,
      builder: (ctx, transformValue) {
        return Container(
          color: HYAppTheme.norBlackColors.withOpacity(
            transformValue.data!.scale.clamp(0, 1),
          ),
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
  }

  @override
  bool get wantKeepAlive => true;

  ///图片
  buildImageEdit({
    required String imageUrl,
    required AsyncSnapshot<TransformValue> transformValue,
  }) {
    return LayoutBuilder(
      builder: (ctx, cons) {
        return RawGestureDetector(
          gestures: {
            ScaleGestureRecognizer:
                GestureRecognizerFactoryWithHandlers<ScaleGestureRecognizer>(
              () => ScaleGestureRecognizer(),
              (ScaleGestureRecognizer instance) {
                instance
                  ..onStart = (details) {
                    if (details.pointerCount == 2) {
                      // positionBefore = details.focalPoint;
                    }

                    ///单指
                    if (details.pointerCount == 1) {
                      dragBefore = details.focalPoint;
                      ///已经放大，平移图片
                      if (newScale != 1) {
                        scaleState = ScaleState.pan;
                      } else {
                        ///下拉收起图片
                        scaleState = ScaleState.dragOut;
                      }
                    }
                  }
                  ..onUpdate = (details) {
                    if (details.pointerCount == 2) {
                      newScale = scaleBefore * details.scale;
                      newRotation = rotationBefore + details.rotation;
                      delta = details.focalPointDelta;
                      position = position + delta;
                      streamController.sink.add(
                        TransformValue(
                          scale: newScale,
                          rotation: newRotation,
                          offset: position,
                        ),
                      );
                    }
                    if (details.pointerCount == 1) {
                      print(delta.distance);
                      if (scaleState == ScaleState.pan) {
                        position = position + details.focalPointDelta;
                      } else if (scaleState == ScaleState.dragOut) {
                        delta = details.focalPointDelta;
                        position = position + details.focalPointDelta;
                        newScale = newScale - (delta.dy / kScale);

                        ///返回原大小原位置
                        if (newScale >= 1) {
                          scaleState = ScaleState.backToOriginal;
                        }
                      }
                      streamController.sink.add(TransformValue(
                        scale: newScale,
                        rotation: newRotation,
                        offset: position,
                      ));
                    }
                  }
                  ..onEnd = (details) {
                    if (scaleState == ScaleState.dragOut) {
                      SmartDialog.dismiss();
                    } else if (scaleState == ScaleState.backToOriginal) {
                      streamController.sink.add(TransformValue(
                        scale: 1,
                        rotation: 0,
                        offset: const Offset(0, 0),
                      ));
                    }
                    scaleBefore = newScale;
                    rotationBefore = newRotation;
                  };
              },
            ),
          }, //ClipRect 放大范围裁剪
          child: ClipRect(
            child: Builder(
              builder: (ctx) {
                if (transformValue.hasData) {
                  final matrix = Matrix4.identity()
                    ..translate(transformValue.data!.offset.dx,
                        transformValue.data!.offset.dy)
                    ..scale(transformValue.data!.scale < 0.5
                        ? 0.5
                        : transformValue.data!.scale)
                    ..rotateZ(transformValue.data!.rotation);
                  return Transform(
                    alignment: Alignment.center,
                    transform: matrix,
                    child: Image(
                      image: NetworkImage(widget.url),
                      fit: BoxFit.contain,
                    ),
                  );
                } else {
                  return SizedBox(
                    width: 50.r,
                    height: 50.r,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
          // child: FutureBuilder<ui.Image>(
          //   future: loadingNetImage(widget.url),
          //   builder: (ctx, snapshot) {
          //     if (snapshot.data == null) {
          //       return SizedBox(
          //         width: 50.r,
          //         height: 50.r,
          //         child: const CircularProgressIndicator(),
          //       );
          //     } else {
          //       return CustomPaint(
          //         painter: ImageCustomPainter(
          //           image: snapshot.data!,
          //           scale: scaleValueNotifier,
          //         ),
          //       );
          //     }
          //   },
          // ),
        );
      },
    );
  }

// ///加载网络图片
// Future<ui.Image> loadingNetImage(String path) async {
//   final data = await NetworkAssetBundle(Uri.parse(path)).load(path);
//   final bytes = data.buffer.asUint8List();
//   final image = await decodeImageFromList(bytes);
//   return image;
// }
}
