import 'package:fluttercompletelibrary/fullActivity/dataHandler/oneSecDataSet(old_to_current).dart';

// TODO: There are few ways to
/// Transforming existing streams (from EtNetCore written by java)
/// - Common Transformations
///   - map()
///   - where()
///   - expand()
///   - take()
/// Creating a stream from scratch by using an async* function.
/// Creating a stream by using a StreamController.

void main() {
//  var counterStream =
//  Stream<int>.periodic(Duration(seconds: 1), (x) => x).take(15);
//  counterStream.forEach((e){
//    print(e);
//  });

  _stream();

//  print(DateTime.fromMillisecondsSinceEpoch(1574991000000));
//  _stream();
}

List<List<dynamic>> tempStorage = new List<List<dynamic>>();

void _stream() async {
  int limtOfData = 0;
  Duration interval = Duration(seconds: 1);
  Stream<List> stream = Stream.periodic(interval, (data) {
    limtOfData++;
    return old_to_current_oneSecDataSet[data];
  });
  stream = stream.takeWhile((data) {
    return limtOfData < old_to_current_oneSecDataSet.length;
  });

  await for (List i in stream) {
//    tempStorage.add(i);

    var currentDataTime = new DateTime.fromMillisecondsSinceEpoch(i[0]);
    print("$limtOfData $currentDataTime\n");
  }
}

// TODO: List<List<dynamic>>
