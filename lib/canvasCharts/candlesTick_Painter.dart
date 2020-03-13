import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/canvasCharts/chartContainer.dart';
import 'package:fluttercompletelibrary/canvasCharts/pathDrawing/dash_path.dart';

class ChartPainter extends CustomPainter {
  Paint gridPainter,
      containerPainter,
      chartPainter,
      pieChartPainter,
      gainPainter,
      lossPainter;
  final double canvasHeight, canvasWidth;
  final double highPrice, lowPrice;
  final List<Offset> drawPointOffset;
  // ignore: non_constant_identifier_names

  final List<List> selectedDate;
  BuildContext context;

  ChartPainter({
    this.context,
    this.canvasHeight,
    this.canvasWidth,
    @required this.lowPrice,
    @required this.highPrice,
    // ignore: non_constant_identifier_names
    @required this.selectedDate,
    @required this.drawPointOffset,
  }) : super() {
    gridPainter = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;
    chartPainter = new Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = 2;
    containerPainter = new Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.white
      ..strokeWidth = 1
      ..isAntiAlias = true;
  }

  final List<TextPainter> gridLineTextPainters = [];
  TextPainter gridPriceList_Painters;
  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawRect(rectOHLCContainer(canvas: canvas), containerPainter);
    canvas.drawRect(rectVolumeContainer(canvas: canvas), containerPainter);
//    var priceRange= this.highPrice - this.lowPrice;
//    print("highPrice: $highPrice");
//    print("lowPrice: $lowPrice");
//    print("priceRange: $priceRange");
//    var heightProportion = this.canvasHeight / priceRange;
    var priceDiff = this.highPrice - this.lowPrice;

    /// TODO: HighPrice = 0; LowPrice = canvasHeight;
//    var priceNormalizer = ;
//    print("heightProportion: $heightProportion");

    // TODO: OHLC
    for (int i = 0; i < selectedDate.length; i++) {
      /// if openedPrice > closedPrice
      if (selectedDate[i][5] >= selectedDate[i][8]) {
        gainPainter = new Paint()
          ..color = Colors.green
          ..style = PaintingStyle.fill
          ..isAntiAlias = true
          ..strokeWidth = 2;

        /// Gain using gainPainter
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) + spaceOfData,
                ((this.highPrice - selectedDate[i][6]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Highest Price
            new Offset(
                spaceOfData * (i) + spaceOfData,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open Price
            gainPainter);

        canvas.drawLine(
            new Offset(
                spaceOfData * (i) - spaceOfData / 2 + spaceOfData,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open Price
            new Offset(
                spaceOfData * (i) + spaceOfData / 2 + spaceOfData,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open Price
            gainPainter);

        canvas.drawLine(
            new Offset(
                spaceOfData * (i) - spaceOfData / 2 + spaceOfData,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open to Close (Left)
            new Offset(
                spaceOfData * (i) - spaceOfData / 2 + spaceOfData,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open to Close (Left)
            gainPainter);

        canvas.drawLine(
            new Offset(
                spaceOfData * (i) + spaceOfData / 2 + spaceOfData,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open to Close (Right)
            new Offset(
                spaceOfData * (i) + spaceOfData / 2 + spaceOfData,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open to Close (Right)
            gainPainter);

        canvas.drawLine(
            new Offset(
                spaceOfData * (i) - spaceOfData / 2 + spaceOfData,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close Price
            new Offset(
                spaceOfData * (i) + spaceOfData / 2 + spaceOfData,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close Price
            gainPainter);
//
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) + spaceOfData,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close Price
            new Offset(
                spaceOfData * (i) + spaceOfData,
                ((this.highPrice - selectedDate[i][7]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Low Price
            gainPainter);

//        print("$i (Gain): highPrice: ${selectedDate[i][6]} openPrice: ${selectedDate[i][5]} closePrice: ${selectedDate[i][8]} lowPrice: ${selectedDate[i][7]}" );
      }

      /// if closedPrice > openedPrice
      else if (selectedDate[i][5] < selectedDate[i][8]) {
        lossPainter = new Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill
          ..isAntiAlias = true
          ..strokeWidth = 2;
//        print("Loss");

        /// Loss using lossPainter
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) + spaceOfData,
                ((this.highPrice - selectedDate[i][6]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Highest Price
            new Offset(
                spaceOfData * (i) + spaceOfData,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close Price
            lossPainter);
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) - 3 + spaceOfData,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close Price
            new Offset(
                spaceOfData * (i) + 3 + spaceOfData,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close Price
            lossPainter);
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) - 3 + spaceOfData,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close to Open (Left)
            new Offset(
                spaceOfData * (i) - 3 + spaceOfData,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close to Open (Left)
            lossPainter);
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) + 3 + spaceOfData,
                ((this.highPrice - selectedDate[i][8]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close to Open (Right)
            new Offset(
                spaceOfData * (i) + 3 + spaceOfData,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Close to Open (Right)
            lossPainter);
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) - 3 + spaceOfData,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open Price
            new Offset(
                spaceOfData * (i) + 3 + spaceOfData,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open Price
            lossPainter);
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) + spaceOfData,
                ((this.highPrice - selectedDate[i][5]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Open Price
            new Offset(
                spaceOfData * (i) + spaceOfData,
                ((this.highPrice - selectedDate[i][7]) / priceDiff) *
                    canvasHeight *
                    0.9),

            /// Low Price
            lossPainter);
//        print("$i (Gain): highPrice: ${selectedDate[i][6]} openPrice: ${selectedDate[i][5]} closePrice: ${selectedDate[i][8]} lowPrice: ${selectedDate[i][7]}" );
      }
    }
//    print("Finished");
//    canvas.drawCircle(new Offset(0, canvasHeight * 1.17), 5, gainPainter);
    // TODO: Volume

    // TODO: height: canvasHeight * 0.27, -maxVol
    for (int i = 0; i < selectedDate.length; i++) {
      double currentVolHeight =
          (selectedDate[i][9] / highVol) * canvasHeight * 0.27;

      /// if openedPrice > closedPrice
      if (selectedDate[i][5] >= selectedDate[i][8]) {
        gainPainter = new Paint()
          ..color = Colors.green
          ..style = PaintingStyle.fill
          ..isAntiAlias = true
          ..strokeWidth = 2;

        /// Gain using gainPainter

        /// UpperHorizontal Line
        canvas.drawLine(
            new Offset(spaceOfData * (i) - 3 + spaceOfData,
                ((canvasHeight * 1.17) - currentVolHeight)),
            new Offset(spaceOfData * (i) + 3 + spaceOfData,
                ((canvasHeight * 1.17) - currentVolHeight)),
            gainPainter);

        /// Bottom Line
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) - 3 + spaceOfData, (canvasHeight * 1.17)),
            new Offset(
                spaceOfData * (i) + 3 + spaceOfData, (canvasHeight * 1.17)),
            gainPainter);

        /// Left Line
        canvas.drawLine(
            new Offset(spaceOfData * (i) - 3 + spaceOfData,
                (canvasHeight * 1.17) - currentVolHeight),
            new Offset(
                spaceOfData * (i) - 3 + spaceOfData, (canvasHeight * 1.17)),
            gainPainter);

        /// Right Line
        canvas.drawLine(
            new Offset(spaceOfData * (i) + 3 + spaceOfData,
                (canvasHeight * 1.17) - currentVolHeight),
            new Offset(
                spaceOfData * (i) + 3 + spaceOfData, (canvasHeight * 1.17)),
            gainPainter);
      }

      /// if closedPrice > openedPrice
      else if (selectedDate[i][5] < selectedDate[i][8]) {
        lossPainter = new Paint()
          ..color = Colors.red
          ..style = PaintingStyle.fill
          ..isAntiAlias = true
          ..strokeWidth = 2;
//        print("Loss");

        /// Loss using lossPainter

        /// UpperHorizontal Line
        canvas.drawLine(
            new Offset(spaceOfData * (i) - 3 + spaceOfData,
                ((canvasHeight * 1.17) - currentVolHeight)),
            new Offset(spaceOfData * (i) + 3 + spaceOfData,
                ((canvasHeight * 1.17) - currentVolHeight)),
            lossPainter);

        /// Bottom Line
        canvas.drawLine(
            new Offset(
                spaceOfData * (i) - 3 + spaceOfData, (canvasHeight * 1.17)),
            new Offset(
                spaceOfData * (i) + 3 + spaceOfData, (canvasHeight * 1.17)),
            lossPainter);

        /// Left Line
        canvas.drawLine(
            new Offset(spaceOfData * (i) - 3 + spaceOfData,
                (canvasHeight * 1.17) - currentVolHeight),
            new Offset(
                spaceOfData * (i) - 3 + spaceOfData, (canvasHeight * 1.17)),
            lossPainter);

        /// Right Line
        canvas.drawLine(
            new Offset(spaceOfData * (i) + 3 + spaceOfData,
                (canvasHeight * 1.17) - currentVolHeight),
            new Offset(
                spaceOfData * (i) + 3 + spaceOfData, (canvasHeight * 1.17)),
            lossPainter);
      }
    }
  }

  //  TODO: Five Horizontal GridLine  (For Testing - numSection)
  Path gridPricePath_Horizontal({Canvas canvas, double numSection}) {
    Path path = new Path();
    double indexPreSection = (canvasHeight * 0.9) / numSection;
    for (int i = 0; i < numSection; i++) {
      path.moveTo(0, indexPreSection * (i));
      path.lineTo(canvasWidth, indexPreSection * (i));
    }
    return path;
  }

  Path gridVolPath_Horizontal({Canvas canvas, double numSection}) {
    Path path = new Path();
    double indexPreSection = (canvasHeight * 0.27) / numSection;
    for (int i = 0; i < numSection; i++) {
      path.moveTo(0, canvasHeight * 0.9 + indexPreSection * (i));
      path.lineTo(canvasWidth, canvasHeight * 0.9 + indexPreSection * (i));
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

  Path gridPath_Vertical({Canvas canvas}) {
    Path path = new Path();
    double spaceOfData = 10;
    String minsDisplay;
    for (int i = 0; i < selectedDate.length; i++) {
      if (selectedDate[i][4] % 30 == 0) {
        path.moveTo(spaceOfData * (i), 0);
        path.lineTo(spaceOfData * (i), canvasHeight * 1.190);
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

  Rect rectOHLCContainer({Canvas canvas}) {
    Path path = new Path();
    Rect rectOHLC = new Rect.fromLTRB(0, 0, canvasWidth, canvasHeight * 0.9);
    path.addRect(rectOHLC);
    return rectOHLC;
  }

  Rect rectVolumeContainer({Canvas canvas}) {
    Path path = new Path();
    Rect rectVolume = new Rect.fromLTRB(
        0, canvasHeight * 0.9, canvasWidth, canvasHeight * 1.17);
    path.addRect(rectVolume);

    canvas.drawPath(
      dashPath(
        gridPricePath_Horizontal(
            canvas: canvas, numSection: 3), // TODO: Path <-  gridPath
        dashArray: CircularIntervalList<double>(<double>[5, 5]),
      ),
      gridPainter,
    );

    canvas.drawPath(
      dashPath(
        gridVolPath_Horizontal(
            canvas: canvas, numSection: 3), // TODO: Path <-  gridPath
        dashArray: CircularIntervalList<double>(<double>[5, 5]),
      ),
      gridPainter,
    );
    canvas.drawPath(
      dashPath(
        gridPath_Vertical(canvas: canvas), // TODO: Path <-  gridPath
        dashArray: CircularIntervalList<double>(<double>[5, 5]),
      ),
      gridPainter,
    );
    return rectVolume;
  }

  @override
  bool shouldRepaint(ChartPainter oldDelegate) => true;
//      oldDelegate.drawPointOffset != drawPointOffset;
}
