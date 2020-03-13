
import 'dart:collection';

import 'package:flutter/cupertino.dart';

class ChartModel with ChangeNotifier{
  final List<List> _dataList = new List<List>();

  static int dataSize  = 10;
  static int shiftSteps;
  static int startIndex, endIndex;

//  set updateShiftSteps(int newShiftSteps) {
//    shiftSteps = newShiftSteps;
//  }

  void updateDataSize(int newDataSize) {
    dataSize = newDataSize;
    notifyListeners();
  }

  void updateDataList(List newDataList){
    _dataList.add(newDataList);
//    print(newDataList);
//    print(dataList);
    notifyListeners();
  }

  List<List<dynamic>> get modifyDataList{
//    print(_dataList);
//    return _dataList;
    if(dataSize > _dataList.length && _dataList.length !=0){
      return _dataList;
    } else {
      if(dataSize <= 0){
        dataSize = 0;
      }
      startIndex = _dataList.length - dataSize;
      endIndex = _dataList.length;
      List<List> croppingNestedDataList = _dataList.length == 0 ? _dataList : _dataList.sublist(startIndex,endIndex);
//      print(croppingNestedDataList.toString());
      return croppingNestedDataList;

    }
    // TODO: Consider the shiftingSteps & the dataSize
  }

  // TODO: Default the DataList
}


// TODO: GestureDetector -> Update ChartModel


// TODO:
/*
  Fake Server -> StreamBuilder (update the )
 */