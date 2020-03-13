import 'dart:io';

import 'package:flutter/services.dart';
import "package:flutter/widgets.dart";

void closeFlutter({BuildContext context}) {
  NavigatorUtil.close(context);
}

class NavigatorUtil extends Navigator {
  static const MethodChannel _methodChannel =
      const MethodChannel('com.test.native_flutter/navigator');

  static bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }

  static bool pop<T extends Object>(BuildContext context, [T result]) {
    //移除当前焦点
    FocusScope.of(context).requestFocus(FocusNode());
    if (canPop(context)) {
      return Navigator.pop(context, result);
    } else {
      Platform.isIOS ? iOSPop(animated: true) : SystemNavigator.pop();
    }
  }
//  iOSPop(animated: true)
  static void close(BuildContext context) {
    //移除当前焦点
    FocusScope.of(context).requestFocus(FocusNode());
    Platform.isIOS ? iOSPop(animated: true) : SystemNavigator.pop();
  }

  @optionalTypeArgs
  static Future<T> push<T extends Object>(
      BuildContext context, Route<T> route) {
    // 移除当前焦点
    FocusScope.of(context).requestFocus(FocusNode());
    return Navigator.push(context, route);
  }

  ///   Switch to Native   ///
  static Future<String> nativePop() async {
    return await _methodChannel.invokeMethod('pop');
  }

  static Future<void> iOSPop({bool animated}) async {
    return await SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop', animated);
//    return await _methodChannel.invokeMethod('pop');
  }
}
