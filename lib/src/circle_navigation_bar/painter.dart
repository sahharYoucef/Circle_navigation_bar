import 'package:flutter/material.dart';
import 'dart:math';

class CirclesPainter extends CustomPainter {
  final Animation<double> _animation;
  final List<Color> colors;

  CirclesPainter(this._animation, {this.colors});

  @override
  void paint(Canvas canvas, Size size) {
    Paint circlePaint = Paint();
    canvas.drawShadow(
        Path()
          ..addArc(
            Rect.fromCenter(
                center: Offset(size.width / 2, size.height / 2),
                height: size.height + 10,
                width: size.width + 10),
            pi * _animation.value,
            pi,
          ),
        Colors.black45,
        3.0,
        true);
    for (int i = 0; i < colors.length; i++) {
      canvas.drawArc(
          Rect.fromCenter(
              center: Offset(size.width / 2, size.height / 2),
              height: size.height,
              width: size.width),
          pi * _animation.value * (1 + (2 - i) * 0.2),
          pi,
          true,
          circlePaint..color = colors[i]);
    }
  }

  @override
  bool shouldRepaint(CirclesPainter oldDelegate) => true;
}

class HexagonePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path()
      ..addPolygon([
        Offset(size.width * 0.5, 0.0),
        Offset(size.width * 0.0669875, size.height * 0.25),
        Offset(size.width * 0.0669875, size.height * 0.75),
        Offset(size.width * 0.5, size.height),
        Offset(size.width * 0.9330125, size.height * 0.75),
        Offset(size.width * 0.9330125, size.height * 0.25),
      ], true);

    Paint hexagonPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10
      ..strokeJoin = StrokeJoin.round;

    canvas.drawShadow(path, Colors.black45, 10, true);
    canvas.drawPath(path, hexagonPaint);
    canvas.drawPath(path, hexagonPaint..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(HexagonePainter oldDelegate) => true;
}
