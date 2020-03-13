import 'dart:ui';

import 'package:flutter/material.dart';

Canvas streamChart_lineChartPainter({
  Color lineColor = Colors.blueAccent,
  @required var spaceBetweenData,
  priceDiff,
  @required double highPriceLimit,
  @required Size painterContainerSize,
  @required List<List> tempNestedDataList,
  @required Canvas canvas,
}) {
  Paint linePainter = new Paint()
    ..color = lineColor
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeWidth = 2;

  Path drawLineChart({Canvas canvas}) {
    Path path = new Path();
    path.moveTo(
        0 + spaceBetweenData,
        ((highPriceLimit - tempNestedDataList[0][4]) / priceDiff) *
            painterContainerSize.height);
    for (int i = 0; i < tempNestedDataList.length; i++) {
      path.lineTo(
          spaceBetweenData * (i) + spaceBetweenData,
          ((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
              painterContainerSize.height);
    }
    return path;
  }
  if (tempNestedDataList.length == 0){
    return canvas;
  }

  canvas.drawPath(drawLineChart(canvas: canvas), linePainter);
  return canvas;
}
