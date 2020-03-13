import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexTypeSelectedDropButton extends StatefulWidget {
  @override
  IndexTypeSelectedDropButtonState createState() =>
      new IndexTypeSelectedDropButtonState();
}

class IndexTypeSelectedDropButtonState
    extends State<IndexTypeSelectedDropButton> {
  final indexFormKey = GlobalKey<FormState>();
  String serverValue = "1";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: RaisedButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  child: dialogContent(context: context),
                );
              });
        },
        child: Text(
          "指標",
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

dialogContent({BuildContext context}) {
  return Stack(
    children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.yellowAccent,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 7,
                      child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("主圖指標(最多1種)")),

                      //主圖指標
                    ),
                    Expanded(
                      flex: 4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            child: Text("參數設置"),
                            onTap: () => print("參數設置"),
                          ),
                          InkWell(
                            child: Container(
                                padding: EdgeInsets.only(right: 20),
                                child: Text("確定")),
                            onTap: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView(
                padding: EdgeInsets.only(left: 5, right: 5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3.0,
                ),
                children: <Widget>[
                  InkWell(
                    child: Container(
//                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
//                      color: Colors.redAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("SMA"),
                          Text("簡單移動平均線"),
                        ],
                      ),
                    ),
                    onTap: () => print("SMA 簡單移動平均線"),
                    splashColor: Colors.redAccent,
                  ),
                  InkWell(
                    child: Container(
//                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
//                      color: Colors.redAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("EMA"),
                          Text("指數移動平均線"),
                        ],
                      ),
                    ),
                    onTap: () => print("EMA 指數移動平均線"),
                    splashColor: Colors.redAccent,
                  ),
                  InkWell(
                    child: Container(
//                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
//                      color: Colors.redAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("WMA"),
                          Text("加權移動平均線"),
                        ],
                      ),
                    ),
                    onTap: () => print("WMA 加權移動平均線"),
                    splashColor: Colors.redAccent,
                  ),
                  InkWell(
                    child: Container(
//                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
//                      color: Colors.redAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("BB"),
                          Text("保力加通道"),
                        ],
                      ),
                    ),
                    onTap: () => print("BB 保力加通道"),
                    splashColor: Colors.redAccent,
                  ),
                  InkWell(
                    child: Container(
//                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
//                      color: Colors.redAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("SAR"),
                          Text("拋物線"),
                        ],
                      ),
                    ),
                    onTap: () => print("SAR 拋物線"),
                    splashColor: Colors.redAccent,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.yellowAccent,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Text("技術指標(最多4種)")),
                      //主圖指標
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: GridView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(left: 5, right: 5),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3.0,
                ),
                children: <Widget>[
                  InkWell(
                    child: Container(
//                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
//                      color: Colors.redAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("DMI"),
                          Text("趨向指標"),
                        ],
                      ),
                    ),
                    onTap: () => print("DMI 趨向指標"),
                    splashColor: Colors.redAccent,
                  ),
                  InkWell(
                    child: Container(
//                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
//                      color: Colors.redAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("MACD"),
                          Text("移動平均匯聚背馳指標"),
                        ],
                      ),
                    ),
                    onTap: () => print("MACD 移動平均匯聚背馳指標"),
                    splashColor: Colors.redAccent,
                  ),
                  InkWell(
                    child: Container(
//                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
//                      color: Colors.redAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("OBV"),
                          Text("浄值成交量"),
                        ],
                      ),
                    ),
                    onTap: () => print("OBV 浄值成交量"),
                    splashColor: Colors.redAccent,
                  ),
                  InkWell(
                    child: Container(
//                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
//                      color: Colors.redAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("ROC"),
                          Text("變動速度指標"),
                        ],
                      ),
                    ),
                    onTap: () => print("ROC 變動速度指標"),
                    splashColor: Colors.redAccent,
                  ),
                  InkWell(
                    child: Container(
//                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
//                      color: Colors.redAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("RSI"),
                          Text("相對強弱指數"),
                        ],
                      ),
                    ),
                    onTap: () => print("RSI 相對強弱指數"),
                    splashColor: Colors.redAccent,
                  ),
                  InkWell(
                    child: Container(
//                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
//                      color: Colors.redAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("STC-Fast"),
                          Text("變動速度指標"),
                        ],
                      ),
                    ),
                    onTap: () => print("STC-Fast 變動速度指標"),
                    splashColor: Colors.redAccent,
                  ),
                  InkWell(
                    child: Container(
//                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
//                      color: Colors.redAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("STC-Slow"),
                          Text("相對強弱指數"),
                        ],
                      ),
                    ),
                    onTap: () => print("STC-Slow 相對強弱指數"),
                    splashColor: Colors.redAccent,
                  ),
                  InkWell(
                    child: Container(
//                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
//                      color: Colors.redAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("VOL"),
                          Text("成交量"),
                        ],
                      ),
                    ),
                    onTap: () => print("VOL 成交量"),
                    splashColor: Colors.redAccent,
                  ),
                  InkWell(
                    child: Container(
//                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5),
//                      color: Colors.redAccent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("WILL %R"),
                          Text("威廉指數"),
                        ],
                      ),
                    ),
                    onTap: () => print("WILL %R 威廉指數"),
                    splashColor: Colors.redAccent,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
