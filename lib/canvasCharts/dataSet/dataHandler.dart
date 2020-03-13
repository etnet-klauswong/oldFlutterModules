import 'dart:core';
import 'dart:core' as prefix0;

import 'package:fluttercompletelibrary/canvasCharts/dataSet/originalChartDataList.dart';

// TODO: Func ProcessData with DetailedTime

List<List> dataHandler() {
  List<List> updatedChartDataList = new List<List>();
  var StartTime, EndTime;
  var StartYear, StartMonth, StartDay;
  var EndYear, EndMonth, EndDay;
  // TODO:  Get the First & Last Data
  //  print(originalChartDataList.length);
  //  TODO: first_StampData = originalChartDataList[0]
  //  TODO: last_StampData = originalChartDataList[originalChartDataList.length - 1]
  /// Get the time_StampData = originalChartDataList[originalChartDataList.length -1][0]
  /// Get the Total Length of ChartDataList -> originalChartDataList.length
//  print(originalChartDataList[originalChartDataList.length -1][0]);
  // TODO:  Get the Current Year, Month, Day
  /// Get the StartTime
  StartTime = new DateTime.fromMillisecondsSinceEpoch(
      (originalChartDataList[originalChartDataList.length - 1]
          [0])); // TODO:   2019-10-18 10:00:00.000
  /// Get the EndTime
  EndTime = new DateTime.fromMillisecondsSinceEpoch(
      (originalChartDataList[0][0])); // TODO:   2019-10-18 10:00:00.000
  EndYear = EndTime.year;
  EndMonth = EndTime.month;
  EndDay = EndTime.day;
  StartYear = StartTime.year;
  StartMonth = StartTime.month;
  StartDay = StartTime.day;

  print(
      "The Starting Date of chartDateSet:   Year: $StartYear    Month:  $StartMonth   Day:  $StartDay");
  print(
      "Most Current Date of chartDateSet:   Year: $EndYear    Month:  $EndMonth   Day:  $EndDay");
  print("The Length of chartDateSet : ${originalChartDataList.length}");
  // TODO: originalChartDataList.length - 1 - oldData,

  for (int i = originalChartDataList.length - 1; i >= 0; i--) {
    //  timeStampIndex = originalChartDataList[i]
    var checkTime_DateTime =
        new DateTime.fromMillisecondsSinceEpoch((originalChartDataList[i][0]));

    /// Get the TimeStamp
    if (checkTime_DateTime.year == EndTime.year &&
        checkTime_DateTime.month == EndMonth &&
        checkTime_DateTime.day == EndDay) {
      //  Todo: Actually it need to group
      int tempCheckTime_mins = checkTime_DateTime.minute;
      while (tempCheckTime_mins % 5 != 0) {
        tempCheckTime_mins++;
      }
      updatedChartDataList.add([
        checkTime_DateTime.year,
        checkTime_DateTime.month,
        checkTime_DateTime.day,
        checkTime_DateTime.hour,
        tempCheckTime_mins,
        originalChartDataList[i][1],
        originalChartDataList[i][2],
        originalChartDataList[i][3],
        originalChartDataList[i][4],
        originalChartDataList[i][5]
      ]);
    } else {
      updatedChartDataList.add([
        checkTime_DateTime.year,
        checkTime_DateTime.month,
        checkTime_DateTime.day,
        checkTime_DateTime.hour,
        checkTime_DateTime.minute,
        originalChartDataList[i][1],
        originalChartDataList[i][2],
        originalChartDataList[i][3],
        originalChartDataList[i][4],
        originalChartDataList[i][5]
      ]);
    }
  }
  print(updatedChartDataList[0]);
  print("Updated Chart Data List !!!");
  return updatedChartDataList;
}
