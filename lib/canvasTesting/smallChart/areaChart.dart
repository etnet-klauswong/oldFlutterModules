import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/canvasTesting/smallChart/small_chartContainer.dart';

Canvas areaChartPainter({
  Paint areaPainter,
  Paint linePainter,
  Paint minLinePainter,
  @required var priceDiff,
  @required Canvas canvas,
  @required var spaceOfData,
  @required List<List> selectedDate,
  @required double highPrice,
  @required double lowPrice,
  @required double canvasHeight,
  @required double canvasWidth,
}) {
  linePainter = new Paint()
    ..color = Colors.lightBlueAccent.withOpacity(0.8)
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeWidth = 2;
  areaPainter = new Paint()
    ..color = Colors.grey.withOpacity(0.65)
    ..style = PaintingStyle.fill
    ..isAntiAlias = true
    ..strokeWidth = 1;
  minLinePainter = new Paint()
    ..color = Colors.red.withOpacity(1)
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeWidth = 1.5;

  Path drawLineChart({Canvas canvas}) {
    Path path = new Path();
    path.moveTo(0 + spaceOfData * 2,
        ((highPrice - closePriceList[0]) / priceDiff) * canvasHeight * 0.929);
    for (int i = 0; i < closePriceList.length; i++) {
      path.lineTo(spaceOfData * (i) + spaceOfData * 2,
          ((highPrice - closePriceList[i]) / priceDiff) * canvasHeight * 0.929);
    }
    return path;
  }

  Path drawMinLine({Canvas canvas}) {
    Path path = new Path();
    path.moveTo(0, canvasHeight * 0.929);
    path.lineTo(canvasWidth, canvasHeight * 0.929);
    return path;
  }

  Path drawAreaChart({Canvas canvas}) {
    Path path = new Path();
    path.moveTo(0 + spaceOfData * 2, canvasHeight * 0.929);
    path.lineTo(0 + spaceOfData * 2,
        ((highPrice - closePriceList[0]) / priceDiff) * canvasHeight * 0.929);
    for (int i = 0; i < closePriceList.length; i++) {
      path.lineTo(spaceOfData * (i) + spaceOfData * 2,
          ((highPrice - closePriceList[i]) / priceDiff) * canvasHeight * 0.929);
    }
    path.lineTo(spaceOfData * (closePriceList.length - 1) + spaceOfData * 2,
        canvasHeight * 0.929);
    path.lineTo(0, canvasHeight * 0.929);
    return path;
  }

  canvas.drawPath(drawAreaChart(canvas: canvas), areaPainter);
  canvas.drawPath(drawLineChart(canvas: canvas), linePainter);
  canvas.drawPath(drawMinLine(canvas: canvas), minLinePainter);

  return canvas;
}
