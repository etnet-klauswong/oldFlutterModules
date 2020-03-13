import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/quotesPage_withJava/stockDetailWidget.dart';
import 'package:fluttercompletelibrary/quotesPage_withJava/stockPriceWidget.dart';

// ignore: must_be_immutable
class QuotePage extends StatefulWidget {
  final Function toggleTheme;
  final Function handleUpdate;
  final Function savePreferences;

  final bool darkEnabled;
  final String themeMode;

  final Function switchOLED;
  final bool darkOLED;

  // ignore: non_constant_identifier_names
  String FID_CURRENCY,
      FID_NOMINAL,
      FID_CHANGE,
      FID_PER_CHANGE,
      FID_HIGH,
      FID_OPEN,
      FID_LOW,
      FID_CLOSE,
      // ignore: non_constant_identifier_names
      FID_TURNOVER,
      FID_VOLUME,
      FID_EXPECT_PE_RATIO,
      FID_EXPECT_PERCENT_YIELD,
      FID_NO_OF_TRANS,
      FID_BOARDLOT,
      FID_VALUE,
      FID_DPS,
      FID_PE_RATIO,
      // ignore: non_constant_identifier_names
      FID_PERCENT_YIELD,
      FID_1M_HIGH,
      FID_52W_HIGH,
      FID_1M_LOW,
      FID_52W_LOW,
      FID_RSI14,
      FID_SMA_10,
      FID_MARKET_CAP,
      FID_SMA_20,
      FID_SHORTSELL,
      FID_SMA_50;
  QuotePage(
      {
      // TODO: Theme
      this.toggleTheme,
      this.savePreferences,
      this.handleUpdate,
      this.darkEnabled,
      this.themeMode,
      this.switchOLED,
      this.darkOLED,
      // ignore: non_constant_identifier_names
      @required this.FID_CURRENCY,
      @required this.FID_NOMINAL,
      @required this.FID_CHANGE,
      // ignore: non_constant_identifier_names
      @required this.FID_PER_CHANGE,
      @required this.FID_HIGH,
      @required this.FID_LOW,
      // ignore: non_constant_identifier_names
      @required this.FID_OPEN,
      @required this.FID_CLOSE,
      // ignore: non_constant_identifier_names
      @required this.FID_TURNOVER,
      @required this.FID_VOLUME,
      @required this.FID_EXPECT_PE_RATIO,
      @required this.FID_EXPECT_PERCENT_YIELD,
      // ignore: non_constant_identifier_names
      @required this.FID_NO_OF_TRANS,
      @required this.FID_BOARDLOT,
      @required this.FID_VALUE,
      @required this.FID_DPS,
      @required this.FID_PE_RATIO,
      // ignore: non_constant_identifier_names
      @required this.FID_PERCENT_YIELD,
      @required this.FID_1M_HIGH,
      @required this.FID_52W_HIGH,
      @required this.FID_1M_LOW,
      // ignore: non_constant_identifier_names
      @required this.FID_52W_LOW,
      @required this.FID_RSI14,
      @required this.FID_SMA_10,
      @required this.FID_MARKET_CAP,
      @required this.FID_SMA_20,
      // ignore: non_constant_identifier_names
      @required this.FID_SHORTSELL,
      @required this.FID_SMA_50,
      Key key})
      : super(key: key);
  @override
  QuotePageState createState() => new QuotePageState();
}

class QuotePageState extends State<QuotePage> {
  final List<String> _tabValues = [
    "報價",
    "經紀掛盤",
    "資金流向",
    "相關新聞",
    "同行比較",
    "公司資料",
  ];
  TabController _tabController;
  TextEditingController _textController = new TextEditingController();
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new SingleChildScrollView(
        scrollDirection: Axis.vertical, //TODO: Default Vertical
//        padding: const EdgeInsets.all(0.0),
        child: Column(
          children: [
//            StockViewWidget(),
            StockPriceWidget(
              FID_CURRENCY: widget.FID_CURRENCY,
              FID_NOMINAL: widget.FID_NOMINAL,
              FID_CHANGE: widget.FID_CHANGE,
              FID_HIGH: widget.FID_HIGH,
              FID_OPEN: widget.FID_OPEN,
              FID_LOW: widget.FID_LOW,
              FID_PER_CHANGE: widget.FID_PER_CHANGE,
              FID_CLOSE: widget.FID_CLOSE,
              key: UniqueKey(),
            ),
            StockDetailWidget(
              FID_TURNOVER: widget.FID_TURNOVER,
              FID_VOLUME: widget.FID_VOLUME,
              FID_NO_OF_TRANS: widget.FID_NO_OF_TRANS,
              FID_BOARDLOT: widget.FID_BOARDLOT,
              FID_VALUE: widget.FID_VALUE,
              FID_DPS: widget.FID_DPS,
              FID_PE_RATIO: widget.FID_PE_RATIO,
              FID_PERCENT_YIELD: widget.FID_PERCENT_YIELD,
              FID_EXPECT_PE_RATIO: widget.FID_EXPECT_PE_RATIO,
              FID_EXPECT_PERCENT_YIELD: widget.FID_EXPECT_PERCENT_YIELD,
              FID_1M_HIGH: widget.FID_1M_HIGH,
              FID_52W_HIGH: widget.FID_52W_HIGH,
              FID_1M_LOW: widget.FID_1M_LOW,
              FID_52W_LOW: widget.FID_52W_LOW,
              FID_RSI14: widget.FID_RSI14,
              FID_SMA_10: widget.FID_SMA_10,
              FID_MARKET_CAP: widget.FID_MARKET_CAP,
              FID_SMA_20: widget.FID_SMA_20,
              FID_SHORTSELL: widget.FID_SHORTSELL,
              FID_SMA_50: widget.FID_SMA_50,
            ),
          ],
        ),
      ),
    );
  }
}
