import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/platformDetection/forAOS.dart';
import 'package:fluttercompletelibrary/platformDetection/forIOS.dart';

Map<String, dynamic> routePageParams;
// TODO: flutter_modules as a aar
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isIOS) {
    kReloadChannel.setMessageHandler(run);
    run(window.defaultRouteName);
  } else if (Platform.isAndroid) {
    runApp(widgetRoute(window.defaultRouteName));
  }
}
