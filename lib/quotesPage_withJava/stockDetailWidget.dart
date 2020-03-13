import 'package:flutter/material.dart';

final backgroundColors = Color.fromRGBO(12, 24, 34, 0.85);

class StockDetailWidget extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String FID_TURNOVER,
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
  StockDetailWidget({
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
  });

  @override
  _StockDetailWidget createState() => _StockDetailWidget();
}

class _StockDetailWidget extends State<StockDetailWidget> {
  Widget _build(
      Color color, String key1, String value1, String key2, String value2) {
    return Column(
      children: <Widget>[
        Container(
          color: color,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: buildKeyValueItem(key1, value1),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: buildKeyValueItem(key2, value2),
                ),
              )
            ],
          ),
        ),
      ],
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ExpansionTile(
      title: Text(
        "Stock Detail",
      ),
      backgroundColor: backgroundColors,
      initiallyExpanded: false,
      children: <Widget>[
        Container(
//          height: MediaQuery.of(context).size.height/2,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 5),
                child: Column(
                  children: <Widget>[
                    _build(Color.fromRGBO(27, 36, 45, 1), "成交金額",
                        widget.FID_TURNOVER, "成交股數", widget.FID_VOLUME),
                    _build(Color.fromRGBO(19, 29, 35, 1), "交易宗數",
                        widget.FID_NO_OF_TRANS, "每手股數", widget.FID_BOARDLOT),
                    _build(Color.fromRGBO(27, 36, 45, 1), "帳面淨值",
                        widget.FID_VALUE, "每股派息", widget.FID_DPS),
                    _build(Color.fromRGBO(19, 29, 35, 1), "市盈率",
                        widget.FID_PE_RATIO, "周息率", widget.FID_PERCENT_YIELD),
                    _build(
                        Color.fromRGBO(27, 36, 45, 1),
                        "預測市盈",
                        widget.FID_EXPECT_PE_RATIO,
                        "預測周息",
                        widget.FID_EXPECT_PERCENT_YIELD),
                    _build(Color.fromRGBO(19, 29, 35, 1), "1個月高",
                        widget.FID_1M_HIGH, "52周高", widget.FID_52W_HIGH),
                    _build(Color.fromRGBO(27, 36, 45, 1), "1個月低",
                        widget.FID_1M_LOW, "52周低", widget.FID_52W_LOW),
                    
                    
                    
                    _build(Color.fromRGBO(19, 29, 35, 1), "14天RSI",
                        widget.FID_RSI14, "10天平均", widget.FID_SMA_10),
                    _build(Color.fromRGBO(27, 36, 45, 1), "市值",
                        widget.FID_MARKET_CAP, "20天平均", widget.FID_SMA_20),
                    _build(Color.fromRGBO(19, 29, 35, 1), "沽空",
                        widget.FID_SHORTSELL, "50天平均", widget.FID_SMA_50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
