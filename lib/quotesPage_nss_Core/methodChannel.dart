import 'package:flutter/services.dart';

const MethodChannel chartPlatformChanel =  MethodChannel('ETnet/ChartUtil');

Future<void> getChartUtil(String input) async{
  print("Send Chart Request\n\n\n");
  await chartPlatformChanel.invokeMethod(input);
}
