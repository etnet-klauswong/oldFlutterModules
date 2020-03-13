import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart' as prefix1;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:fluttercompletelibrary/canvasCharts/areaChart_Painter.dart';
import 'package:fluttercompletelibrary/canvasCharts/barChart_Painter.dart';
import 'package:fluttercompletelibrary/canvasCharts/candlesTick_Painter.dart';
import 'package:fluttercompletelibrary/canvasCharts/chartPriceLabel_Painter.dart';
import 'package:fluttercompletelibrary/canvasCharts/lineChartPainter.dart';
import 'package:fluttercompletelibrary/canvasCharts/selectedDropButton/chartTypeSelectedDropButton.dart';
import 'package:fluttercompletelibrary/canvasCharts/selectedDropButton/colorTypeSelectedDropButton.dart';
import 'package:fluttercompletelibrary/canvasCharts/selectedDropButton/indexTypeSelectedDropButton.dart';
import 'package:fluttercompletelibrary/canvasCharts/selectedDropButton/timePeriodSelectodDropButton.dart';

//ChartContainer

void chartTable({@required List<List> chartData}) {
  highVol = chartData[0][9];
  lowVol = chartData[0][9];
  openPrice = chartData[0][5];
  closePirce = chartData[0][8];
  highPrice = chartData[0][6];
  lowPrice = chartData[0][7];
  chartData.forEach((chartData) {
    daySet.add(chartData[2]);
    //  TODO: Update HighPrice
    if (chartData[6] > highPrice) {
      highPrice = chartData[6];
    }
    //  TODO: Update LowPrice
    if (chartData[7] < lowPrice) {
      lowPrice = (chartData[7]);
    }
    if (chartData[9] > highVol) {
      highVol = chartData[9];
    }
    if (chartData[9] < lowVol) {
      lowVol = chartData[9];
    }
    if (chartData[4] % 30 == 0) {
      numOfLabel++;
    }
    closePriceList.add(chartData[8]);
  });
}

// ignore: non_constant_identifier_names
double mobilePhysicalSize_Height = window.physicalSize.height;
// ignore: non_constant_identifier_names
double mobilePhysicalSize_Width = window.physicalSize.width;
// ignore: non_constant_identifier_names
double mobilePixel_Ratio = window.devicePixelRatio;

// TODO: CanvasContainer
double canvasHeight = (mobilePhysicalSize_Width / mobilePixel_Ratio);
double canvasWidth = (mobilePhysicalSize_Width / mobilePixel_Ratio);

class ChartContainer extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final List<List> dataList_info;
  ChartContainer({
    @required this.dataList_info,
  });
  @override
  ChartContainerState createState() =>
      new ChartContainerState(dataList_info: dataList_info);
}

class ChartContainerState extends State<ChartContainer> {
  // TODO:
//window.physicalSize     //获取屏幕尺寸px----1080.0, 2196.0
//window.devicePixelRatio
  ChartContainerState({
    this.drawLineWidth,
    this.enableGridLines,
    this.gridLineColor,
    this.gridLineLabelColor,
    this.gridLineAmount,
    this.gridLineWidth,
    // ignore: non_constant_identifier_names
    @required this.dataList_info,
  });

  // ignore: non_constant_identifier_names
  final List<List> dataList_info;
//  final Map<int, Map<String, dynamic>> selectedData;
  // TODO: Condition Parameters
  final bool enableGridLines;
  // TODO: All drawing Painter Parameters
  final double drawLineWidth;
  // TODO: Grid
  final Color gridLineColor;
  final Color gridLineLabelColor;
  final int gridLineAmount;
  final double gridLineWidth;
  final drawPointOffsets = <Offset>[];
//  void down(PointerDownEvent evt) {
//    RenderBox box = context.findRenderObject();
//    _paintKey.addPos(box.globalToLocal(evt.position));
//  }

//  @override
//  void initState() {
//    super.initState();
//    streamController.stream.listen((data){
//    })
//  }

  @override
  void initState() {
    super.initState();
    chartTable(chartData: dataList_info);
  }

  @override
  void dispose() {
    super.dispose();
    chartTypeStream_Close();
  }

  ///  addListener() - handle th update
  ///  hitTest() - handle the
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Listener(
      child: Container(
        color: Colors.white,
        height: canvasHeight * 1.4,
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Icon(Icons.search),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: EdgeInsets.only(top: 1),
                                    alignment: AlignmentDirectional.centerStart,
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          "HSI  恆生指數",
                                          textDirection: TextDirection.ltr,
                                          style: prefix0.TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          padding: EdgeInsets.all(0),
                                          margin: EdgeInsets.all(0),
                                          alignment:
                                              AlignmentDirectional.centerStart,
                                          child: Text(
                                            "時間",
                                            style: prefix1.TextStyle(
                                                fontSize: 14,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 7,
                                        child: Container(
                                          padding: EdgeInsets.all(0),
                                          margin: EdgeInsets.all(0),
                                          alignment:
                                              AlignmentDirectional.center,
                                          child: TimePeriodSelectedDropButton(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Icon(Icons.refresh),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    child: Icon(Icons.close),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: Container(
                              margin: EdgeInsets.only(left: 3),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      "${DateTime.now().day}" +
                                          "/" +
                                          "${DateTime.now().month}" +
                                          "/" +
                                          "${DateTime.now().year}" +
                                          " " +
                                          "${DateTime.now().hour}" +
                                          ":" +
                                          (DateTime.now().minute % 10 != 0
                                              ? "${DateTime.now().minute}"
                                              : "0" +
                                                  "${DateTime.now().minute}"),
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.black),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 3),
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "開: $openPrice",
                                              style: prefix1.TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 3),
                                            alignment: Alignment.centerLeft,
                                            child: Text("高: $highPrice",
                                                style: prefix1.TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 3, bottom: 3),
                                            alignment: Alignment.centerLeft,
                                            child: Text("低: $lowPrice",
                                                style: prefix1.TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 3, bottom: 3),
                                            alignment: Alignment.centerLeft,
                                            child: Text("收: $closePirce",
                                                style: prefix1.TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Text(
                                            "類型",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: ChartTypeSelectedDropButton(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Column(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Text(
//                                          ,style: prefix1.TextStyle(color: Colors.black)
                                            "颜色",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: ColorTypeSelectedDropButton(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: IndexTypeSelectedDropButton(),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 16,
              child: new Row(
                children: <Widget>[
                  Expanded(
                      flex: 6,
                      child: GestureDetector(
                        onPanStart: (details) {
                          print(
                              "drawPointGlobalPosition: ${details.globalPosition}");
                          drawPointOffsets.add(details.globalPosition);
                        },
                        onPanUpdate: (details) {
                          print(
                              "drawPointGlobalPosition: ${details.globalPosition}");
                          drawPointOffsets.add(details.globalPosition);
                        },
                        onPanEnd: (details) {
                          drawPointOffsets.add(null);
                        },
                        child: Container(
                          color: Colors.black,
                          margin: EdgeInsets.all(0),
                          padding: EdgeInsets.all(0),
                          height: (canvasHeight * 1.3) * 1.2,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Container(
                              margin: EdgeInsets.all(0),
                              padding: EdgeInsets.all(0),
                              height: (canvasHeight * 1.4) * 0.842,

                              /// windowSize - (canvasWidth-15)
                              width: (((dataList_info.length + 3) * 10.0) >
                                      (canvasWidth))
                                  ? ((dataList_info.length + 3) * 10.0)
                                  : (canvasWidth),
                              child: StreamBuilder<ChartType>(
                                  stream: getSelectedChartType.stream,
                                  initialData: ChartType.candlesTickChart,
                                  builder: (context, snapshot) {
                                    if (snapshot.data ==
                                        ChartType.candlesTickChart) {
                                      return Stack(
                                        children: <Widget>[
                                          CustomPaint(
                                            size: Size.infinite,
                                            foregroundPainter: ChartPainter(
                                              drawPointOffset: drawPointOffsets,
                                              context: context,
                                              canvasHeight:
                                                  (canvasHeight * 1.3) * 0.69,
                                              highPrice: highPrice,
                                              lowPrice: lowPrice,
                                              // TODO:  Actually this Canvas Width could depend on how many scale of the dataSet
                                              /// windowSize - (canvasWidth-15)
                                              canvasWidth:
                                                  (((dataList_info.length + 3) *
                                                              10.0) >
                                                          (canvasWidth))
                                                      ? ((dataList_info.length +
                                                              3) *
                                                          10.0)
                                                      : (canvasWidth),
                                              selectedDate: dataList_info,
                                            ),
                                            child: new ConstrainedBox(
                                                constraints: new BoxConstraints
                                                    .expand()),
                                          ),
                                        ],
                                      );
                                    } else if (snapshot.data ==
                                        ChartType.lineChart) {
                                      return Stack(
                                        children: <Widget>[
                                          CustomPaint(
                                            size: Size.infinite,
                                            foregroundPainter: ChartPainter(
                                              drawPointOffset: drawPointOffsets,
                                              context: context,
                                              canvasHeight:
                                                  (canvasHeight * 1.3) * 0.69,
                                              highPrice: highPrice,
                                              lowPrice: lowPrice,
                                              // TODO:  Actually this Canvas Width could depend on how many scale of the dataSet
                                              /// windowSize - (canvasWidth-15)
                                              canvasWidth:
                                                  (((dataList_info.length + 3) *
                                                              10.0) >
                                                          (canvasWidth))
                                                      ? ((dataList_info.length +
                                                              3) *
                                                          10.0)
                                                      : (canvasWidth),
                                              selectedDate: dataList_info,
                                            ),
                                            child: new ConstrainedBox(
                                                constraints: new BoxConstraints
                                                    .expand()),
                                          ),
                                          CustomPaint(
                                            size: Size.infinite,
                                            foregroundPainter: LineChartPainter(
                                              context: context,
                                              canvasHeight:
                                                  (canvasHeight * 1.3) * 0.70,
                                              // TODO:  Actually this Canvas Width could depend on how many scale of the dataSet
                                              /// windowSize - (canvasWidth-15)
                                              canvasWidth:
                                                  (((dataList_info.length + 3) *
                                                              10.0) >
                                                          (canvasWidth))
                                                      ? ((dataList_info.length +
                                                              3) *
                                                          10.0)
                                                      : (canvasWidth),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else if (snapshot.data ==
                                        ChartType.areaChart) {
                                      return Stack(
                                        children: <Widget>[
                                          CustomPaint(
                                            size: Size.infinite,
                                            foregroundPainter: ChartPainter(
                                              drawPointOffset: drawPointOffsets,
                                              context: context,
                                              canvasHeight:
                                                  (canvasHeight * 1.3) * 0.69,
                                              highPrice: highPrice,
                                              lowPrice: lowPrice,
                                              // TODO:  Actually this Canvas Width could depend on how many scale of the dataSet
                                              /// windowSize - (canvasWidth-15)
                                              canvasWidth:
                                                  (((dataList_info.length + 3) *
                                                              10.0) >
                                                          (canvasWidth))
                                                      ? ((dataList_info.length +
                                                              3) *
                                                          10.0)
                                                      : (canvasWidth),
                                              selectedDate: dataList_info,
                                            ),
                                            child: new ConstrainedBox(
                                                constraints: new BoxConstraints
                                                    .expand()),
                                          ),
                                          CustomPaint(
                                            size: Size.infinite,
                                            foregroundPainter: LineChartPainter(
                                              context: context,
                                              canvasHeight:
                                                  (canvasHeight * 1.3) * 0.70,
                                              // TODO:  Actually this Canvas Width could depend on how many scale of the dataSet
                                              /// windowSize - (canvasWidth-15)
                                              canvasWidth:
                                                  (((dataList_info.length + 3) *
                                                              10.0) >
                                                          (canvasWidth))
                                                      ? ((dataList_info.length +
                                                              3) *
                                                          10.0)
                                                      : (canvasWidth),
                                            ),
                                          ),
                                          CustomPaint(
                                            size: Size.infinite,
                                            foregroundPainter: AreaChartPainter(
                                              context: context,
                                              canvasHeight:
                                                  (canvasHeight * 1.3) * 0.70,
                                              // TODO:  Actually this Canvas Width could depend on how many scale of the dataSet
                                              /// windowSize - (canvasWidth-15)
                                              canvasWidth:
                                                  (((dataList_info.length + 3) *
                                                              10.0) >
                                                          (canvasWidth))
                                                      ? ((dataList_info.length +
                                                              3) *
                                                          10.0)
                                                      : (canvasWidth),
                                            ),
                                          ),
                                        ],
                                      );
                                    } else if (snapshot.data ==
                                        ChartType.barChart) {
                                      return Stack(
                                        children: <Widget>[
                                          CustomPaint(
                                            size: Size.infinite,
                                            foregroundPainter: ChartPainter(
                                              drawPointOffset: drawPointOffsets,
                                              context: context,
                                              canvasHeight:
                                                  (canvasHeight * 1.3) * 0.69,
                                              highPrice: highPrice,
                                              lowPrice: lowPrice,
                                              // TODO:  Actually this Canvas Width could depend on how many scale of the dataSet
                                              /// windowSize - (canvasWidth-15)
                                              canvasWidth:
                                                  (((dataList_info.length + 3) *
                                                              10.0) >
                                                          (canvasWidth))
                                                      ? ((dataList_info.length +
                                                              3) *
                                                          10.0)
                                                      : (canvasWidth),
                                              selectedDate: dataList_info,
                                            ),
                                            child: new ConstrainedBox(
                                                constraints: new BoxConstraints
                                                    .expand()),
                                          ),
                                          CustomPaint(
                                            size: Size.infinite,
                                            foregroundPainter: BarChartPainter(
                                              selectedDate: dataList_info,
                                              context: context,
                                              canvasHeight:
                                                  (canvasHeight * 1.3) * 0.70,
                                              // TODO:  Actually this Canvas Width could depend on how many scale of the dataSet
                                              /// windowSize - (canvasWidth-15)
                                              canvasWidth:
                                                  (((dataList_info.length + 3) *
                                                              10.0) >
                                                          (canvasWidth))
                                                      ? ((dataList_info.length +
                                                              3) *
                                                          10.0)
                                                      : (canvasWidth),
                                            ),
                                          ),
                                        ],
                                      );
                                    }
                                    return Center(
                                      child: Text("${snapshot.data}"),
                                    );
                                  }),
                            ),
                          ),
                        ),
                      )),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.black,
                      height: canvasHeight * 1.4,
                      child: CustomPaint(
                        foregroundPainter: ChartPriceLabel(
                            context: context,
                            canvasHeight: canvasHeight * 1.1,
                            canvasWidth: canvasWidth * 1.1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: missing_return
  Widget canvasChartSelected(ChartType chartType) {
    switch (chartType) {
      case ChartType.candlesTickChart:
        {
          return CustomPaint(
            size: Size.infinite,
            foregroundPainter: ChartPainter(
              drawPointOffset: drawPointOffsets,
              context: context,
              canvasHeight: (canvasHeight * 1.3) * 0.69,
              highPrice: highPrice,
              lowPrice: lowPrice,
              // TODO:  Actually this Canvas Width could depend on how many scale of the dataSet
              /// windowSize - (canvasWidth-15)
              canvasWidth: (((dataList_info.length + 3) * 10.0) > (canvasWidth))
                  ? ((dataList_info.length + 3) * 10.0)
                  : (canvasWidth),
              selectedDate: dataList_info,
            ),
            child: new ConstrainedBox(constraints: new BoxConstraints.expand()),
          );
        }
      case ChartType.lineChart:
        // TODO: Handle this case.
        return CustomPaint(
          size: Size.infinite,
          foregroundPainter: LineChartPainter(
            context: context,
            canvasHeight: (canvasHeight * 1.3) * 0.70,
            // TODO:  Actually this Canvas Width could depend on how many scale of the dataSet
            /// windowSize - (canvasWidth-15)
            canvasWidth: (((dataList_info.length + 3) * 10.0) > (canvasWidth))
                ? ((dataList_info.length + 3) * 10.0)
                : (canvasWidth),
          ),
        );
      case ChartType.areaChart:
        return CustomPaint(
          size: Size.infinite,
          foregroundPainter: AreaChartPainter(
            context: context,
            canvasHeight: (canvasHeight * 1.3) * 0.70,
            // TODO:  Actually this Canvas Width could depend on how many scale of the dataSet
            /// windowSize - (canvasWidth-15)
            canvasWidth: (((dataList_info.length + 3) * 10.0) > (canvasWidth))
                ? ((dataList_info.length + 3) * 10.0)
                : (canvasWidth),
          ),
        );
      case ChartType.barChart:
        // TODO: Handle this case.
        return CustomPaint(
          size: Size.infinite,
          foregroundPainter: BarChartPainter(
            selectedDate: dataList_info,
            context: context,
            canvasHeight: (canvasHeight * 1.3) * 0.70,
            // TODO:  Actually this Canvas Width could depend on how many scale of the dataSet
            /// windowSize - (canvasWidth-15)
            canvasWidth: (((dataList_info.length + 3) * 10.0) > (canvasWidth))
                ? ((dataList_info.length + 3) * 10.0)
                : (canvasWidth),
          ),
        );
    }
  }
}

enum ChartType {
  candlesTickChart, // index -> 0
  lineChart, // index -> 1
  areaChart, // index -> 2
  barChart, // index -> 3
}

StreamController<ChartType> getSelectedChartType =
    StreamController<ChartType>();

void chartTypeStream_Add(ChartType chartType) {
  getSelectedChartType.add(chartType);
}

void chartTypeStream_Close() {
  getSelectedChartType.close();
}

//Stream<ChartType> get getChartType => getSelectedChartType.stream;
//Stream<ChartType> get getChartType => getSelectedChartType.stream;

double openPrice, highPrice, lowPrice, closePirce;
var spaceOfData = 10.0;
int highVol, lowVol;
//Set monthSet = new Set();
Set daySet = new Set();
List dayPosition = new List();
List<List> timePeriodLabel = new List<List>();
// TODO: closePriceList
List closePriceList = new List();
var priceDiff = highPrice - lowPrice;
// TODO: count the 15min & 30min & 60 min
int numOfLabel = 0;
