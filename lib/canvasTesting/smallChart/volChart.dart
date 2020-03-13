import 'dart:ui';

import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Canvas VolChartPainter({
  @required var priceDiff,
  @required Canvas canvas,
  @required var spaceOfData,
  Color gainColor = Colors.green,
  Color lossColor = Colors.red,
  @required List<List> selectedDate,
  @required double highPrice,
  @required double lowPrice,
  @required double canvasHeight,
  @required double canvasWidth,
  @required int highVol,
}) {
  // TODO: Volume

  // TODO: height: canvasHeight * 0.27, -maxVol
  for (int i = 0; i < selectedDate.length; i++) {
    double currentVolHeight = (selectedDate[i][9] / highVol) * canvasHeight;

    /// if openedPrice > closedPrice
    if (selectedDate[i][5] >= selectedDate[i][8]) {
      var gainPainter = new Paint()
        ..color = Colors.green
        ..style = PaintingStyle.fill
        ..isAntiAlias = true
        ..strokeWidth = 1;

      /// Gain using gainPainter

      /// UpperHorizontal Line
      canvas.drawLine(
          new Offset(spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
              ((canvasHeight) - currentVolHeight)),
          new Offset(spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
              ((canvasHeight) - currentVolHeight)),
          gainPainter);

      /// Bottom Line
      canvas.drawLine(
          new Offset(spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
              (canvasHeight)),
          new Offset(spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
              (canvasHeight)),
          gainPainter);

      /// Left Line
      canvas.drawLine(
          new Offset(spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
              (canvasHeight) - currentVolHeight),
          new Offset(spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
              (canvasHeight)),
          gainPainter);

      /// Right Line
      canvas.drawLine(
          new Offset(spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
              (canvasHeight) - currentVolHeight),
          new Offset(spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
              (canvasHeight)),
          gainPainter);
    }

    /// if closedPrice > openedPrice
    else if (selectedDate[i][5] < selectedDate[i][8]) {
      var lossPainter = new Paint()
        ..color = Colors.red
        ..style = PaintingStyle.fill
        ..isAntiAlias = true
        ..strokeWidth = 1;
//        print("Loss");

      /// Loss using lossPainter

      /// UpperHorizontal Line
      canvas.drawLine(
          new Offset(spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
              ((canvasHeight) - currentVolHeight)),
          new Offset(spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
              ((canvasHeight) - currentVolHeight)),
          lossPainter);

      /// Bottom Line
      canvas.drawLine(
          new Offset(spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
              (canvasHeight)),
          new Offset(spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
              (canvasHeight)),
          lossPainter);

      /// Left Line
      canvas.drawLine(
          new Offset(spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
              (canvasHeight) - currentVolHeight),
          new Offset(spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
              (canvasHeight)),
          lossPainter);

      /// Right Line
      canvas.drawLine(
          new Offset(spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
              (canvasHeight) - currentVolHeight),
          new Offset(spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
              (canvasHeight)),
          lossPainter);
    }
  }
  return canvas;
}
