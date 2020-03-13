import 'dart:math';

import 'package:flutter/material.dart';

class PieChart extends CustomPainter {
  Paint whiteArc, blueArc, accentBlueArc, redArc, prinkArc, white;

  BuildContext context;
  PieChart() {
    white = new Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = 25;
    blueArc = new Paint()
      ..color = Colors.blue.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.butt
      ..strokeWidth = 25;
    accentBlueArc = Paint()
      ..strokeWidth = 25
      ..isAntiAlias = true
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;
    redArc = Paint()
      ..strokeWidth = 25
      ..color = Colors.red
      ..isAntiAlias = true
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;
    whiteArc = Paint()
      ..strokeWidth = 25
      ..isAntiAlias = true
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.butt;
  }

  @override
  void paint(Canvas canvas, Size size) {
//    final pointMode = PointMode.points;

    // TODO: MaxHeight - Current Price
    final pointPriceData = [0, 15, 20, 26, 55, 79, 58, 65, 48, 56];
    List pointPriceList = [];
//    for(int i = 0; i <= pointPriceList.length; i++){
//
//    }

    // TODO: implement paint
    double radius = min(size.width / 2, size.height / 2) - 100;
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        0,
        ((2 * pi) / 100) * 36,
        false,
        redArc);
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        ((2 * pi) / 100) * 38,
        ((2 * pi) / 100) * 19,
        false,
        whiteArc);

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        ((2 * pi) / 100) * 59,
        ((2 * pi) / 100) * 11,
        false,
        blueArc);
    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.width / 2, size.height / 2), radius: radius),
        ((2 * pi) / 100) * 72,
        ((2 * pi) / 100) * 26,
        false,
        accentBlueArc);

//    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 0,
//        -(pi * 2) / 4, false, redArc);
//    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 0,
//        -(pi * 2) / 4, false, redArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
