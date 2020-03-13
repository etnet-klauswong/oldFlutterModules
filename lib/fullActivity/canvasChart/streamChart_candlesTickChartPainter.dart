import 'dart:ui';
//var spaceBetweenData = (size.width.truncate() / ((oneSecDataSet.length + 2)));

import 'package:flutter/material.dart';

Canvas streamChart_candlesTickChartPainter({
  Color gainColor = Colors.green,
  Color lossColor = Colors.red,
  @required var spaceBetweenData,
  priceDiff,
  @required double highPriceLimit,
  @required Size painterContainerSize,
  @required List<List> tempNestedDataList,
  @required Canvas canvas,
  @required double painterWidth,
}) {
  // TODO: Version-2.0.0
  if(tempNestedDataList.length == 0){
    return canvas;
  }
  for (int i = 0; i < tempNestedDataList.length; i++) {
    /// if openedPrice > closedPrice (dataHandlerHelper.getBackHandledDataList[i][1] > dataHandlerHelper.getBackHandledDataList[i][4])
    if (tempNestedDataList[i][1] >= tempNestedDataList[i][4]) {
//      log("Gain"); // TODO: Used to do the checking - packages(dart: 'dart:developer')
      Paint gainPainter = new Paint()
        ..color = Colors.green
        ..style = PaintingStyle.stroke
        ..isAntiAlias = true
        ..strokeWidth = painterWidth;

      /// Gain using gainPainter
      canvas.drawLine(
          new Offset(
              spaceBetweenData * (i) + spaceBetweenData,
              ((highPriceLimit - tempNestedDataList[i][2]) / priceDiff) *
                  painterContainerSize.height),

          /// Highest Price
          new Offset(
              spaceBetweenData * (i) + spaceBetweenData,
              ((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
                  painterContainerSize.height),

          /// Open Price
          gainPainter);

      canvas.drawRect(
          new Rect.fromLTRB(
            spaceBetweenData * (i) -
                (spaceBetweenData / 3) +
                spaceBetweenData,
            ((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
                painterContainerSize.height,
            spaceBetweenData * (i) +
                (spaceBetweenData / 3) +
                spaceBetweenData,
            ((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
                painterContainerSize.height,
          ),
          gainPainter);

      canvas.drawLine(
          new Offset(
              spaceBetweenData * (i) + spaceBetweenData,
              ((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
                  painterContainerSize.height),

          /// Close Price
          new Offset(
              spaceBetweenData * (i) + spaceBetweenData,
              ((highPriceLimit - tempNestedDataList[i][3]) / priceDiff) *
                  painterContainerSize.height),

          /// Low Price
          gainPainter);
    } else if (tempNestedDataList[i][1] < tempNestedDataList[i][4]) {
//      log("Loss");

      Paint lossPainter = new Paint()
        ..color = Colors.redAccent
        ..style = PaintingStyle.fill
        ..isAntiAlias = true
        ..strokeWidth = painterWidth;

      /// Loss using lossPainter
      canvas.drawLine(
          new Offset(
              spaceBetweenData * (i) + spaceBetweenData,
              ((highPriceLimit - tempNestedDataList[i][2]) / priceDiff) *
                  painterContainerSize.height),

          /// Highest Price
          new Offset(
              spaceBetweenData * (i) + spaceBetweenData,
              ((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
                  painterContainerSize.height),

          /// Close Price
          lossPainter);

      canvas.drawRect(
          new Rect.fromLTRB(
            spaceBetweenData * (i) -
                (spaceBetweenData / 3) +
                spaceBetweenData,
            ((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
                painterContainerSize.height,
            spaceBetweenData * (i) +
                (spaceBetweenData / 3) +
                spaceBetweenData,
            ((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
                painterContainerSize.height,
          ),
          lossPainter);

      canvas.drawLine(
          new Offset(
              spaceBetweenData * (i) + spaceBetweenData,
              ((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
                  painterContainerSize.height),

          /// Open Price
          new Offset(
              spaceBetweenData * (i) + spaceBetweenData,
              ((highPriceLimit - tempNestedDataList[i][3]) / priceDiff) *
                  painterContainerSize.height),

          /// Low Price
          lossPainter);
    }
  }
  return canvas;
}

// TODO: unfilled CandlesTickChart version-1.0.0
//for (int i = 0; i < tempNestedDataList.length; i++) {
///// if openedPrice > closedPrice (dataHandlerHelper.getBackHandledDataList[i][1] > dataHandlerHelper.getBackHandledDataList[i][4])
//if (tempNestedDataList[i][1] >= tempNestedDataList[i][4]) {
////      log("Gain"); // TODO: Used to do the checking - packages(dart: 'dart:developer')
//Paint gainPainter = new Paint()
//..color = Colors.green
//..style = PaintingStyle.stroke
//..isAntiAlias = true
//..strokeWidth = 1;
//
///// Gain using gainPainter
//canvas.drawLine(
//new Offset(
//spaceBetweenData * (i) + spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][2]) / priceDiff) *
//painterContainerSize.height),
//
///// Highest Price
//new Offset(
//spaceBetweenData * (i) + spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
//painterContainerSize.height),
//
///// Open Price
//gainPainter);
//
//canvas.drawLine(
//new Offset(
//spaceBetweenData * (i) -
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
//painterContainerSize.height),
//
///// Open Price
//new Offset(
//spaceBetweenData * (i) +
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
//painterContainerSize.height),
//
///// Open Price
//gainPainter);
//
//canvas.drawLine(
//new Offset(
//spaceBetweenData * (i) -
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
//painterContainerSize.height),
//
///// Open to Close (Left)
//new Offset(
//spaceBetweenData * (i) -
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
//painterContainerSize.height),
//
///// Open to Close (Left)
//gainPainter);
//
//canvas.drawLine(
//new Offset(
//spaceBetweenData * (i) +
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
//painterContainerSize.height),
//
///// Open to Close (Right)
//new Offset(
//spaceBetweenData * (i) +
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
//painterContainerSize.height),
//
///// Open to Close (Right)
//gainPainter);
//
//canvas.drawLine(
//new Offset(
//spaceBetweenData * (i) -
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
//painterContainerSize.height),
//
///// Close Price
//new Offset(
//spaceBetweenData * (i) +
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
//painterContainerSize.height),
//
///// Close Price
//gainPainter);
////
//canvas.drawLine(
//new Offset(
//spaceBetweenData * (i) + spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
//painterContainerSize.height),
//
///// Close Price
//new Offset(
//spaceBetweenData * (i) + spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][3]) / priceDiff) *
//painterContainerSize.height),
//
///// Low Price
//gainPainter);
//} else if (tempNestedDataList[i][1] < tempNestedDataList[i][4]) {
////      log("Loss");
//
//Paint lossPainter = new Paint()
//..color = Colors.redAccent
//..style = PaintingStyle.stroke
//..isAntiAlias = true
//..strokeWidth = 1;
//
///// Loss using lossPainter
//canvas.drawLine(
//new Offset(
//spaceBetweenData * (i) + spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][2]) / priceDiff) *
//painterContainerSize.height),
//
///// Highest Price
//new Offset(
//spaceBetweenData * (i) + spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
//painterContainerSize.height),
//
///// Close Price
//lossPainter);
//canvas.drawLine(
//new Offset(
//spaceBetweenData * (i) -
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
//painterContainerSize.height),
//
///// Close Price
//new Offset(
//spaceBetweenData * (i) +
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
//painterContainerSize.height),
//
///// Close Price
//lossPainter);
//canvas.drawLine(
//new Offset(
//spaceBetweenData * (i) -
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
//painterContainerSize.height),
//
///// Close to Open (Left)
//new Offset(
//spaceBetweenData * (i) -
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
//painterContainerSize.height),
//
///// Close to Open (Left)
//lossPainter);
//canvas.drawLine(
//new Offset(
//spaceBetweenData * (i) +
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
//painterContainerSize.height),
//
///// Close to Open (Right)
//new Offset(
//spaceBetweenData * (i) +
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
//painterContainerSize.height),
//
///// Close to Open (Right)
//lossPainter);
//canvas.drawLine(
//new Offset(
//spaceBetweenData * (i) -
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
//painterContainerSize.height),
//
///// Open Price
//new Offset(
//spaceBetweenData * (i) +
//(spaceBetweenData / 3) +
//spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
//painterContainerSize.height),
//
///// Open Price
//lossPainter);
//canvas.drawLine(
//new Offset(
//spaceBetweenData * (i) + spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][1]) / priceDiff) *
//painterContainerSize.height),
//
///// Open Price
//new Offset(
//spaceBetweenData * (i) + spaceBetweenData * 2,
//((highPriceLimit - tempNestedDataList[i][3]) / priceDiff) *
//painterContainerSize.height),
//
///// Low Price
//lossPainter);
//}
//}
