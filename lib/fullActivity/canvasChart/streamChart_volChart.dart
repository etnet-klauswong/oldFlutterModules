import 'dart:ui';

import 'package:flutter/material.dart';

Canvas streamChart_volChartPainter({
  Color gainColor = Colors.green,
  Color lossColor = Colors.red,
  @required var spaceBetweenData,
  priceDiff,
  @required Size painterContainerSize,
  @required List<List> tempNestedDataList,
  @required Canvas canvas,
  @required int highVolLimit,
}) {

  if(tempNestedDataList.length == 0){
    return canvas;
  }

  for (int i = 0; i < tempNestedDataList.length; i++) {
    double currentVolHeight =
        (tempNestedDataList[i][5] / highVolLimit) * painterContainerSize.height;

    /// if openedPrice > closedPrice
    if (tempNestedDataList[i][1] >= tempNestedDataList[i][4]) {
      var gainPainter = new Paint()
        ..color = Colors.green
        ..style = PaintingStyle.fill
        ..isAntiAlias = true
        ..strokeWidth = 1;

      /// Gain using gainPainter

      /// UpperHorizontal Line
      ///
      canvas.drawRect(
          new Rect.fromLTRB(
            spaceBetweenData * (i) - (spaceBetweenData / 3) + spaceBetweenData,
            painterContainerSize.height - currentVolHeight,
            spaceBetweenData * (i) + (spaceBetweenData / 3) + spaceBetweenData,
            painterContainerSize.height,
          ),
          gainPainter);
    }

    /// if closedPrice > openedPrice
    else if (tempNestedDataList[i][1] < tempNestedDataList[i][4]) {
      var lossPainter = new Paint()
        ..color = Colors.red
        ..style = PaintingStyle.fill
        ..isAntiAlias = true
        ..strokeWidth = 1;
//        print("Loss");

      canvas.drawRect(
          new Rect.fromLTRB(
            spaceBetweenData * (i) - (spaceBetweenData / 3) + spaceBetweenData,
            painterContainerSize.height - currentVolHeight,
            spaceBetweenData * (i) + (spaceBetweenData / 3) + spaceBetweenData,
            painterContainerSize.height,
          ),
          lossPainter);
    }
  }
  return canvas;
}
