import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StampPaper(),
      ),
    );
  }
}

class StampPaper extends StatefulWidget {
  const StampPaper({super.key});

  @override
  State<StampPaper> createState() => _StampPaperState();
}

class _StampPaperState extends State<StampPaper>
    with SingleTickerProviderStateMixin {
  final StampData stampData = StampData();
  int gridCount = 3;
  int containsIndex = -1;
  late AnimationController animationController;
  late Tween<double> doubleTween = Tween(begin: 1, end: 0.9);
  late Animation<double> animation;
  late double radius;
  GameState gameState = GameState.doing;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = doubleTween.animate(animationController)
      ..addListener(() {
        if (animation.value == 0.9) {
          animationController.reverse();
        }
        stampData.animateAt(
          containsIndex,
          animation.value * radius,
        );
      });
    super.initState();
  }

  bool get contains => containsIndex != -1;

  bool get gameOver => gameState != GameState.doing;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.shortestSide * 0.8;
    radius = width / 2 / gridCount * 0.618;
    int checkZone(Offset src) {
      for (int i = 0; i < stampData.stamps.length; i++) {
        Rect zone = Rect.fromCircle(
            center: stampData.stamps[i].center, radius: width / 2 / gridCount);
        if (zone.contains(src)) {
          return i;
        }
      }
      return -1;
    }

    return GestureDetector(
      onDoubleTap: () {
        if (!gameOver && stampData.stamps.length < 9) return;
        stampData.stamps.clear();
        gameState = GameState.doing;
      },
      onTapDown: (detail) {
        if (gameOver) return;
        containsIndex = checkZone(detail.localPosition);
        if (contains) {
          animationController.forward(from: 0);
        } else {
          stampData.push(
            Stamp(
              center: detail.localPosition,
              radius: radius,
              color:
                  stampData.stamps.length % 2 == 0 ? Colors.red : Colors.blue,
            ),
          );
        }
      },
      onTapUp: (detail) {
        if (contains | gameOver) {
          return;
        }
        gameState = checkWin(width / gridCount);
        if (gameState == GameState.redWin) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("红旗获胜"),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (gameState == GameState.blueWin) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("蓝旗获胜"),
              backgroundColor: Colors.blue,
            ),
          );
        }
      },
      onTapCancel: () {
        if (contains) return;
        stampData.removeLast();
      },
      child: SizedBox(
        child: CustomPaint(
          size: Size(width, width),
          foregroundPainter: StampPainter(stampData),
          painter: BackGroundPainter(),
        ),
      ),
    );
  }

  GameState checkWin(double length) {
    bool redWin = _checkWithByColor(length, Colors.red);
    if (redWin) {
      return GameState.redWin;
    }
    bool blueWin = _checkWithByColor(length, Colors.blue);
    if (blueWin) {
      return GameState.blueWin;
    }
    return GameState.doing;
  }

  bool _checkWithByColor(double length, Color color) {
    List<Offset> red = stampData.stamps
        .where((element) => element.color == color)
        .map((e) => e.center)
        .toList();
    List<Point<int>> redPoints =
        red.map((e) => Point(e.dx ~/ length, e.dy ~/ length)).toList();
    return _checkWinInline(redPoints, 3);
  }

  bool _checkWinInline(List<Point<int>> points, int max) {
    if (points.length < max) return false;
    for (int i = 0; i < points.length; i++) {
      int x = points[i].x;
      int y = points[i].y;
      if (_check(x, y, points, CheckModel.horizontal, max)) {
        return true;
      } else if (_check(x, y, points, CheckModel.vertical, max)) {
        return true;
      } else if (_check(x, y, points, CheckModel.leftDiagonal, max)) {
        return true;
      } else if (_check(x, y, points, CheckModel.rightDiagonal, max)) {
        return true;
      }
    }
    return false;
  }

  bool _check(
      int x, int y, List<Point> points, CheckModel checkModel, int max) {
    int count = 1;
    Point checkPoint;
    for (int i = 1; i < max; i++) {
      switch (checkModel) {
        case CheckModel.horizontal:
          checkPoint = Point(x + i, y);
          break;
        case CheckModel.vertical:
          checkPoint = Point(x, y + i);
          break;
        case CheckModel.leftDiagonal:
          checkPoint = Point(x + i, y + i);
          break;
        case CheckModel.rightDiagonal:
          checkPoint = Point(x + i, y - i);
          break;
      }
      for (Point point in points) {
        if (point.x == checkPoint.x && point.y == checkPoint.y) {
          count++;
          break;
        }
      }
    }
    if (count == max) {
      return true;
    } else {
      return false;
    }
  }
}

class Point<T> {
  T x;
  T y;

  Point(this.x, this.y);
}

class Stamp {
  Color color;
  Offset center;
  double radius;
  Path? _path;

  Stamp({
    this.color = Colors.blue,
    required this.center,
    required this.radius,
  });

  Path? get path {
    if (_path == null) {
      _path = Path();
      double rad = pi / 6;
      _path!.moveTo(center.dx, center.dy);
      _path!.relativeMoveTo(radius * cos(rad), -radius * sin(rad));
      _path!.relativeLineTo(-2 * radius * cos(rad), 0);
      _path!.relativeLineTo(radius * cos(rad), radius + radius * sin(rad));
      _path!.relativeLineTo(radius * cos(rad), -(radius + radius * sin(rad)));
      _path!.moveTo(center.dx, center.dy);
      _path!.relativeMoveTo(0, -radius);
      _path!.relativeLineTo(-cos(rad) * radius, sin(rad) * radius + radius);
      _path!.relativeLineTo(2 * cos(rad) * radius, 0);
      _path!.relativeLineTo(-cos(rad) * radius, -2 * cos(rad) * radius);
      return _path;
    } else {
      return _path;
    }
  }

  void rePath() {
    _path = null;
    _path = path;
  }
}

class StampData extends ChangeNotifier {
  final List<Stamp> stamps = [];

  void push(Stamp stamp) {
    stamps.add(stamp);
    notifyListeners();
  }

  void removeLast() {
    stamps.removeLast();
    notifyListeners();
  }

  void clear() {
    stamps.clear();
    notifyListeners();
  }

  void animateAt(int index, double radius) {
    stamps[index].radius = radius;
    stamps[index].rePath();
    notifyListeners();
  }
}

class StampPainter extends CustomPainter {
  final StampData stampData;
  final int count;
  final Paint _paint = Paint();

  StampPainter(this.stampData, {this.count = 3}) : super(repaint: stampData);

  @override
  void paint(Canvas canvas, Size size) {
    for (var element in stampData.stamps) {
      double radius = element.radius;
      double length = size.width / count;
      int x = element.center.dx ~/ (size.width / count);
      int y = element.center.dy ~/ (size.width / count);
      Offset center = Offset(length * x + length / 2, length * y + length / 2);
      element.center = center;

      canvas.drawCircle(
        element.center,
        radius + 5,
        _paint
          ..color = element.color
          ..strokeWidth = 2
          ..style = PaintingStyle.fill,
      );
      canvas.drawPath(
        element.path!,
        _paint
          ..color = Colors.white
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke,
      );

      canvas.drawCircle(
        element.center,
        element.radius + 2,
        _paint
          ..style = PaintingStyle.stroke
          ..color = Colors.white
          ..strokeWidth = 2,
      );
    }
  }

  @override
  bool shouldRepaint(covariant StampPainter oldDelegate) {
    return stampData != oldDelegate.stampData || count != oldDelegate.count;
  }
}

class BackGroundPainter extends CustomPainter {
  BackGroundPainter({this.count = 3});

  static const List<Color> colors = [
    Color(0xFFF60C0C),
    Color(0xFFF3B913),
    Color(0xFFE7F716),
    Color(0xFF3DF30B),
    Color(0xFF0DF6EF),
    Color(0xFF0829FB),
    Color(0xFFB709F4),
  ];
  static const List<double> pos = [
    1.0 / 7,
    2.0 / 7,
    3.0 / 7,
    4.0 / 7,
    5.0 / 7,
    6.0 / 7,
    1.0
  ];
  final int count;

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    final Paint _paintPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..shader = ui.Gradient.sweep(
        Offset(size.width / 2, size.height / 2),
        colors,
        pos,
        TileMode.mirror,
        pi / 2,
        pi,
      );
    Rect zone = Offset.zero & size;
    canvas.clipRect(zone);
    canvas.save();
    for (int i = 0; i < count - 1; i++) {
      canvas.translate(0, size.height / count);
      canvas.drawLine(Offset.zero, Offset(size.width, 0), _paintPaint);
    }
    canvas.restore();
    canvas.save();
    for (int i = 0; i < count - 1; i++) {
      canvas.translate(size.width / count, 0);
      canvas.drawLine(Offset.zero, Offset(0, size.height), _paintPaint);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant BackGroundPainter oldDelegate) {
    return count != oldDelegate.count;
  }
}

enum GameState {
  doing,
  redWin,
  blueWin,
}

enum CheckModel {
  horizontal,
  vertical,
  leftDiagonal,
  rightDiagonal,
}
