import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataHandlerHelper {
  static Set<String> timeDomainList = new Set();
  static List<List> handledDataList = new List();

  /// Year, Month,Day to
  static int highVol,
      lowVol; // TODO: * 1.10 avoid to touch the canvas box constraint
  var priceDiff;

  /// limit
  static int highVolLimit;

  /// highVolLimit = highVol * 1.1
  static double highPriceLimit, lowPriceLimit;
  static double highPrice, lowPrice;

  /// To adjust highPrice to (highPrice * 1.1) & lowPrice to (lowPrice * 0.9)

  get getBackHighPriceLimit {
    return highPriceLimit;
  }

  List<List> snapShotDataAdding({@required List comingSnapShotData}) {
    handledDataList.add([
      comingSnapShotData[0],
      comingSnapShotData[1],
      comingSnapShotData[2],
      comingSnapShotData[3],
      comingSnapShotData[4],
      comingSnapShotData[5],
    ]);
    log(handledDataList.toString());
    return handledDataList;
  }

  void dataHandler(
      {@required List<List> inputDataList, String timeDomain = "DAY"}) {
    highPriceLimit ??= inputDataList[0][2];
    lowPriceLimit ??= inputDataList[0][3];
    highVol ??= inputDataList[0][5];
    lowVol ??= inputDataList[0][5];
    highPrice ??= inputDataList[0][2];
    lowPrice ??= inputDataList[0][3];
    for (int i = 0; i < inputDataList.length; i++) {
      /// Handle the highPrice
      if (inputDataList[i][2] >= highPrice) {
        highPrice = inputDataList[i][2];
      }

      /// Handle the lowPrice
      if (inputDataList[i][3] < lowPrice) {
        lowPrice = inputDataList[i][3];
      }

      /// Handle the lowVol
      if (inputDataList[i][5] <= lowVol) {
        lowVol = inputDataList[i][5];
      }

      /// Handle the highVol
      if (inputDataList[i][5] >= highVol) {
        highVol = inputDataList[i][5];
      }

      highVolLimit = (highVol * 1.1).round();
      highPriceLimit = (highPrice * 1.1);
      lowPriceLimit = (lowPrice * 0.9);
      priceDiff = highPrice - lowPrice;

      var currentDataTime =
          new DateTime.fromMillisecondsSinceEpoch(inputDataList[i][0]);
      var formatter = new DateFormat('dd-MM-yyyy');
      dynamic transferDataTime = formatter.format(currentDataTime);
      handledDataList.add([
        transferDataTime,
        inputDataList[0][1],
        inputDataList[0][2],
        inputDataList[0][3],
        inputDataList[0][4],
        inputDataList[0][5],
      ]);
    }
  }

  /// spaceBetweenData = canvas.size.width / ((inputDataList.length + 2) * 2) // TODO: Starting + (spaceBetweenData*2)
}
