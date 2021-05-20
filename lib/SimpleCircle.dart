import 'dart:math';

import 'package:flutter/material.dart';

class SimpleCircle extends CustomPainter {
  bool isOn;
  SimpleCircle(this.isOn);

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  @override
  void paint(Canvas canvas, Size size) {

    Paint outerCircle = Paint()
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    Paint arc = Paint()
      ..strokeWidth = 5
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;


    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2) - 14;
    canvas.drawCircle(center, radius, outerCircle);

    double angle = 2 * pi ;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        isOn ? angle:0, false, arc);
  }
}