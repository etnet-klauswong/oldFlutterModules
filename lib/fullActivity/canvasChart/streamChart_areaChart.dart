import 'dart:ui';

import 'package:flutter/material.dart';

Canvas streamChart_areaChartPainter({
  Color lineColor = Colors.blueAccent,
  Color areaColor = Colors.grey,
  Color lowPriceColor = Colors.red,
  Color highPriceColor = Colors.green,
  @required var spaceBetweenData,
  priceDiff,
  @required double highPriceLimit,
  @required Size painterContainerSize,
  @required List<List> tempNestedDataList,
  @required Canvas canvas,
  @required double highPrice,
  @required double lowPrice,
  @required bool closePriceTracking,
}) {
  double verifyNumOfPriceText_getJengOffest({String closePrice}){
    if(closePrice.length == 4){return 20.0;}
    else if(closePrice.length == 5){return 25.0;}
    else if(closePrice.length == 6){return 35.0;}
    else if(closePrice.length == 7){return 40.0;}
    else if(closePrice.length == 8){return 50.0;}
    else if(closePrice.length == 9){return 60.0;}
  }

  Paint linePainter = new Paint()
    ..color = lineColor
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeWidth = 2;
  Paint areaPainter = new Paint()
    ..color = areaColor.withOpacity(0.5)
    ..style = PaintingStyle.fill
    ..isAntiAlias = true
    ..strokeWidth = 2;
  Paint ovalPainter = new Paint()
    ..color = lineColor.withOpacity(0.5)
    ..style = PaintingStyle.fill
    ..isAntiAlias = true
    ..strokeWidth = 2;
  Paint lowPricePainter = new Paint()
    ..color = lowPriceColor
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true
    ..strokeWidth = 2;
  Paint highPricePainter = new Paint()
    ..color = highPriceColor
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

  Path drawAreaChart({Canvas canvas}) {
    Path path = new Path();
    path.moveTo(0 + spaceBetweenData, painterContainerSize.height);
    path.lineTo(
        0 + spaceBetweenData,
        ((highPriceLimit - tempNestedDataList[0][4]) / priceDiff) *
            painterContainerSize.height);
    for (int i = 0; i < tempNestedDataList.length; i++) {
      path.lineTo(
          spaceBetweenData * (i) + spaceBetweenData,
          ((highPriceLimit - tempNestedDataList[i][4]) / priceDiff) *
              painterContainerSize.height);
    }
    path.lineTo(
        spaceBetweenData * (tempNestedDataList.length - 1) + spaceBetweenData,
        painterContainerSize.height);
    path.lineTo(0, painterContainerSize.height);
    return path;
  }

//  Path drawLastPoint({Canvas canvas}) {
//    Path path = new Path();
//    path.moveTo(0, ((highPriceLimit - tempNestedDataList[tempNestedDataList.length-1][4])/priceDiff*painterContainerSize.height));
//    path.lineTo(
//        painterContainerSize.width, (highPriceLimit - tempNestedDataList[tempNestedDataList.length-1][4])/priceDiff*painterContainerSize.height);
//    return path;
//  }


  // TODO: if there are not data exist in the ChartModel -> directly return canvas
  if(tempNestedDataList.length == 0 ){
    return canvas;
  }
  canvas.drawPath(drawAreaChart(canvas: canvas), areaPainter);
//  canvas.drawPath(drawLastPoint(canvas: canvas), linePainter);
  canvas.drawPath(drawLineChart(canvas: canvas), linePainter);

//  // TODO: For a highPrice
//  canvas.drawLine(new Offset(0, ((highPriceLimit - highPrice)/priceDiff*painterContainerSize.height)), new Offset(painterContainerSize.width, (highPriceLimit - highPrice)/priceDiff*painterContainerSize.height), highPricePainter);
//
//  // TODO: For a lowPrice
//  canvas.drawLine(new Offset(0, ((highPriceLimit - lowPrice)/priceDiff*painterContainerSize.height)), new Offset(painterContainerSize.width, (highPriceLimit - lowPrice)/priceDiff*painterContainerSize.height), lowPricePainter);




  if(closePriceTracking){
    canvas.drawLine(new Offset(0, ((highPriceLimit - tempNestedDataList[tempNestedDataList.length-1][4])/priceDiff*painterContainerSize.height)), new Offset(painterContainerSize.width/100, (highPriceLimit - tempNestedDataList[tempNestedDataList.length-1][4])/priceDiff*painterContainerSize.height), linePainter);

    canvas.drawRRect(  new RRect.fromLTRBR(painterContainerSize.width/100, ((highPriceLimit - tempNestedDataList[tempNestedDataList.length-1][4])/priceDiff*painterContainerSize.height) - 20, painterContainerSize.width /8, ((highPriceLimit - tempNestedDataList[tempNestedDataList.length-1][4])/priceDiff*painterContainerSize.height) + 20, Radius.circular(20.0)), ovalPainter);
//  canvas.drawRect(  new Rect.fromPoints(
//    Offset(15, ((highPriceLimit - tempNestedDataList[tempNestedDataList.length-1][4])/priceDiff*painterContainerSize.height) - 30),
//    Offset(painterContainerSize.width /6, ((highPriceLimit - tempNestedDataList[tempNestedDataList.length-1][4])/priceDiff*painterContainerSize.height) + 30),
//  ), ovalPainter);
    canvas.drawLine(new Offset(painterContainerSize.width /8, ((highPriceLimit - tempNestedDataList[tempNestedDataList.length-1][4])/priceDiff*painterContainerSize.height)), new Offset(painterContainerSize.width, (highPriceLimit - tempNestedDataList[tempNestedDataList.length-1][4])/priceDiff*painterContainerSize.height), linePainter);
    final pricePainter = TextPainter(
      text: new TextSpan(
        text: tempNestedDataList[tempNestedDataList.length-1][4].toString(),
//      text: tempNestedDataList[tempNestedDataList.length-1][4].toString(),
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      textAlign: TextAlign.left,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );
    // Number Of the text handle the OffsetPoint of the  //Todo: if 9text->60; 8text-> 50; 7text-> 40; 6text-> 35; 5text-> 25; 4text-> 20
    pricePainter.layout(maxWidth: 100.0, minWidth: 70.0);
    Offset pricePainterPos = new Offset((((painterContainerSize.width /8) - verifyNumOfPriceText_getJengOffest(closePrice: tempNestedDataList[tempNestedDataList.length-1][4].toString()))/2), ((highPriceLimit - tempNestedDataList[tempNestedDataList.length-1][4])/priceDiff*painterContainerSize.height) - 7); // Y-axis adjustment equal to priceTextSSize/2
    pricePainter.paint(canvas, pricePainterPos);
//  print("run.0");
  }





  return canvas;
}
