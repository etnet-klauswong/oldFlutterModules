import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/fullActivity/selectedDropButton/dialogPage.dart';

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
        color: Colors.greenAccent,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return DialogPage();
              });
        },
        child: Text(
          "選項",
          style: TextStyle(fontSize: 15),
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

Dialog dialogPage({@required BuildContext context}) {
  return Dialog(
    child: Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.orangeAccent,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Container(
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              "主圖指標(最多1種)",
                              style: TextStyle(fontSize: 30),
                              maxLines: 1,
                              maxFontSize: 20,
                              textAlign: TextAlign.center,
                            )),

                        //主圖指標
                      ),
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                flex: 5,
                                child: FlatButton(
                                    padding: EdgeInsets.all(7),
                                    child: AutoSizeText(
                                      "參數設置",
                                      style: TextStyle(fontSize: 25),
                                      maxLines: 1,
                                      maxFontSize: 25,
                                      textAlign: TextAlign.center,
                                    ),
                                    onPressed: () => {}
//                                      Navigator.push(
//                                      context,
//                                      MaterialPageRoute(
//                                          builder: (context) =>
//                                              ParametersSettingPage())),
                                    )),
                            Expanded(
                                flex: 3,
                                child: FlatButton(
                                  padding: EdgeInsets.all(7),
                                  child: AutoSizeText(
                                    "確定",
                                    style: TextStyle(fontSize: 30),
                                    maxLines: 1,
                                    maxFontSize: 30,
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () => Navigator.pop(context),
                                )),
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
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "SMA",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "簡單移動平均線",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
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
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "EMA",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "指數移動平均線",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
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
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "WMA",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "加權移動平均線",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
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
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "BB",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "保力加通道",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
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
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "SAR",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "拋物線",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
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
                  color: Colors.orangeAccent,
                  child: Row(
                    children: <Widget>[
                      //"技術指標(最多4種)"
                      Expanded(
                        flex: 5,
                        child: Container(
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            child: AutoSizeText(
                              "技術指標(最多4種)",
                              style: TextStyle(fontSize: 30),
                              maxLines: 1,
                              maxFontSize: 20,
                              textAlign: TextAlign.center,
                            )),

                        //主圖指標
                      ),
                      Expanded(
                          flex: 5,
                          child: Container(
                            color: Colors.transparent,
                          )
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
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "DMI",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "趨向指標",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
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
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "MACD",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "移動平均匯聚背馳指標",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
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
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "OBV",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "浄值成交量",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
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
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "ROC",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "變動速度指標",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
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
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "RSI",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "相對強弱指數",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
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
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "STC-Fast",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "變動速度指標",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
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
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "STC-Slow",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "相對強弱指數",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
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
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "VOL",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "成交量",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
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
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "WILL %R",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 4,
                                child: AutoSizeText(
                                  "威廉指數",
                                  style: TextStyle(fontSize: 20),
                                  maxLines: 1,
                                  maxFontSize: 20,
                                  textAlign: TextAlign.center,
                                )),
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
    ),
  );
}

//
// TODO: parametersPage
dialogContent({@required BuildContext context}) {
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
                color: Colors.orangeAccent,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            "主圖指標(最多1種)",
                            style: TextStyle(fontSize: 30),
                            maxLines: 1,
                            maxFontSize: 20,
                            textAlign: TextAlign.center,
                          )),

                      //主圖指標
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              flex: 5,
                              child: FlatButton(
                                  padding: EdgeInsets.all(7),
                                  child: AutoSizeText(
                                    "參數設置",
                                    style: TextStyle(fontSize: 25),
                                    maxLines: 1,
                                    maxFontSize: 25,
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () => {}
//                                    Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) =>
//                                            ParametersSettingPage())),
                                  )),
                          Expanded(
                              flex: 3,
                              child: FlatButton(
                                padding: EdgeInsets.all(7),
                                child: AutoSizeText(
                                  "確定",
                                  style: TextStyle(fontSize: 30),
                                  maxLines: 1,
                                  maxFontSize: 30,
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () => Navigator.pop(context),
                              )),
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
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "SMA",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "簡單移動平均線",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
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
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "EMA",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "指數移動平均線",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
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
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "WMA",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "加權移動平均線",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
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
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "BB",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "保力加通道",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
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
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "SAR",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "拋物線",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
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
                color: Colors.orangeAccent,
                child: Row(
                  children: <Widget>[
                    //"技術指標(最多4種)"
                    Expanded(
                      flex: 5,
                      child: Container(
                          margin: EdgeInsets.all(5),
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            "技術指標(最多4種)",
                            style: TextStyle(fontSize: 30),
                            maxLines: 1,
                            maxFontSize: 20,
                            textAlign: TextAlign.center,
                          )),

                      //主圖指標
                    ),
                    Expanded(
                        flex: 5,
                        child: Container(
                          color: Colors.transparent,
                        )
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
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "DMI",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "趨向指標",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
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
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "MACD",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "移動平均匯聚背馳指標",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
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
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "OBV",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "浄值成交量",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
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
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "ROC",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "變動速度指標",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
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
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "RSI",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "相對強弱指數",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
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
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "STC-Fast",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "變動速度指標",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
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
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "STC-Slow",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "相對強弱指數",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
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
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "VOL",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "成交量",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
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
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "WILL %R",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                          Expanded(
                              flex: 4,
                              child: AutoSizeText(
                                "威廉指數",
                                style: TextStyle(fontSize: 20),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
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
