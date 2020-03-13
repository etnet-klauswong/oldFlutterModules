import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/canvasCharts/chartContainer.dart';
import 'package:fluttercompletelibrary/canvasCharts/pathDrawing/dash_path.dart';

List<Color> priceListColor = [
  Colors.red,
  Colors.white,
  Colors.white,
  Colors.green
];

// TODO:
/// path.lineTo(x,y); from (originalX,originalY) to (x,y) ->  Need .moveTo first  // Refer to a last point to a new point
/// path.close();
/// Rect.fromLTRB(from_X,from_Y,to_X,to_Y)
class ChartPriceLabel extends CustomPainter {
  Paint gridPainter;
  Paint containerPainter;
  Paint chartPainter;
  Paint pieChartPainter;
  final double canvasHeight;
  final double canvasWidth;
  BuildContext context;
  ChartPriceLabel({
    this.context,
    this.canvasHeight,
    this.canvasWidth,
  }) {
    gridPainter = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;
    chartPainter = new Paint()
      ..color = Colors.blueAccent.withOpacity(0.5)
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..strokeWidth = 2;
    containerPainter = new Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white
      ..strokeWidth = 1
      ..isAntiAlias = true;
    pieChartPainter = new Paint();
  }

  final List<TextPainter> gridLineTextPainters = [];
  TextPainter gridPriceList_Painters;

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: Get the highPrice & lowPrice & price Diff

    canvas.drawPath(
      dashPath(
        gridPath_Horizontal(canvas: canvas), // TODO: Path <-  gridPath
        dashArray: CircularIntervalList<double>(<double>[5, 5]),
      ),
      gridPainter,
    );
//    canvas.drawRect(graphContainer(canvas: canvas), containerPainter);
  }

  //  TODO: Five Horizontal GridLine
  Path gridPath_Horizontal({Canvas canvas}) {
    double priceDiff = (highPrice - lowPrice) / 4;
    double priceHeightDiff = (this.canvasHeight * 0.9) / 4;
    double volHeightDiff = (this.canvasHeight * 0.27) / 4;
    double volDiff = (highVol - lowVol) / 4;
    Path path = new Path();
    List<double> priceLabel_yPosition = [
      (canvasHeight * 0.9 + 12 - priceHeightDiff),

      /// lowPrice
      (canvasHeight * 0.9 + 12 - priceHeightDiff * 2),
      (canvasHeight * 0.9 + 2 - priceHeightDiff * 3),
      (canvasHeight * 0.9 - priceHeightDiff * 4 - 8)

      /// highPrice
    ];
    List<double> volLabel_yPosition = [
      (canvasHeight * 1.005 - volHeightDiff * 1),

      /// lowVol
      (canvasHeight * 1.005 - volHeightDiff * 2 - 3),
      (canvasHeight * 1.005 - volHeightDiff * 3 - 5),
      (canvasHeight * 1.005 - volHeightDiff * 4 - 2),

      /// highVol
    ];
    for (int i = 0; i <= 3; i++) {
      gridPriceList_Painters = new TextPainter(
        text: new TextSpan(
          text:
              "  \$ ${lowPrice + (priceDiff * i)}", //  TODO: It should be collect from the DataSet
          style: new TextStyle(
            color: priceListColor[i],
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      gridPriceList_Painters.layout();
      gridPriceList_Painters.paint(
          canvas, new Offset(0, priceLabel_yPosition[i]));
    }

    for (int i = 0; i <= 3; i++) {
      gridPriceList_Painters = new TextPainter(
        text: new TextSpan(
          text:
              "  ${((highVol - (volDiff * i)) / 1000000).toStringAsFixed(2)} M", //  TODO: It should be collect from the DataSet
          style: new TextStyle(
            color: priceListColor[i],
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      gridPriceList_Painters.layout();
      gridPriceList_Painters.paint(
          canvas, new Offset(0, volLabel_yPosition[i]));
    }
    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
