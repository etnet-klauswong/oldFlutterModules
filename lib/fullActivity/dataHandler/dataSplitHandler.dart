import 'package:fluttercompletelibrary/fullActivity/dataHandler/oneSecDataSet(old_to_current).dart';

void main() {
  print(old_to_current_oneSecDataSet);

  // TODO: Get the oneLine of dataSet & split them into a List & save to new file
//  List<List> oneSecDataSet = new List();
//  List splitListElement;
//  List tempStoreOneSecDataSet = new List();
//  var oneSecDataFile = File("oneSecData.dart")
//      .openRead()
//      .transform(utf8.decoder)
//      .transform(new LineSplitter())
//      .forEach((DataListElement) {
//    splitListElement = DataListElement.split(" ");
//    for (int i = 0; i < splitListElement.length; i++) {
//      tempStoreOneSecDataSet.add(splitListElement[i].toString().split(","));
//    }
//    print(tempStoreOneSecDataSet[0].runtimeType);
//    new File('oneSecDataSet(current_to_old).dart').writeAsStringSync(
//        "List<List> tempStoreOneSecDataSet = $tempStoreOneSecDataSet");
//    // _stream();
//  });

  // TODO: Get back the current oneSecDataSet(current_to_old) transform to oneSecDataSet(old_to_current)
//  tempStoreOneSecDataSet;
//  List<List<dynamic>> old_to_current_oneSecDataSet = new List<List<dynamic>>();
//  for (int i = tempStoreOneSecDataSet.length - 1; i >= 0; i--) {
//    old_to_current_oneSecDataSet.add(tempStoreOneSecDataSet[i]);
//  }
//  new File('oneSecDataSet(old_to_current).dart').writeAsStringSync(
//      "List<List> old_to_current_oneSecDataSet = $old_to_current_oneSecDataSet ;");
}

// TODO: dataStream
//void _stream() async{
//  int limtOfData = 0;
//  Duration interval = Duration(seconds: 1);
//  Stream<List> stream = Stream.periodic(interval, (data){
//    limtOfData++;
//    return originalChartDataList[data];
//  });
//  stream = stream.takeWhile((data){
//    return  limtOfData < 5;
//  });
//
//  await for(List i in stream ){
//    print("$limtOfData     $i");
//  }
//}

// TODO:  BoardCast - Streams // TODO: Infinit Number of the listener to the stream
