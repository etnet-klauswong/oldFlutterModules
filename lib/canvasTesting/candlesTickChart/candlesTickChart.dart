import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' as prefix0;

class CandlesTickChart {
  Paint gainPainter, lossPainter;
  final double priceDiff;
  final double spaceOfData;
  final Color gainColor, lossColor;
  final List<List> selectedDate;
  final double canvasHeight, canvasWidth;
  final double highPrice, lowPrice;
  CandlesTickChart({
    @required this.selectedDate,
    @required this.priceDiff,
    @required this.spaceOfData,
    this.canvasHeight,
    this.canvasWidth,
    this.highPrice,
    this.lowPrice,
    this.gainColor = prefix0.Colors.green,
    this.lossColor = prefix0.Colors.red,
  });

  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < selectedDate.length; i++) {
      /// if openedPrice > closedPrice
      if (selectedDate[i][5] >= selectedDate[i][8]) {
        gainPainter = new Paint()
          ..color = gainColor
          ..style = PaintingStyle.fill
          ..isAntiAlias = true
          ..strokeWidth = 1;

        /// Gain using gainPainter
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][6]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Highest Price
            new Offset(
                spaceOfData * (i) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open Price
            gainPainter);

        canvas.drawLine(
            new Offset(
                spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open Price
            new Offset(
                spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open Price
            gainPainter);

        canvas.drawLine(
            new Offset(
                spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open to Close (Left)
            new Offset(
                spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open to Close (Left)
            gainPainter);

        canvas.drawLine(
            new Offset(
                spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open to Close (Right)
            new Offset(
                spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open to Close (Right)
            gainPainter);

        canvas.drawLine(
            new Offset(
                spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close Price
            new Offset(
                spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close Price
            gainPainter);
//
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close Price
            new Offset(
                spaceOfData * (i) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][7]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Low Price
            gainPainter);
      } else if (selectedDate[i][5] < selectedDate[i][8]) {
        lossPainter = new Paint()
          ..color = lossColor
          ..style = PaintingStyle.fill
          ..isAntiAlias = true
          ..strokeWidth = 1;

        /// Loss using lossPainter
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][6]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Highest Price
            new Offset(
                spaceOfData * (i) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close Price
            lossPainter);
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close Price
            new Offset(
                spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close Price
            lossPainter);
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close to Open (Left)
            new Offset(
                spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close to Open (Left)
            lossPainter);
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close to Open (Right)
            new Offset(
                spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close to Open (Right)
            lossPainter);
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) - (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open Price
            new Offset(
                spaceOfData * (i) + (spaceOfData / 2) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open Price
            lossPainter);
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open Price
            new Offset(
                spaceOfData * (i) + spaceOfData * 2,
                ((this.highPrice - selectedDate[i][7]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Low Price
            lossPainter);
      }
    }
  }

//  @override
//  bool shouldRepaint(CandlesTickChart oldDelegate) => true;
}
