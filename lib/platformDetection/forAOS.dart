import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/advertisement_Widget/advertisement_Widget.dart';
import 'package:fluttercompletelibrary/canvasCharts/dataSet/dataHandler.dart';
import 'package:fluttercompletelibrary/canvasTesting/smallChart/small_chartContainer.dart';
import 'package:fluttercompletelibrary/fullActivity/chartParameterModel.dart';
import 'package:fluttercompletelibrary/fullActivity/fullActivityContainer.dart';
import 'package:fluttercompletelibrary/loginPage/login_tabSections.dart';
import 'package:fluttercompletelibrary/platformDetection/widgetRouteName.dart';
import 'package:fluttercompletelibrary/quotesPage_nss_Core/homPage.dart';
import 'package:fluttercompletelibrary/quotesPage_withJava/quotesPage_hardCode.dart';
import 'package:provider/provider.dart';

Widget widgetRoute(String route) {
  switch (route) {
    case advertisementWidget_routeName:
      return MaterialApp(
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(12, 24, 34, 1),
        ),
        home: SafeArea(
          child: Scaffold(
            body: AdvertisementWidget(),
          ),
        ),
      );
    case loginPageWidget_routeName:
      return MaterialApp(
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(12, 24, 34, 1),
        ),
        home: SafeArea(
          child: Scaffold(
              body: Container(
            child: TabSection(),
          )),
        ),
      );
    // TODO: White Screen Errors

    case sc_volChartWidget_routeName:
      return MaterialApp(
        home: SafeArea(
          child: Scaffold(
            body: Container(
              child: SmallChartContainer(
                dataList_info: dataHandler(),
                // todo: "volChart" & "candlesTickChart"
                chartType: "volChart",
              ),
            ),
          ),
        ),
      );

    case sc_candlesTickWidget_routeName:
      return MaterialApp(
        home: SafeArea(
          child: Scaffold(
            body: Container(
              child: SmallChartContainer(
                dataList_info: dataHandler(),
                // todo: "volChart" & "candlesTickChart"
                chartType: "candlesTickChart",
              ),
            ),
          ),
        ),
      );

    case sc_areaChartWidget_routeName:
      return MaterialApp(
        home: SafeArea(
          child: Scaffold(
            body: Container(
              child: SmallChartContainer(
                dataList_info: dataHandler(),
                // todo: "volChart" & "candlesTickChart" & "areaChart"
                chartType: "areaChart",
              ),
            ),
          ),
        ),
      );

//    case canvasChartWidget_routeName:
//      return MaterialApp(
//        home: SafeArea(
//          child: Scaffold(
//              body: ChartContainer(
//                dataList_info: dataHandler(),
//              )),
//        ),
//      );

    // TODO: Black Screen Errors - SharePreference
    case qp_NssCoreWidget_routeName:
      return new MaterialApp(
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(12, 24, 34, 1),
        ),
        home: new HomePage(),
      );

    case qp_CommunicationWidget_routeName:
      return MaterialApp(
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(12, 24, 34, 1),
        ),
        home: SafeArea(
            child: QuotePage(
          FID_CURRENCY: "HK",
          FID_NOMINAL: "1.20",
          FID_CHANGE: "1.700",
          FID_HIGH: "71.150",
          FID_OPEN: "70.550",
          FID_LOW: "69.150",
          FID_PER_CHANGE: "1.700",
          FID_CLOSE: "70.600",
          FID_TURNOVER: "334442283.918",
          FID_VOLUME: "4803689.0",
          FID_NO_OF_TRANS: "1560",
          FID_BOARDLOT: "500",
          FID_VALUE: "3.17",
          FID_DPS: "3.17",
          FID_PE_RATIO: "6.869",
          FID_PERCENT_YIELD: "4.564",
          FID_EXPECT_PE_RATIO: "9999",
          FID_EXPECT_PERCENT_YIELD: "99999",
          FID_1M_HIGH: "73.3",
          FID_52W_HIGH: "88.28",
          FID_1M_LOW: "65.8",
          FID_52W_LOW: "63.43",
          FID_RSI14: "51.404",
          FID_SMA_10: "71.39",
          FID_MARKET_CAP: "267815902725",
          FID_SMA_20: "69.806",
          FID_SHORTSELL: "22439375.0",
          FID_SMA_50: "70.821",
          key: UniqueKey(),
        )),
      );

    case fullScreenChartWidget_routeName:
      final chartModel = ChartModel();
      return ChangeNotifierProvider.value(
        value: chartModel,
        child: new MaterialApp(
          showPerformanceOverlay: false,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
//          primaryColor: Color.fromRGBO(12, 24, 34, 1),
              ),
          home: new FullActivityContainer(
            chartModel: chartModel,
          ),
        ),
      );

    default:
      final chartModel = ChartModel();
      return ChangeNotifierProvider.value(
        value: chartModel,
        child: new MaterialApp(
          showPerformanceOverlay: false,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
//          primaryColor: Color.fromRGBO(12, 24, 34, 1),
              ),
          home: new FullActivityContainer(
            chartModel: chartModel,
          ),
        ),
      );
  }
}

String getRoutePageName(String route) {
  String routePageName = route;
  debugPrint("\nPrint the whole routing data\n");
  debugPrint(route);
  if (route.indexOf("?") != -1)
    // Take the String before the ? of the route -> Behind the ? there are routing parameter
    routePageName = route.substring(0, route.indexOf("?"));
  print("RoutePageName:" + routePageName);
  return routePageName;
}

String parsingNativeParams(String route) {
  Map<String, dynamic> nativeParams = {};
  if (route.indexOf("?") != -1) {
    nativeParams = json.decode(route.substring(route.indexOf("?") + 1));
    debugPrint(
        "\n\n\nCheck stockParams \n\n${nativeParams["stockParams"]}\n\n\n");
//    debugPrint("\n\n\nCheck stockDetailParams \n\n${nativeParams["stockDetail"]}\n\n\n");
    // TODO: nativeParams['stockPrice']['fieldName']
  }
  return nativeParams['stockParams'] ?? "{}";
}

String parsingSpaceParams(String stockPrice) {
  debugPrint("Check $stockPrice \n\n\n");
  String parsingSpaceParams;
  // ignore: unrelated_type_equality_checks
  if (stockPrice.indexOf(":") == true) {
    parsingSpaceParams =
        json.decode(stockPrice.substring(stockPrice.indexOf(":") + 1));
    parsingSpaceParams = parsingSpaceParams.toString();
    debugPrint("Check parsingSpaceParams \n\n\n");
    // TODO: nativeParams['stockPrice']['fieldName']
  }
  return parsingSpaceParams;
}
