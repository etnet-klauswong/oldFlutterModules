import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

const BasicMessageChannel<String> kReloadChannel =
    BasicMessageChannel<String>(FlutterMessageChannelName, StringCodec());

Future<String> run(String name) async {
  // The platform-specific component will call [setInitialRoute] on the Flutter
  // view (or view controller for iOS) to set [ui.window.defaultRouteName].
  // We then dispatch based on the route names to show different Flutter
  // widgets.
  // Since we don't really care about Flutter-side navigation in this app, we're
  // not using a regular routes map.
  switch (name) {
    case advertisementWidget_routeName: // TODO: -> advertisementWidget
      runApp(
        MaterialApp(
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
        ),
      );
      break;
    case loginPageWidget_routeName: // TODO: -> loginPageWidget
      runApp(
        MaterialApp(
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
        ),
      );
      break;
    case sc_areaChartWidget_routeName: // TODO: -> sc_areaChartWidget
      runApp(
        MaterialApp(
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
        ),
      );
      break;
    case sc_volChartWidget_routeName: // TODO: -> qp_NssCoreWidget
      runApp(
        MaterialApp(
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
        ),
      );
      break;
    case sc_candlesTickWidget_routeName: // TODO: -> qp_NssCoreWidget
      runApp(
        MaterialApp(
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
        ),
      );
      break;
    case qp_NssCoreWidget_routeName: // TODO: -> qp_NssCoreWidget
      runApp(MaterialApp(
        showPerformanceOverlay: false,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color.fromRGBO(12, 24, 34, 1),
        ),
        home: new HomePage(),
      ));
      break;
    case qp_CommunicationWidget_routeName: // TODO: -> qp_NssCoreWidget
      runApp(MaterialApp(
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
      ));
      break;
    case fullScreenChartWidget_routeName: // TODO: -> qp_NssCoreWidget
      final chartModel = ChartModel();
      runApp(
        ChangeNotifierProvider.value(
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
        ),
      );
      break;
    default:
      final chartModel = ChartModel();
      runApp(
        ChangeNotifierProvider.value(
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
        ),
      );
      break;
  }
  return '';
}
