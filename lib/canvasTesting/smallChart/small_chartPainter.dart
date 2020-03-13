import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/canvasTesting/candlesTickChart/candlesTickChart.dart';
import 'package:fluttercompletelibrary/canvasTesting/smallChart/areaChart.dart';
import 'package:fluttercompletelibrary/canvasTesting/smallChart/small_chartBackground.dart';
import 'package:fluttercompletelibrary/canvasTesting/smallChart/small_chartContainer.dart';
import 'package:fluttercompletelibrary/canvasTesting/smallChart/volChart.dart';

class SmallChartPainter extends CustomPainter {
  Paint gridPainter,
      containerPainter,
      chartPainter,
      pieChartPainter,
      gainPainter,
      lossPainter;
  final double canvasHeight, canvasWidth;
  final double highPrice, lowPrice;
  final List<List> selectedDate;
  final String chartType;
  SmallChartPainter(
      {this.canvasHeight,
      this.canvasWidth,
      this.highPrice,
      this.lowPrice,
      this.selectedDate,
      @required this.chartType

      /// chartType: 1.  "candlesTickChart"  2.   "volChart"  3.  "areaChart"   4.  "barChat"
      });

  @override
  void paint(Canvas canvas, Size size) {
    var priceDiff = highPrice - lowPrice;
    var spaceOfData = (canvasWidth / (selectedDate.length + 4));
    // TODO: implement paint

    // TODO: Layout1 = chartBackground
    SmallChartBackground chartBackground = new SmallChartBackground(
//        canvasHeight: size.height,
//        canvasWidth: size.width,
        canvasWidth: canvasWidth,
        canvasHeight: canvasHeight,
        chartBackgroundColor: Colors.black);
    chartBackground.paint(canvas, size);

    // TODO: Layout2 = charts[Could be more than one)
    if (chartType == "candlesTickChart") {
      CandlesTickChart candlesTickChart = new CandlesTickChart(
        selectedDate: selectedDate,
        priceDiff: priceDiff,
        spaceOfData: spaceOfData,
        canvasWidth: canvasWidth,
        canvasHeight: canvasHeight,
        highPrice: highPrice,
        lowPrice: lowPrice,
      );
      candlesTickChart.paint(canvas, size);
    } else if (chartType == "volChart") {
      // TODO: Volume Example
      VolChartPainter(
        highVol: highVol,
        canvas: canvas,
        priceDiff: priceDiff,
        spaceOfData: spaceOfData,
        selectedDate: selectedDate,
        highPrice: highPrice,
        lowPrice: lowPrice,
        canvasWidth: canvasWidth,
        canvasHeight: canvasHeight,
      );
    } else if (chartType == "areaChart") {
      areaChartPainter(
        canvas: canvas,
        priceDiff: priceDiff,
        spaceOfData: spaceOfData,
        selectedDate: selectedDate,
        highPrice: highPrice,
        lowPrice: lowPrice,
        canvasWidth: canvasWidth,
        canvasHeight: canvasHeight,
      );
    }

    // TODO: Canvas Example
//    candlesTickPainter(
//      canvas: canvas,
//      priceDiff: priceDiff,
//      spaceOfData: spaceOfData,
//      selectedDate: selectedDate,
//      highPrice: highPrice,
//      lowPrice: lowPrice,
//      canvasWidth: canvasWidth,
//      canvasHeight: canvasHeight,
//    );
  }

  @override
  bool shouldRepaint(SmallChartPainter oldDelegate) => true;
}
