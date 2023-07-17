import 'package:bilibili_getx/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:ui' as ui;

///进度条绘制
class ProgressBarPainter extends CustomPainter {
  ProgressBarPainter({
    this.assetsImage,
    required this.barHeight,
    required this.handleHeight,
    required this.drawShadow,
    required this.videoPlayerValue,
  });

  final double barHeight;
  final double handleHeight;
  final bool drawShadow;
  final VideoPlayerValue videoPlayerValue;

  final Paint playedPaint = Paint()..color = HYAppTheme.norMainThemeColors;
  final Paint bufferedPaint = Paint()
    ..color = const Color.fromRGBO(255, 255, 255, 1);
  final Paint handlePaint = Paint()
    ..color = const Color.fromRGBO(255, 255, 255, .6);
  final Paint backgroundPaint = Paint()
    ..color = const Color.fromRGBO(255, 255, 255, .3);

  final ui.Image? assetsImage;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final baseOffset = size.height / 2 - barHeight / 2;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(0.0, baseOffset),
          Offset(size.width, baseOffset + barHeight),
        ),
        const Radius.circular(4.0),
      ),
      backgroundPaint,
    );
    if (!videoPlayerValue.isInitialized) {
      return;
    }

    ///播放时长占比
    final double playedPartPercent = videoPlayerValue.position.inMilliseconds /
        videoPlayerValue.duration.inMilliseconds;

    ///播放的长度
    final double playedPart =
        playedPartPercent > 1 ? size.width : playedPartPercent * size.width;
    for (final DurationRange range in videoPlayerValue.buffered) {
      final double start =
          range.startFraction(videoPlayerValue.duration) * size.width;
      final double end =
          range.endFraction(videoPlayerValue.duration) * size.width;

      ///视频缓存进度条
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromPoints(
            Offset(start, baseOffset),
            Offset(end, baseOffset + barHeight),
          ),
          const Radius.circular(4.0),
        ),
        bufferedPaint,
      );
    }

    ///视频播放的进度条
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromPoints(
          Offset(0.0, baseOffset),
          Offset(playedPart, baseOffset + barHeight),
        ),
        const Radius.circular(4.0),
      ),
      playedPaint,
    );

    if (drawShadow) {
      final Path shadowPath = Path()
        ..addOval(
          Rect.fromCircle(
            center: Offset(playedPart, baseOffset + barHeight / 2),
            radius: handleHeight,
          ),
        );

      canvas.drawShadow(shadowPath, Colors.black, 0.2, false);
    }

    if (assetsImage != null) {
      canvas.drawImage(
          assetsImage!,
          Offset(playedPart - barHeight * 2, baseOffset - barHeight * 1.5),
          handlePaint);
    }
    // canvas.drawCircle(Offset(playedPart, baseOffset + barHeight / 2),
    //     handleHeight, colors.handlePaint);
  }
}
