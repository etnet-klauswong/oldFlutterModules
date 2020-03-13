import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/canvasCharts/chartContainer.dart';

//  TODO: openPrice - left; closePrice - right
//AreaChartPainter
class BarChartPainter extends CustomPainter {
  Paint barPainter;
  final double canvasHeight, canvasWidth;
  // ignore: non_constant_identifier_names
  final List<List> selectedDate;
  BuildContext context;

  BarChartPainter({
    this.context,
    this.canvasHeight,
    this.canvasWidth,
    @required this.selectedDate,
  }) : super() {
    barPainter = new Paint()
      ..color = Colors.yellow
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = 2;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < selectedDate.length; i++) {
      canvas.drawLine(
          new Offset(
              spaceOfData * (i) + spaceOfData,
              ((highPrice - selectedDate[i][5]) / priceDiff) *
                  canvasHeight *
                  0.9),

          /// Highest Price
          new Offset(
              spaceOfData * (i) + spaceOfData - 3,
              ((highPrice - selectedDate[i][5]) / priceDiff) *
                  canvasHeight *
                  0.9),

          /// Open Price
          barPainter);

      canvas.drawLine(
          new Offset(
              spaceOfData * (i) + spaceOfData,
              ((highPrice - selectedDate[i][8]) / priceDiff) *
                  canvasHeight *
                  0.9),

          /// Highest Price
          new Offset(
              spaceOfData * (i) + spaceOfData + 3,
              ((highPrice - selectedDate[i][8]) / priceDiff) *
                  canvasHeight *
                  0.9),

          /// Open Price
          barPainter);

      canvas.drawLine(
          new Offset(
              spaceOfData * (i) + spaceOfData,
              ((highPrice - selectedDate[i][6]) / priceDiff) *
                  canvasHeight *
                  0.9),

          /// Highest Price
          new Offset(
              spaceOfData * (i) + spaceOfData,
              ((highPrice - selectedDate[i][8]) / priceDiff) *
                  canvasHeight *
                  0.9),

          /// Open Price
          barPainter);
    }
  }

  @override
  bool shouldRepaint(BarChartPainter oldDelegate) => true;
//      oldDelegate.drawPointOffset != drawPointOffset;
}
