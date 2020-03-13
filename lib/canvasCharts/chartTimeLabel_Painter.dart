import 'package:flutter/material.dart';
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
class ChartTimeLabel_Painter extends CustomPainter {
  Paint gridPainter;
  Paint containerPainter;
  Paint chartPainter;
  Paint pieChartPainter;
  final double canvasHeight;
  final double canvasWidth;
  final List<List> selectedDate;
  BuildContext context;
  ChartTimeLabel_Painter({
    @required this.selectedDate,
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
        gridPath_Vertical(canvas: canvas), // TODO: Path <-  gridPath
        dashArray: CircularIntervalList<double>(<double>[5, 5]),
      ),
      gridPainter,
    );
//    canvas.drawRect(graphContainer(canvas: canvas), containerPainter);
  }

  //  TODO: Five Horizontal GridLine
  Path gridPath_Vertical({Canvas canvas}) {
    Path path = new Path();
    double spaceOfData = 10;
    String minsDisplay;
    for (int i = 0; i < selectedDate.length; i++) {
      if (selectedDate[i][4] % 30 == 0) {
//        path.moveTo(spaceOfData * (i), 0);
        path.moveTo(spaceOfData * (i), canvasHeight * 1.190);
        selectedDate[i][4] == 0
            ? minsDisplay = "00"
            : minsDisplay = selectedDate[i][4].toString();
        gridPriceList_Painters = new TextPainter(
          text: new TextSpan(
            text: "  ${selectedDate[i][3].toString() + ":" + minsDisplay}",
            //  TODO: It should be collect from the DataSet
            style: new TextStyle(
              color: Colors.yellowAccent,
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        gridPriceList_Painters.layout();
        gridPriceList_Painters.paint(
            canvas, new Offset((spaceOfData * (i) - 25), canvasHeight * 1.185));

        gridPriceList_Painters = new TextPainter(
          text: new TextSpan(
            text:
                "  ${selectedDate[i][2].toString() + "/" + selectedDate[i][1].toString()}",
            //  TODO: It should be collect from the DataSet
            style: new TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        gridPriceList_Painters.layout();
        gridPriceList_Painters.paint(
            canvas, new Offset((spaceOfData * (i) - 22), canvasHeight * 1.220));

        gridPriceList_Painters = new TextPainter(
          text: new TextSpan(
            text: "  ${selectedDate[i][0].toString()}",
            //  TODO: It should be collect from the DataSet
            style: new TextStyle(
              color: Colors.white,
              fontSize: 12.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        gridPriceList_Painters.layout();
        gridPriceList_Painters.paint(
            canvas, new Offset((spaceOfData * (i) - 18), canvasHeight * 1.255));
      }
    }

    return path;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
