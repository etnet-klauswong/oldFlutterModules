import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/materialComponents/MaterialStyle.dart';
import 'package:fluttercompletelibrary/quotesPage_withJava/chartUtilWidget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class StockPriceWidget extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String FID_CURRENCY,
      FID_NOMINAL,
      FID_CHANGE,
      FID_PER_CHANGE,
      FID_HIGH,
      FID_OPEN,
      FID_LOW,
      FID_CLOSE;
  StockPriceWidget(
      {
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
      Key key})
      : super(key: key);
  @override
  _StockPriceWidget createState() => _StockPriceWidget();
}

class _StockPriceWidget extends State<StockPriceWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    bool stockIsUp;
    double.parse(widget.FID_CHANGE) > 0 ? stockIsUp = true : stockIsUp = false;
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
                  new Text("經濟日報集團", style: TextStyle(fontSize: 20))
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
                        child: new Text(widget.FID_CURRENCY, style: stockKey),
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
                                widget.FID_NOMINAL,
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
                                  ? "+" + widget.FID_CHANGE
                                  : widget.FID_CHANGE) +
                              "(" +
                              (stockIsUp
                                  ? "+" + widget.FID_PER_CHANGE
                                  : widget.FID_PER_CHANGE) +
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
                                  child: new Text("高"),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: new Text(
                                    widget.FID_HIGH,
                                    textDirection: TextDirection.rtl,
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
                                  child: new Text(" 開"),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: new Text(
                                    widget.FID_OPEN,
                                    textDirection: TextDirection.rtl,
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
                                  child: new Text("低"),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: new Text(
                                    widget.FID_LOW,
                                    textDirection: TextDirection.rtl,
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
                                  child: new Text(" 前"),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: new Text(
                                    widget.FID_CLOSE,
                                    textDirection: TextDirection.rtl,
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
//                          onPressed: () => TransactionFAB(true),
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
                    Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.all(5.0),
                        color: Colors.transparent,
                        height: MediaQuery.of(context).size.height / 6,
                        child: ChartUtilWidget()),
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
