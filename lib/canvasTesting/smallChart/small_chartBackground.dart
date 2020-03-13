import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/canvasCharts/pathDrawing/dash_path.dart';

class SmallChartBackground {
  Paint gridPainter = new Paint()
    ..color = Colors.white
    ..style = PaintingStyle.stroke
    ..isAntiAlias = true;
  Paint screenWrapPainter;
  final Color chartBackgroundColor;
  final double canvasHeight, canvasWidth;
  SmallChartBackground(
      {@required this.canvasWidth,
      @required this.canvasHeight,
      @required this.chartBackgroundColor});

  paint(Canvas canvas, Size size) async {
    Rect screenWrap = Offset(0.0, 0.0) & Size(canvasWidth, canvasHeight);
    screenWrapPainter = new Paint()
      ..color = chartBackgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawRect(screenWrap, screenWrapPainter);

    /// Horizontal Dot Line
    canvas.drawPath(
      dashPath(
        gridDayPath_Vertical(
            canvas: canvas, numSection: 6), // TODO: Path <-  gridPath
        dashArray: CircularIntervalList<double>(<double>[3, 3]),
      ),
      gridPainter,
    );

    /// Vertical Dot Line
    canvas.drawPath(
      dashPath(
        gridPricePath_Horizontal(
            canvas: canvas, numSection: 3), // TODO: Path <-  gridPath
        dashArray: CircularIntervalList<double>(<double>[3, 3]),
      ),
      gridPainter,
    );
  }

  Path gridPricePath_Horizontal({Canvas canvas, double numSection}) {
    Path path = new Path();
    double indexPreSection = (canvasHeight) / numSection;
    for (int i = 0; i < numSection; i++) {
      path.moveTo(0, indexPreSection * (i));
      path.lineTo(canvasWidth, indexPreSection * (i));
    }
    return path;
  }

  Path gridDayPath_Vertical({Canvas canvas, double numSection}) {
    Path path = new Path();
    double indexPreSection = canvasWidth / numSection;
    for (int i = 1; i < numSection; i++) {
      path.moveTo(indexPreSection * (i), 0);
      path.lineTo(indexPreSection * (i), canvasHeight);
    }
    return path;
  }
}
