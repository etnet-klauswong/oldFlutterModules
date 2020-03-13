import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/canvasCharts/dataSet/dataHandler.dart';
import 'package:fluttercompletelibrary/nss_core/singleQuote.dart';
import 'package:fluttercompletelibrary/quotesPage_nss_Core/MaterialStyle.dart';
import 'package:fluttercompletelibrary/quotesPage_nss_Core/methodChannel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nss_core/nss_core.dart';

//window.physicalSize     //获取屏幕尺寸px----1080.0, 2196.0
//window.devicePixelRatio //设备像素比----3
//MediaQuery.of(context).size  //获得的是dp单位:360.0, 732.0
class FlutterChartView extends CustomPainter {
  // TODO:
  Paint mHelpPaint;
  BuildContext context;
  FlutterChartView(this.context) {
    mHelpPaint = new Paint();
    mHelpPaint.style = PaintingStyle.stroke;
    mHelpPaint.color = Color(0xffBBC3C5);
    mHelpPaint.isAntiAlias = true;
  }
  @override
  void paint(Canvas canvas, Size size) {
    var winSize = MediaQuery.of(context).size;
    canvas.drawPath(gridPath(30, winSize), mHelpPaint);
    canvas.drawLine(Offset(0, 0), Offset(50, 10), mHelpPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

  Path gridPath(int step, Size winSize) {
    Path path = new Path();

    for (int i = 0; i < winSize.height / step + 1; i++) {
      path.moveTo(0, step * i.toDouble());
      path.lineTo(winSize.width, step * i.toDouble());
    }

    for (int i = 0; i < winSize.width / step + 1; i++) {
      path.moveTo(step * i.toDouble(), 0);
      path.lineTo(step * i.toDouble(), winSize.height);
    }
    return path;
  }

  drawCoo(Canvas canvas, Size coo, Size winSize) {
    //初始化网格画笔
    Paint paint = new Paint();
    paint.strokeWidth = 2;
    paint.style = PaintingStyle.stroke;

    //绘制直线
    canvas.drawPath(cooPath(coo, winSize), paint);
    //左箭头
    canvas.drawLine(new Offset(winSize.width, coo.height),
        new Offset(winSize.width - 10, coo.height - 6), paint);
    canvas.drawLine(new Offset(winSize.width, coo.height),
        new Offset(winSize.width - 10, coo.height + 6), paint);
    //下箭头
    canvas.drawLine(new Offset(coo.width, winSize.height - 90),
        new Offset(coo.width - 6, winSize.height - 10 - 90), paint);
    canvas.drawLine(new Offset(coo.width, winSize.height - 90),
        new Offset(coo.width + 6, winSize.height - 10 - 90), paint);
  }

  Path cooPath(Size coo, Size winSize) {
    Path path = new Path();
    //x正半轴线
    path.moveTo(coo.width, coo.height);
    path.lineTo(winSize.width, coo.height);
    //x负半轴线
    path.moveTo(coo.width, coo.height);
    path.lineTo(coo.width - winSize.width, coo.height);
    //y负半轴线
    path.moveTo(coo.width, coo.height);
    path.lineTo(coo.width, coo.height - winSize.height);
    //y负半轴线
    path.moveTo(coo.width, coo.height);
    path.lineTo(coo.width, winSize.height);
    return path;
  }
}

// ignore: missing_return
List<Widget> stockDetail(BuildContext context) {
  return [
    ExpansionTile(
      title: Text(
        "Stock Detail",
        style: stockStyle,
      ),
      backgroundColor: backgroundColors,
      initiallyExpanded: false,
      children: <Widget>[
        Container(
//          height: MediaQuery.of(context).size.height / 2,
          child: Column(
            children: [
              buildTablePanel(),
            ],
          ),
        ),
      ],
    ),
  ];
}

List<Row> listOfTransactionDetail;

List<Widget> transactionDetail(BuildContext context) {
  dynamic checkType;
  checkType = fallbackFilter(dataStream[HK_FID_TRANSQUEUE]);
  return [
    ExpansionTile(
      title: Text(
        "Treansaction Record",
        style: stockStyle,
      ),
      backgroundColor: backgroundColors,
      initiallyExpanded: false,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Container(
                  child: Center(
                    child: Text(
                      "時間",
                      style: stockStyle.copyWith(fontSize: 15),
                    ),
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  child: Center(
                    child: Text(
                      "B/A",
                      style: stockStyle.copyWith(fontSize: 15),
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  child: Center(
                    child: Text(
                      "股數",
                      style: stockStyle.copyWith(fontSize: 15),
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  child: Center(
                    child: Text(
                      "成交價",
                      style: stockStyle.copyWith(fontSize: 15),
                    ),
                  ),
                )),
            Expanded(
                flex: 2,
                child: Container(
                  child: Center(
                    child: Text(
                      "成交金额",
                      style: stockStyle.copyWith(fontSize: 15),
                    ),
                  ),
                )),
          ],
        ),
        Container(
          height: MediaQuery.of(context).size.height / 5,
          child: Text(
            (fallbackFilter(dataStream[HK_FID_TRANSQUEUE])),
            style: TextStyle(color: Colors.white),
          ),
        ),
        Container(
          child: Text(
            (checkType.runtimeType.toString()),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    )
  ];
}

List<Widget> transaction(BuildContext context) {}

List<Widget> stockPrice(BuildContext context) {
  fidCurrency = fallbackFilter<String>(
      dataStream[HK_FID_CURRENCY], (v) => v.substring(0, 3));
  findChange = fallbackFilter<double>(dataStream[HK_FID_CHANGE], (v) {
    if (v > 0) {
      stockIsUp = true;
    } else {
      stockIsUp = false;
    }
    return v.toStringAsFixed(2);
    // ignore: missing_return
  });
  findPerChange = fallbackFilter<double>(
      dataStream[HK_FID_PER_CHANGE], (v) => v.toStringAsFixed(3));
  fidHigh = fallbackFilter<double>(
      dataStream[HK_FID_HIGH], (v) => v.toStringAsFixed(3));
  fidOpen = fallbackFilter<double>(
      dataStream[HK_FID_OPEN], (v) => v.toStringAsFixed(3));
  fidLow = fallbackFilter<double>(
      dataStream[HK_FID_LOW], (v) => v.toStringAsFixed(3));
  fidClose = fallbackFilter<double>(
      dataStream[HK_FID_CLOSE], (v) => v.toStringAsFixed(3));
  fidNominal = fallbackFilter<double>(
      dataStream[HK_FID_NOMINAL], (v) => v.toStringAsFixed(3));
  return [
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              new SizedBox(
                width: 70.0,
                height: 40.0,
                child: GestureDetector(
                  // TODO: Tap the StockCode Input Button to Change the Stock -> This Button Should Be pop up the NumKeyBoard for user input and search
                  onTap: () {
                    if (nssCoreService.asaLoadComplete.value) {
                      position = position + 1;
                      if (position >= codeList.length) {
                        position = 0;
                      }
                      print('[SingleQuote] changeCode ' + codeList[position]);
                      nssCoreService.nssCore.verbose();
                      quoteSubscriber
                        ..unsubscribe()
                        ..codes([codeList[position]])
                        ..fields(fields)
                        ..subscribe();
                      print(
                          '[SingleQuote] finished, dump some report for current state');
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightBlue, width: 1),
                        color: Color.fromRGBO(50, 62, 77, 1),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Text(
                      codeList[position],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              new Text(dataStream['2'] ?? "--",
                  style: TextStyle(color: Colors.white, fontSize: 20))
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  color: Colors.red,
                  child: InkWell(
                      child: Text(
                        "DD",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        getChartUtil("D1");
                      }),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4),
                ),
                Container(
                  color: Colors.blue,
                  child: InkWell(
                      child: Text(
                        "DD",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        getChartUtil("D1");
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    new SizedBox(
        child: Column(children: <Widget>[
      Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: new Text(fidCurrency, style: stockKey),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: stockIsUp
                              ? EdgeInsets.only(top: 20)
                              : EdgeInsets.only(bottom: 20),
                          child: Icon(
                            stockIsUp
                                ? FontAwesomeIcons.sortUp
                                : FontAwesomeIcons.sortDown,
                            size: 55,
                            color: stockIsUp
                                ? Color.fromRGBO(77, 225, 51, 1)
                                : Colors.red,
                          ),
                        ),
                      ),
                      new Expanded(
                          flex: 4,
                          child: new Text(
                            fidNominal,
                            style: stockIsUp
                                ? stockCurrentPriceUp
                                : stockCurrentPriceDown,
                            textAlign: TextAlign.end,
                          )),
                    ],
                  ),

                  //tryParse(findChange) > 0 ? stockIsUp = true : stockIsUp = false;
                  new Container(
                    alignment: Alignment.centerRight,
                    child: new Text(
                      (stockIsUp ? "+" + findChange : findChange) +
                          "(" +
                          (stockIsUp ? "+" + findPerChange : findPerChange) +
                          "%" +
                          ")",
                      style: stockIsUp ? stockDiffPriceWin : stockDiffPriceLost,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: new Text("高",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Expanded(
                              flex: 5,
                              child: new Text(
                                fidHigh,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
//                          child: _buildKeyValueItem(
//                              '高', _fallbackFilter<double>(stream[FID_HIGH], (v) => v.toStringAsFixed(2))),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: new Text(" 開",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Expanded(
                              flex: 5,
                              child: new Text(
                                fidOpen,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: new Text("低",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Expanded(
                              flex: 5,
                              child: new Text(
                                fidLow,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
//                          child: _buildKeyValueItem(
//                              '高', _fallbackFilter<double>(stream[FID_HIGH], (v) => v.toStringAsFixed(2))),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: new Text(" 前",
                                  style: TextStyle(color: Colors.white)),
                            ),
                            Expanded(
                              flex: 5,
                              child: new Text(
                                fidClose,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      color: Colors.blue.withOpacity(0.2),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "買入",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(Icons.arrow_right)),
                            ],
                          ),
                          Text(
                            "46.900",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
//                              child: new Text(" 前", style: TextStyle(color: Colors.white)),
                      onPressed: () => debugPrint("FullChart PopUp"),
                    ),
                    RaisedButton(
                      color: Colors.red.withOpacity(0.2),
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "賣出",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(Icons.arrow_right)),
                            ],
                          ),
                          Text(
                            "46.950",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
//                              child: new Text(" 前", style: TextStyle(color: Colors.white)),
                      onPressed: () => debugPrint("FullChart PopUp"),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.all(5.0),
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height / 6,
                    child: ChartUtil()),
              ],
            ),
          ),
        ],
      ),
    ]))
  ];
}

// TODO: Yeah

//    new Container(
//      width: MediaQuery.of(context).size.width/2,
//      height: 1000,
//      child: Column(
//        children: <Widget>[
//          Container(
//            margin: EdgeInsets.only(left: 5.0),
//            padding: EdgeInsets.only(left: 5.0),
//            alignment: Alignment.centerLeft,
//            child: new Text("HKD", style: stockKey),
//          ),
//          new Row(
//            children: <Widget>[
//              new Expanded(
//                flex:2,
//                child: Container(
//                  margin: isStockPriceGood?  EdgeInsets.only(top: 20) : EdgeInsets.only(bottom: 20),
//                  child: Icon(isStockPriceGood? FontAwesomeIcons.sortUp : FontAwesomeIcons.sortDown, size: 55,
//                    color: isStockPriceGood?  Color.fromRGBO(77, 225, 51, 1) : Colors.red,),
//                ),
//              ),
//              new Expanded(
//                  flex:3,
//                  child: new Text("${ctPrice.toString()}", style: ctPrice > beforePrice?  stockCurrentPriceUp: stockCurrentPriceDown,textAlign: TextAlign.end,)
//              ),
//            ],
//          ),
//          new Container(
//            alignment: Alignment.centerRight,
//            child: new Text(
//              isStockUp ? "+${diffPrice.toStringAsFixed(3)}+(${diffPriceInPercent.toStringAsFixed(2)}%)" : "${diffPrice.toStringAsFixed(3)}(${diffPriceInPercent.toStringAsFixed(2)}%)",
//              style: isStockUp ? stockDiffPriceWin :stockDiffPriceLost, textAlign: TextAlign.end,),),
//          new Expanded(
//            child: GridView.count(
//              crossAxisCount: 2,
//              childAspectRatio: 8/2,
//              children: List.generate(keyStockInfo.length -3, (index) {
//                return Container(
//                  margin: (index%2 == 0)? EdgeInsets.only(left: 5.0) : EdgeInsets.only(left: 10.0),
//                  padding: (index%2 == 0)? EdgeInsets.only(left: 5.0) : EdgeInsets.only(left: 10.0),
//                  child: new Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      new Text(keyStockInfo[index +3], style: stockKey),
//                      new Text(keyStockInfoForUpdate[index +3].toStringAsFixed(3), style: stockValue),
//                    ],
//                  ),
//                );
//              }),
//            ),
//          )
//        ],
//      ),
//    ),
//    ChartUtil(),
//    StockInfo(),

Widget build(Color color, String key1, String value1,
    [String key2, String value2]) {
  return Container(
    color: color,
    child: Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: buildKeyValueItem(key1, value1),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(5),
            child: buildKeyValueItem(key2 ?? "", value2 ?? ""),
          ),
        )
      ],
    ),
  );
}

Widget buildKeyValueItem(String title, String value) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        title,
        style: TextStyle(
          color: Color.fromRGBO(66, 118, 155, 1),
        ),
      ),
      Text(
        value,
        style: TextStyle(
          color: Colors.lime,
        ),
      ),
    ],
  );
}

Widget buildTablePanel() {
  Widget _build(Color color, String key1, String value1,
      [String key2, String value2]) {
    return Column(
      children: <Widget>[
        Container(
          color: color,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: buildKeyValueItem(key1, value1),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: buildKeyValueItem(key2 ?? "", value2 ?? ""),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  return Container(
    padding: EdgeInsets.only(top: 5),
    child: Column(
      children: <Widget>[
        _build(
            Color.fromRGBO(27, 36, 45, 1),
            "成交金額",
            fallbackFilter(dataStream[HK_FID_TURNOVER]),
            "成交股數",
            fallbackFilter(dataStream[HK_FID_VOLUME])),
        _build(
            Color.fromRGBO(19, 29, 35, 1),
            "交易宗數",
            fallbackFilter(dataStream[HK_FID_NO_OF_TRANS]),
            "每手股數",
            fallbackFilter<double>(
                dataStream[HK_FID_BOARDLOT], (v) => v.toStringAsFixed(0))),
        _build(Color.fromRGBO(27, 36, 45, 1), "帳面淨值", "", "每股派息",
            fallbackFilter(dataStream[HK_FID_DPS])),
        _build(
            Color.fromRGBO(19, 29, 35, 1),
            "市盈率",
            fallbackFilter(dataStream[HK_FID_PE_RATIO]),
            "周息率",
            fallbackFilter(dataStream[HK_FID_PERCENT_YIELD])),
        _build(
            Color.fromRGBO(27, 36, 45, 1),
            "預測市盈",
            fallbackFilter(dataStream[HK_FID_EXPECT_PE_RATIO]),
            "預測周息",
            fallbackFilter(dataStream[HK_FID_EXPECT_PERCENT_YIELD])),
        _build(
            Color.fromRGBO(19, 29, 35, 1),
            "1個月高",
            fallbackFilter(dataStream[HK_FID_1M_HIGH]),
            "52周高",
            fallbackFilter(dataStream[HK_FID_52W_HIGH])),
        _build(
            Color.fromRGBO(27, 36, 45, 1),
            "1個月低",
            fallbackFilter(dataStream[HK_FID_1M_LOW]),
            "52周低",
            fallbackFilter(dataStream[HK_FID_52W_LOW])),
        _build(
            Color.fromRGBO(19, 29, 35, 1),
            "14天RSI",
            fallbackFilter(dataStream[HK_FID_RSI14]),
            "10天平均",
            fallbackFilter(dataStream[HK_FID_SMA_10])),
        _build(
            Color.fromRGBO(27, 36, 45, 1),
            "市值",
            fallbackFilter(dataStream[HK_FID_MARKET_CAP]),
            "20天平均",
            fallbackFilter(dataStream[HK_FID_SMA_20])),
        _build(
            Color.fromRGBO(19, 29, 35, 1),
            "沽空",
            fallbackFilter(dataStream[HK_FID_SHORTSELL]),
            "50天平均",
            fallbackFilter(dataStream[HK_FID_SMA_50])),
//          _build(Color.fromRGBO(27, 36, 45, 1)),
//          _build(Color.fromRGBO(19, 29, 35, 1)),
//          _build(Color.fromRGBO(27, 36, 45, 1)),
      ],
    ),
  );
}

class StockInfo extends StatefulWidget {
  @override
  _StockInfoWidget createState() => _StockInfoWidget();
}

class _StockInfoWidget extends State<StockInfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExpansionTile(
      title: Text(
        "Stock Detail",
        style: stockStyle,
      ),
      backgroundColor: backgroundColors,
      initiallyExpanded: false,
      children: <Widget>[
//        Container(
//          height: MediaQuery.of(context).size.height/3,
//          child: GridView.count(
//            // Create a grid with 2 columns. If you change the scrollDirection to
//            // horizontal, this would produce 2 rows.
//            crossAxisCount: 2,
//            childAspectRatio: 10/2,
//            // Generate 100 Widgets that display their index in the List
//            children: List.generate(stockInfoTableName.length, (index) {
//              return Container(
//                color: (index==0 || index==1 || index==4 || index==5 || index==8 || index==9 || index==12 || index==13 || index==16 || index==17 || index==20 || index==21) ? Colors.white24.withOpacity(0.1) : Colors.white10.withOpacity(0),
//                margin: (index%2 == 0)? EdgeInsets.only(left: 5.0) : EdgeInsets.only(left: 5.0, right: 5.0),
//                padding: (index%2 == 0)? EdgeInsets.only(left: 5.0) : EdgeInsets.only(left: 5.0, right: 5.0),
//                child: new Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    new Text(stockInfoTableName[index], style: stockKey),
//                    // TODO: This is the key of the File
//                    new Text(fallbackFilter(dataStream[stockInfoStreamName[index]]), style: stockValue),
//
//                      // TODO: Duplicate File
////                    new Text(fallbackFilter(dataStream[stockInfoStreamName[index]]), style: stockValue),
//
//
//                    //fallbackFilter<double>(dataStream[HK_FID_NOMINAL], (v) => v.toStringAsFixed(3))
//
//
//                    //fallbackFilter(stream[FID_1M_LOW])
//                    // TODO: fallbackFilter(stream[stockInfoStreamName[index]])
//                  ],
//                ),
//              );
//            }),
//          ),
//        ),
      ],
    );
  }
}

// TODO: ChartUtil
class ChartUtil extends StatefulWidget {
  @override
  _ChartUtilWidget createState() => _ChartUtilWidget();
}

class _ChartUtilWidget extends State<ChartUtil> {
  List<List> dataList_info;
  @override
  void initState() {
    super.initState();
    dataList_info = dataHandler();
  }

  static String typeOfSmallChart = "D1";
  static String nameOfAndroidView = "SmallChartView";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.redAccent,
      child: Column(
        children: <Widget>[
          Expanded(
            // TODO: AndroidView
            child: Column(
              children: <Widget>[
                Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // TODO: FullScreen AndroidView -> It return a View(SmallChart) / an Activity(FullChart)
                    InkWell(
                        child: Text(
                          "D1",
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
//                              getChartUtil("D1");
                        }),
                    InkWell(
                        child: Text(
                          "D5",
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
//                            getChartUtil("D5");
                        }),
                    InkWell(
                        child: Text(
                          "M3",
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
//                            getChartUtil("M3");
                        }),
                    InkWell(
                        child: Text(
                          "Y1",
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
//                            getChartUtil("Y1");
                        }),
                    // TODO: SmallScreen Widget AndroidView(Limited Widget Area) -> With a Flutter Widget UI Structure
                    InkWell(
                        child: Text(
                          "Y5",
                          style: TextStyle(color: Colors.black),
                        ),
                        onTap: () {
//                            getChartUtil("Y5");
                        }),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    // todo: testing
                    child: Container(
                      color: Colors.deepPurpleAccent,
                    ),
//                    child: SmallChartContainer(
//                      dataList_info: dataHandler(),
//                      // todo: "volChart" & "candlesTickChart" & "areaChart"
//                      chartType: "areaChart",
//                    ),
//                    child: Container(
//                      color: Colors.yellowAccent,
//                    ),
//                    SmallChartContainer(
//                      dataList_info: dataHandler(),
//                      // todo: "volChart" & "candlesTickChart" & "areaChart"
//                      chartType: "areaChart",
//                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buttonAppBar() {
  // TODO: ButtonNavigationBar to a TabBar
//  return TabBar(
//    indicatorColor: Colors.white,
//    tabs: <Widget>[
//      Tab(
//        text: "報價",
//        icon: new Icon(Icons.home, color: Colors.white),
//      ),
//      Tab(
//        text: "排名",
//        icon: new Icon(Icons.sort, color: Colors.white),
//      ),
//      Tab(
//        text: "組合",
//        icon: Icon(Icons.person, color: Colors.white),
//      ),
//      Tab(
//        text: "選單",
//        icon: Icon(Icons.menu, color: Colors.white),
//      ),
//
//    ],
//  );
  return BottomNavigationBar(
      backgroundColor: backgroundColors,
      // TODO: Did not have Navigate Right Now
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: new Icon(Icons.home, color: Colors.white),
          title: const Text(
            '報價',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: new Icon(Icons.sort, color: Colors.white),
          title: const Text(
            '排名',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person, color: Colors.white),
          title: const Text(
            '組合',
            style: TextStyle(color: Colors.white),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu, color: Colors.white),
          title: const Text(
            '選單',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ]);
}

// TODO: Change a StockView to Class
//TabController sectionTabController;
//sectionTabController.addListener(listener){
//
//};

//// TODO: New stockView
//List<Widget> stockView (BuildContext context){
//  return [
//    Container(
//      height: 25,
//      width: MediaQuery.of(context).size.width,
//      child: MarqueeWidget(
//        text: "恒指: 26506.75 +55.72       期指: 26572.00 +55.72",
//        textStyle: new TextStyle(fontSize:  16.0, color: Colors.white),
//        scrollAxis: Axis.horizontal,
//      ),
//    ),
////    TabBar(
////      controller: sectionTabController,
////      isScrollable: true,
////      indicatorColor: Colors.white,
////      tabs: sectionTabs.map((e) => Tab(text: e,)).toList(),
////    ),
//    // TODO: Raymond - MarketRotator
////    MarketRotator(),
//  ];
//}

List<Widget> tabBar(BuildContext context) {
  return [
    TabBar(
      isScrollable: true,
      tabs: <Widget>[
        Tab(
          text: "報價",
        ),
        Tab(text: '經紀掛盤'),
        Tab(text: '資金流向'),
        Tab(text: '相關新聞'),
        Tab(text: '同行比較'),
        Tab(text: '公司資料'),
      ],
    ),
//    TabBar(
//      controller: sectionTabController,
//      isScrollable: true,
//      indicatorColor: Colors.white,
//      tabs: sectionTabs.map((e) => Tab(text: e,)).toList(),
//    ),
    // TODO: Raymond - MarketRotator
//    MarketRotator(),
  ];
}

class MarqueeWidget extends StatefulWidget {
  final String text;
  final TextStyle textStyle;

  ///滚动方向，水平或者垂直
  final Axis scrollAxis;

  ///空白部分占控件的百分比
  final double ratioOfBlankToScreen;
  MarqueeWidget({
    @required this.text,
    this.textStyle,
    this.scrollAxis: Axis.horizontal,
    this.ratioOfBlankToScreen: 0.25,
  }) : assert(
          text != null,
        );
  @override
  State<StatefulWidget> createState() {
    return new MarqueeWidgetState();
  }
}

class MarketRotator extends StatelessWidget implements PreferredSizeWidget {
  MarketRotator();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(20, 61, 80, 1),
      height: 20.0,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    '恒指',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      '26506.75 +55.72',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    '期指*',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Text(
                      '26572.00 +55.72',
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(20.0);
}

class MarqueeWidgetState extends State<MarqueeWidget>
    with SingleTickerProviderStateMixin {
  ScrollController scroController;
  double screenWidth;
  double screenHeight;
  double position = 0.0;
  Timer marqueeTimer;
  final double _moveDistance = 3.0;
  final int _timerRest = 150;
  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    scroController = new ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      startTimer();
    });
  }

  void startTimer() {
    double widgetWidth =
        _key.currentContext.findRenderObject().paintBounds.size.width;
    double widgetHeight =
        _key.currentContext.findRenderObject().paintBounds.size.height;

    marqueeTimer =
        Timer.periodic(new Duration(milliseconds: _timerRest), (timer) {
      double maxScrollExtent = scroController.position.maxScrollExtent;
      double pixels = scroController.position.pixels;
      if (pixels + _moveDistance >= maxScrollExtent) {
        if (widget.scrollAxis == Axis.horizontal) {
          //TODO 我也看不懂怎么算的
          position = (maxScrollExtent -
                      screenWidth * widget.ratioOfBlankToScreen +
                      widgetWidth) /
                  2 -
              widgetWidth +
              pixels -
              maxScrollExtent;
        } else {
          position = (maxScrollExtent -
                      screenHeight * widget.ratioOfBlankToScreen +
                      widgetHeight) /
                  2 -
              widgetHeight +
              pixels -
              maxScrollExtent;
        }
        scroController.jumpTo(position);
      }
      position += _moveDistance;
      scroController.animateTo(position,
          duration: new Duration(milliseconds: _timerRest),
          curve: Curves.linear);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }

  Widget getBothEndsChild() {
    if (widget.scrollAxis == Axis.vertical) {
      String newString = widget.text.split("").join("\n");
      return new Center(
//        child: new Text(newString,style: widget.textStyle,textAlign: TextAlign.center,),
          child: new Text(
        widget.text,
        style: widget.textStyle,
      ));
    }
    return new Center(
        child: new Text(
      widget.text,
      style: widget.textStyle,
    ));
  }

  Widget getCenterChild() {
    if (widget.scrollAxis == Axis.horizontal) {
      return new Container(width: screenWidth * widget.ratioOfBlankToScreen);
    } else {
      return new Container(height: screenHeight * widget.ratioOfBlankToScreen);
    }
  }

  @override
  void dispose() {
    super.dispose();
    marqueeTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView(
      key: _key,
      scrollDirection: widget.scrollAxis,
      controller: scroController,
      physics: new NeverScrollableScrollPhysics(),
      children: <Widget>[
        getBothEndsChild(),
        getCenterChild(),
        getBothEndsChild(),
      ],
    );
  }
}

// TODO: Need to Customer A AppBar
Widget customAppBar(BuildContext context) {
  return new Column(
    children: <Widget>[
      new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.mail,
              color: Colors.white,
            ),
            tooltip: 'Mail',
            onPressed: () {},
          ),
          PopupMenuButton<String>(
            onSelected: (string) {},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            itemBuilder: (BuildContext context) {
              return <String>['關於'].map((String menu) {
                return PopupMenuItem<String>(
                  value: menu,
                  child: Text(menu),
                );
              }).toList();
            },
          ),
        ],
      ),
      Container(
        width: MediaQuery.of(context).size.width / 2,
        child: Row(
          children: <Widget>[],
        ),
      ),
    ],
  );
}

class StockPrice extends StatefulWidget {
  final String fidCurrency,
      fidNominal,
      fidChange,
      findPerChange,
      fidHigh,
      fidOpen,
      fidLow,
      fidClose;
  StockPrice({
    @required this.fidCurrency,
    @required this.fidNominal,
    @required this.fidChange,
    @required this.findPerChange,
    @required this.fidHigh,
    @required this.fidLow,
    @required this.fidOpen,
    @required this.fidClose,
  });

  @override
  _StockPriceWidget createState() => _StockPriceWidget();
}

class _StockPriceWidget extends State<StockPrice> {
  _StockPriceWidget();
  @override
  Widget build(BuildContext context) {
    bool stockIsUp;
    double.parse(widget.fidChange) > 0 ? stockIsUp = true : stockIsUp = false;
    // TODO: implement build
    return Flex(
      direction: Axis.vertical,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Row(
                children: <Widget>[
                  new SizedBox(
                    width: 70.0,
                    height: 40.0,
                    child: GestureDetector(
                      // TODO: Tap the StockCode Input Button to Change the Stock -> This Button Should Be pop up the NumKeyBoard for user input and search
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.lightBlue, width: 1),
                            color: Color.fromRGBO(50, 62, 77, 1),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text(
                          "00423",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  new Text("經濟日報集團",
                      style: TextStyle(color: Colors.white, fontSize: 20))
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      color: Colors.red,
                      child: InkWell(
                          child: Text(
                            "DD",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
//                            getChartUtil("D1");
                          }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4),
                    ),
                    Container(
                      color: Colors.blue,
                      child: InkWell(
                          child: Text(
                            "DD",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
//                            getChartUtil("D1");
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        new SizedBox(
            child: Column(children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Column(
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: new Text(widget.fidCurrency, style: stockKey),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: stockIsUp
                                  ? EdgeInsets.only(top: 20)
                                  : EdgeInsets.only(bottom: 20),
                              child: Icon(
                                stockIsUp
                                    ? FontAwesomeIcons.sortUp
                                    : FontAwesomeIcons.sortDown,
                                size: 55,
                                color: stockIsUp
                                    ? Color.fromRGBO(77, 225, 51, 1)
                                    : Colors.red,
                              ),
                            ),
                          ),
                          new Expanded(
                              flex: 4,
                              child: new Text(
                                widget.fidNominal,
                                style: stockIsUp
                                    ? stockCurrentPriceUp
                                    : stockCurrentPriceDown,
                                textAlign: TextAlign.end,
                              )),
                        ],
                      ),

                      //tryParse(findChange) > 0 ? stockIsUp = true : stockIsUp = false;
                      new Container(
                        alignment: Alignment.centerRight,
                        child: new Text(
                          (stockIsUp
                                  ? "+" + widget.fidChange
                                  : widget.fidChange) +
                              "(" +
                              (stockIsUp
                                  ? "+" + widget.findPerChange
                                  : widget.findPerChange) +
                              "%" +
                              ")",
                          style: stockIsUp
                              ? stockDiffPriceWin
                              : stockDiffPriceLost,
                          textAlign: TextAlign.end,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: new Text("高",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: new Text(
                                    widget.fidHigh,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
//                          child: _buildKeyValueItem(
//                              '高', _fallbackFilter<double>(stream[FID_HIGH], (v) => v.toStringAsFixed(2))),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: new Text(" 開",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: new Text(
                                    widget.fidOpen,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: new Text("低",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: new Text(
                                    widget.fidLow,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
//                          child: _buildKeyValueItem(
//                              '高', _fallbackFilter<double>(stream[FID_HIGH], (v) => v.toStringAsFixed(2))),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: new Text(" 前",
                                      style: TextStyle(color: Colors.white)),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: new Text(
                                    widget.fidClose,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            color: Colors.blue.withOpacity(0.2),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "買入",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: Icon(Icons.arrow_right)),
                                  ],
                                ),
                                Text(
                                  "46.900",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
//                              child: new Text(" 前", style: TextStyle(color: Colors.white)),
                            onPressed: () => debugPrint("FullChart PopUp"),
                          ),
                          RaisedButton(
                            color: Colors.red.withOpacity(0.2),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "賣出",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: Icon(Icons.arrow_right)),
                                  ],
                                ),
                                Text(
                                  "46.950",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            ),
//                              child: new Text(" 前", style: TextStyle(color: Colors.white)),
                            onPressed: () => debugPrint("FullChart PopUp"),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                          color: Colors.transparent,
                          height: MediaQuery.of(context).size.height / 6,
                          child: ChartUtil()),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ])),
      ],
    );
  }
}

double mobilePhysicalSize_Height = window.physicalSize.height;
double mobilePhysicalSize_Width = window.physicalSize.width;
double mobilePixel_Ratio = window.devicePixelRatio;
