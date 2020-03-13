import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/canvasCharts/chartContainer.dart';

class LineChartPainter extends CustomPainter {
  Paint linePainter;
  final double canvasHeight, canvasWidth;

  // ignore: non_constant_identifier_names
  BuildContext context;

  LineChartPainter({
    this.context,
    this.canvasHeight,
    this.canvasWidth,
    // ignore: non_constant_identifier_names
  }) : super() {
    linePainter = new Paint()
      ..color = Colors.deepPurpleAccent
      ..style = PaintingStyle.stroke
//        ..isAntiAlias = true
      ..strokeWidth = 2;
  }

  Path drawLineChart({Canvas canvas}) {
    Path path = new Path();
    path.moveTo(0 + spaceOfData,
        ((highPrice - closePriceList[0]) / priceDiff) * canvasHeight * 0.885);
    for (int i = 0; i < closePriceList.length; i++) {
      path.lineTo(spaceOfData * (i) + spaceOfData,
          ((highPrice - closePriceList[i]) / priceDiff) * canvasHeight * 0.885);
    }
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(drawLineChart(canvas: canvas), linePainter);
  }

  @override
  bool shouldRepaint(LineChartPainter oldDelegate) => true;
//      oldDelegate.drawPointOffset != drawPointOffset;

}
