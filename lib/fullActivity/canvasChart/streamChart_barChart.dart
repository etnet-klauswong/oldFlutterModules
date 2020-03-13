import 'dart:ui';

import 'package:flutter/material.dart';

Canvas streamChart_barChartPainter({
  Color barColor = Colors.deepPurple,
  @required var spaceBetweenData,
  priceDiff,
  @required double highPriceLimit,
  @required Size painterContainerSize,
  @required List<List> tempNestedDataList,
  @required Canvas canvas,
}) {
  Paint barPainter = new Paint()
    ..color = barColor
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeWidth = 2;

  Path drawBarChart({Canvas canvas}) {
    Path path = new Path();
    for (int i = 0; i < tempNestedDataList.length; i++) {
      path.moveTo(
          spaceBetweenData * (i) + spaceBetweenData,
          ((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
              painterContainerSize.height);
      path.lineTo(
          spaceBetweenData * (i) + spaceBetweenData - (spaceBetweenData / 3),
          ((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
              painterContainerSize.height);

      path.moveTo(
          spaceBetweenData * (i) + spaceBetweenData,
          ((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
              painterContainerSize.height);

      path.lineTo(
          spaceBetweenData * (i) + spaceBetweenData + (spaceBetweenData / 3),
          ((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
              painterContainerSize.height);

      path.moveTo(
          spaceBetweenData * (i) + spaceBetweenData,
          ((highPriceLimit - tempNestedDataList[i][2]) / priceDiff) *
              painterContainerSize.height);

      path.lineTo(
          spaceBetweenData * (i) + spaceBetweenData,
          ((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
              painterContainerSize.height);
    }

    return path;
  }
  if(tempNestedDataList.length ==0){
    return canvas;
  }
  canvas.drawPath(drawBarChart(canvas: canvas), barPainter);

  return canvas;
}
