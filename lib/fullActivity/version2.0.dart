// TODO: Testing for the factoryConstructors
import 'package:intl/intl.dart';

void main() {}
//abstract class EtNetChart{
//
//}

// TODO: 1: typeChart 2:

// Factory Override the behaviour

class EtNetChart {
  EtNetChart(this.unHandledDataList, this.dataListNum, this.isEnableVertGrid,
      this.isEnableHoriGrid, this.shiftNumDataNum);

  Future<DateFormat> get formatter async => new DateFormat('dd-MM-yyyy');
  static Set<String> timeDomainList = new Set();

  // TODO:  ChartFeature
  final bool isEnableVertGrid, isEnableHoriGrid;

  final int shiftNumDataNum;
  final int dataListNum;
  static int numOfWindowDataRange;

  /// Default/Min is 5

  final List<List> unHandledDataList;
  static List<List> tempHandledDataList = new List<List>();
  static List<List> croppingNestedDataList = new List<List>();

  static var highPrice, lowPirce, highVol, lowVol, priceDiff;

  /// limitationValue of highPrice, lowPrice & highVol
  static var highPriceLimit, lowPriceLimit, highVolLimit;

  static var startCropNum;
  static var endCropNum;

  // TODO: Default si get the whole dataSet from 0 to the dataList.length - 1
//  static var startCropNum = tempHandledDataList.length;
//  static var endCropNum = ;

  // TODO: update CropListRange ->  updateChartProperty(it may depend on different chartType) ->
  void updateCropListRange({bool isWholeChart}) {
    if (isWholeChart) {
      endCropNum = tempHandledDataList.length - 1;
      startCropNum = 0;
    } else {
      endCropNum = tempHandledDataList.length - 1;
      startCropNum = tempHandledDataList.length - 1 - dataListNum;
    }
  }
}
