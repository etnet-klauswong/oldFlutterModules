import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/canvasCharts/chartContainer.dart';

//AreaChartPainter
class AreaChartPainter extends CustomPainter {
  Paint areaPainter;
  final double canvasHeight, canvasWidth;
  // ignore: non_constant_identifier_names

  BuildContext context;

  AreaChartPainter({
    this.context,
    this.canvasHeight,
    this.canvasWidth,
  }) : super() {
    areaPainter = new Paint()
      ..color = Colors.grey.withOpacity(0.4)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..strokeWidth = 2;
  }

  Path drawAreaChart({Canvas canvas}) {
    Path path = new Path();
    path.moveTo(0 + spaceOfData, canvasHeight * 0.885);
    path.lineTo(0 + spaceOfData,
        ((highPrice - closePriceList[0]) / priceDiff) * canvasHeight * 0.885);
    for (int i = 0; i < closePriceList.length; i++) {
      path.lineTo(spaceOfData * (i) + spaceOfData,
          ((highPrice - closePriceList[i]) / priceDiff) * canvasHeight * 0.885);
    }
    path.lineTo(spaceOfData * (closePriceList.length - 1) + spaceOfData,
        canvasHeight * 0.885);
    path.lineTo(0, canvasHeight * 0.885);
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(drawAreaChart(canvas: canvas), areaPainter);
  }

  @override
  bool shouldRepaint(AreaChartPainter oldDelegate) => true;
//      oldDelegate.drawPointOffset != drawPointOffset;
}
