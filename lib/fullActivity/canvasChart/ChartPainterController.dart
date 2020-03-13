import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/fullActivity/canvasChart/backgroundDisplayGrid.dart';
import 'package:fluttercompletelibrary/fullActivity/canvasChart/streamChart_areaChart.dart';
import 'package:fluttercompletelibrary/fullActivity/canvasChart/streamChart_barChart.dart';
import 'package:fluttercompletelibrary/fullActivity/canvasChart/streamChart_candlesTickChartPainter.dart';
import 'package:fluttercompletelibrary/fullActivity/canvasChart/streamChart_lineChart.dart';
import 'package:fluttercompletelibrary/fullActivity/canvasChart/streamChart_volChart.dart';

enum ChartType {
  candlesTickChart,
  lineChart,
  areaChart,
  barChart,
  volChart,
}

class ChartPainterController extends CustomPainter {
  var nestHighPriceLimit,
      nestLowPriceLimit,
      nestHighVol,
      nestLowVol,
      nestHighPrice,
      nestLowPrice,
      nestHighVolLimit,
      nestPriceDiff;

  final List<List> tempSingleDataList;
  // ignore: non_constant_identifier_names
  final ChartType chartType;
  static int numOfDataList = 5;
  static List<List> tempNestedDataList = new List<List>();
  static List<List> croppingNestedDataList = new List<List>();

  static int accumulateShiftNum;

  var generatedSbubList_StartNum;
  var generatedSbubList_EndNum;

  /// static parameters
  /// Year, Month,Day to
  static Set<String> timeDomainList = new Set();
  static int highVol,
      lowVol; // TODO: * 1.10 avoid to touch the canvas box constraint
  static var priceDiff;
  static int dataSize;

  /// limit
  static int highVolLimit;
  final bool isEnableGrid;

  /// highVolLimit = highVol * 1.1
  static double highPriceLimit, lowPriceLimit;
  static double highPrice, lowPrice;

  final bool isEnableHorizontalGrid;
  final bool isEnableVerticalGrid;
//  final int dataSize;
  final bool isWholeChart;
  static int dataListShiftingNum;
  final int dataSetShiftingNum;
  final bool closePriceTracking;
  ChartPainterController({
    this.tempSingleDataList,
    this.chartType,
//    this.dataSize,
    this.isEnableGrid: true,
    this.isEnableHorizontalGrid: true,
    this.isEnableVerticalGrid: true,
    this.isWholeChart: false,
    this.closePriceTracking: false,
    this.dataSetShiftingNum: 0,
  })
//        this.isEnableGrid = isEnableGrid ?? false
  {
//    updateChartProperty(croppingNestedDataList: croppingNestedDataList);
    // TODO: Only Run Once (check whether exist the variable -> if not exist add the current dataList to those variables)
//    var currentDataTime =
//        new DateTime.fromMillisecondsSinceEpoch(tempSingleDataList[0][0]);
//    var formatter = new DateFormat('dd-MM-yyyy');
//    dynamic transferDataTime = formatter.format(currentDataTime);
//    tempNestedDataList.add([
//      transferDataTime,
//      tempSingleDataList[1],
//      tempSingleDataList[2],
//      tempSingleDataList[3],
//      tempSingleDataList[4],
//      tempSingleDataList[5],
//    ]);

//    numOfDataList = dataList;
//    if (numOfDataList < 5) {
//      numOfDataList = 5;
//    }
//    if (numOfDataList > 150) {
//      numOfDataList = 999;
//    }
    // TODO: What
//    currentSbubList_StartNum = tempNestedDataList.length - numOfDataList;
//    currentSbubList_EndNum = tempNestedDataList.length - 1;

//    var SbubList_endNum = tempNestedDataList.length - 1;
//    var SbubList_StartNum = tempNestedDataList.length - numOfDataList - 1;
//    currentSbubList_StartNum ??= SbubList_StartNum;
//    currentSbubList_EndNum ??= SbubList_endNum;
//
//    if (dataSetShiftingNum > 0) {
//      // shift to right
//      currentSbubList_EndNum = (currentSbubList_EndNum + dataSetShiftingNum) >=
//              tempNestedDataList.length
//          ? tempNestedDataList.length - 1
//          : currentSbubList_EndNum + dataSetShiftingNum;
//      currentSbubList_StartNum = currentSbubList_EndNum - numOfDataList;
//    }
//    if (dataSetShiftingNum < 0) {
//      // shift to left
//      currentSbubList_StartNum =
//          (currentSbubList_StartNum + dataSetShiftingNum) <= 0
//              ? 0
//              : currentSbubList_StartNum + dataSetShiftingNum;
//      currentSbubList_EndNum = currentSbubList_StartNum + numOfDataList;
//    }

    ///    generateSbubList_endNum ;
    ///    generateSbubList_StartNum ;

//    if (dataSetShiftingNum != 0) {
//      dataListShiftingNum = dataSetShiftingNum;
//      if (dataListShiftingNum >= 0) {
//        if (sbubList_endNum + dataListShiftingNum > tempNestedDataList.length) {
//          sbubList_endNum = tempNestedDataList.length - 1;
//        } else if (sbubList_endNum + dataListShiftingNum <
//            tempNestedDataList.length) {
//          sbubList_endNum = sbubList_endNum + dataSetShiftingNum;
//
//          sbubList_startNum = sbubList_endNum - numOfDataList;
//        }
//        if (dataListShiftingNum < 0) {
//          if (sbubList_startNum - dataListShiftingNum <= 0) {
//            sbubList_startNum = 0;
//          } else if (sbubList_startNum - dataListShiftingNum >= 0) {
//            sbubList_startNum = sbubList_startNum - dataListShiftingNum;
//          }
//
//          sbubList_endNum = sbubList_startNum + numOfDataList;
//        }
//      }
//    }

    dataSize = tempSingleDataList.length;
    croppingNestedDataList = tempSingleDataList;
//    debugPrint(tempSingleDataList.toString());
    // TODO: Cropping func of List<List>()
//    if (tempNestedDataList.length <= numOfDataList) {
//      croppingNestedDataList = tempNestedDataList;
//    } else {
//      croppingNestedDataList = tempNestedDataList.sublist(
//          currentSbubList_StartNum, currentSbubList_EndNum);
////      croppingNestedDataList = tempNestedDataList.sublist(
////          tempNestedDataList.length - 1 - numOfDataList,
////          tempNestedDataList.length - 1);
//    }
    updateChartProperty(croppingNestedDataList: croppingNestedDataList);
  }

  // ignore: missing_return
  double getApproriatePainterWidth({@required int checkList}) {
    if (checkList < 25) {
      return 3.0;
    } else if (checkList >= 25 && checkList <= 40) {
      return 2.0;
    } else if (checkList > 40 && checkList <= 60) {
      return 1.25;
    } else if (checkList > 60) {
      return 0.75;
    }
  }

  // TODO: wholeAreaChart
  void updateChartProperty({List<List> croppingNestedDataList}) {
    for (int i = 0; i < croppingNestedDataList.length; i++) {
      nestHighPriceLimit ??= croppingNestedDataList[0][2];
      nestLowPriceLimit ??= croppingNestedDataList[0][3];
      nestHighVol ??= croppingNestedDataList[0][5];
      nestLowVol ??= croppingNestedDataList[0][5];
      nestHighPrice ??= croppingNestedDataList[0][2];
      nestLowPrice ??= croppingNestedDataList[0][3];

      if (croppingNestedDataList[i][2] >= nestHighPrice) {
        nestHighPrice = croppingNestedDataList[i][2];
      }

      /// Handle the lowPriceenableGrid:
      if (croppingNestedDataList[i][3] <= nestLowPrice) {
        nestLowPrice = croppingNestedDataList[i][3];
      }

      /// Handle the lowVol
      if (croppingNestedDataList[i][5] <= nestLowVol) {
        nestLowVol = croppingNestedDataList[i][5];
      }

      /// Handle the highVol
      if (croppingNestedDataList[i][5] >= nestHighVol) {
        nestHighVol = croppingNestedDataList[i][5];
      }

      nestHighVolLimit = (nestHighVol).round();
      nestHighPriceLimit = (nestHighPrice * 1.001);
      nestLowPriceLimit = (nestLowPrice * 0.999);
      nestPriceDiff = nestHighPriceLimit - nestLowPriceLimit;
    }
    highVol = nestHighVol;
    priceDiff = nestPriceDiff;
    highVolLimit = nestHighVolLimit;
    highPriceLimit = nestHighPriceLimit;
    lowPriceLimit = nestLowPriceLimit;
    highPrice = nestHighPrice;
    lowPrice = nestLowPrice;
    lowVol = nestLowVol;
  }

  @override
  void paint(Canvas canvas, Size size) async {
    /// canvasWidth get from size.Width & canvasHeight get from size.Height
    ///
    /// Do the output checking
//    log("CanvasWidth: ${size.width.toString()} CanvasHeight: ${size.height.toString()}");
//    log("dataNum: ${tempNestedDataList.length} ${tempNestedDataList[0][1]} ${tempNestedDataList[0][2]} ${tempNestedDataList[0][3]} ${tempNestedDataList[0][4]}");
//    tempNestedDataList.forEach((tempPrint) {
//      log(tempPrint.toString());
//    });
//  debugPrint(croppingNestedDataList[croppingNestedDataList.length-1][4].toString());
    Paint linePainter = new Paint()
      ..color = Colors.blueAccent
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeWidth = 2;
//    var pxOfLastPoint = (highPriceLimit - tempNestedDataList[tempNestedDataList.length-1][4]/ priceDiff)*
//        size.height;
//    debugPrint(size.height.toString());

    var spaceBetweenData =
        (size.width.truncate() / ((croppingNestedDataList.length + 0.75)));
    if (chartType == ChartType.candlesTickChart) {
      streamChart_candlesTickChartPainter(
        painterWidth:
            getApproriatePainterWidth(checkList: tempSingleDataList.length),
        canvas: canvas,
        spaceBetweenData: spaceBetweenData,
        priceDiff: priceDiff,
        highPriceLimit: highPriceLimit,
        painterContainerSize: size,
        tempNestedDataList: croppingNestedDataList,
      );
    }
    if (isEnableGrid) {
      backgroundDisplayGrid(
        isEnableHorizontalGrid: isEnableHorizontalGrid,
        isEnableVerticalGrid: isEnableVerticalGrid,
        canvas: canvas,
        spaceBetweenData: spaceBetweenData,
        priceDiff: priceDiff,
        highPriceLimit: highPriceLimit,
        painterContainerSize: size,
        tempNestedDataList: croppingNestedDataList,
      );
    }
////      lineChart(
////        canvas: canvas,
////        spaceBetweenData: spaceBetweenData,
////        priceDiff: priceDiff,
////        highPriceLimit: highPriceLimit,
////        painterContainerSize: size,
////        tempNestedDataList: tempNestedDataList,
////      );
//    }

    if (chartType == ChartType.areaChart) {
      streamChart_areaChartPainter(
        canvas: canvas,
        spaceBetweenData: spaceBetweenData,
        priceDiff: priceDiff,
        highPriceLimit: highPriceLimit,
        painterContainerSize: size,
        tempNestedDataList: croppingNestedDataList,
        lowPrice: nestLowPrice,
        highPrice: nestHighPrice,
        closePriceTracking: closePriceTracking,
      );
    }
    if ((chartType != ChartType.areaChart &&
        chartType == ChartType.lineChart)) {
      streamChart_lineChartPainter(
        canvas: canvas,
        spaceBetweenData: spaceBetweenData,
        priceDiff: priceDiff,
        highPriceLimit: highPriceLimit,
        painterContainerSize: size,
        tempNestedDataList: croppingNestedDataList,
      );
    }

    if (chartType == ChartType.barChart) {
      streamChart_barChartPainter(
        canvas: canvas,
        spaceBetweenData: spaceBetweenData,
        priceDiff: priceDiff,
        highPriceLimit: highPriceLimit,
        painterContainerSize: size,
        tempNestedDataList: croppingNestedDataList,
      );
    }
    if (chartType == ChartType.volChart) {
      streamChart_volChartPainter(
        canvas: canvas,
        spaceBetweenData: spaceBetweenData,
        priceDiff: priceDiff,
        highVolLimit: highVolLimit,
        painterContainerSize: size,
        tempNestedDataList: croppingNestedDataList,
      );
    }

//     TODO: implement paint
  }

  @override
  bool shouldRepaint(ChartPainterController oldDelegate) {
    return true;
  }
}
