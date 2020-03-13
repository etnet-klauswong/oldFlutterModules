import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/canvasTesting/smallChart/small_chartPainter.dart';

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

class SmallChartContainer extends StatefulWidget {
  final String chartType;
  final List<List> dataList_info;
  SmallChartContainer({
    @required this.dataList_info,
    @required this.chartType,
  });
  // ignore: non_constant_identifier_names
  @override
  SmallChartContainerState createState() => new SmallChartContainerState(
      dataList_info: dataList_info, chartType: chartType);
}

class SmallChartContainerState extends State<SmallChartContainer> {
  SmallChartContainerState({
    @required this.chartType,
    this.drawLineWidth,
    this.enableGridLines,
    this.gridLineColor,
    this.gridLineLabelColor,
    this.gridLineAmount,
    this.gridLineWidth,
    @required this.dataList_info,
    // ignore: non_constant_identifier_names
  });
  final List<List> dataList_info;
  final String chartType;
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

  @override
  Widget build(BuildContext context) {
    var customPaint_width = MediaQuery.of(context).size.width;
    var customPaint_height = MediaQuery.of(context).size.height;
    return Container(
      child: CustomPaint(
        foregroundPainter: SmallChartPainter(
          canvasHeight: customPaint_height,
          canvasWidth: customPaint_width,
          highPrice: highPrice,
          lowPrice: lowPrice,
          selectedDate: dataList_info,
          chartType: chartType,
        ),
      ),
    );
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
