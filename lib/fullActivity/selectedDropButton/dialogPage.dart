import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/fullActivity/parametersListView/listOf_parameterListView.dart';

class ParameterList {
  final String parameterName_short;
  final String parameterName_full;
  final String optionalParameter_1;
  final String optionalParameter_2;
  final String optionalParameter_3;
  final String optionalParameter_4;
  final int parametersNum;

  ParameterList(
      {@required this.parameterName_short,
      @required this.parameterName_full,
      this.optionalParameter_1,
      this.optionalParameter_2,
      this.optionalParameter_3,
      this.optionalParameter_4,
      this.parametersNum}) {}
}

class DialogPage extends StatefulWidget {
  @override
  DialogPageState createState() => new DialogPageState();
}

List<Widget> viewOfParameterList = new List<Widget>();
List<Widget> buttonOfParameterList = new List<Widget>();

class DialogPageState extends State<DialogPage> {
  List<ParameterList> parametersList = [
    ParameterList(
      parameterName_short: "SMA",
      parameterName_full: "簡單移動平均線",
      optionalParameter_1: "1st MA Line",
      optionalParameter_2: "2st MA Line",
      optionalParameter_3: "3st MA Line",
      optionalParameter_4: "4st MA Line",
      parametersNum: 4,
    ),
    ParameterList(
      parameterName_short: "EMA",
      parameterName_full: "指數移動平均線",
      optionalParameter_1: "1st MA Line",
      optionalParameter_2: "2st MA Line",
      optionalParameter_3: "3st MA Line",
      optionalParameter_4: "4st MA Line",
      parametersNum: 4,
    ),
    ParameterList(
      parameterName_short: "WMA",
      parameterName_full: "加權移動平均線",
      optionalParameter_1: "1st MA Line",
      optionalParameter_2: "2st MA Line",
      optionalParameter_3: "3st MA Line",
      optionalParameter_4: "4st MA Line",
      parametersNum: 4,
    ),
    ParameterList(
      parameterName_short: "BB",
      parameterName_full: "保力加通道",
      optionalParameter_1: "Intervals",
      optionalParameter_2: "No. of Std. Dev",
      parametersNum: 2,
    ),
    ParameterList(
      parameterName_short: "SAR",
      parameterName_full: "拋物線",
      optionalParameter_1: "Acceleration Factor",
      optionalParameter_2: "Max Acceleration Factor",
      parametersNum: 2,
    ),
    ParameterList(
      parameterName_short: "DMI",
      parameterName_full: "趨向指標",
      optionalParameter_1: "Intervals",
      parametersNum: 1,
    ),
    ParameterList(
      parameterName_short: "MACD",
      parameterName_full: "移動平均匯聚背馳指標",
      optionalParameter_1: "MACD1",
      optionalParameter_2: "MACD2",
      optionalParameter_3: "Diff",
      parametersNum: 3,
    ),
    ParameterList(
      parameterName_short: "OBV",
      parameterName_full: "浄值成交量",
      optionalParameter_1: "Weighted Closing",
      optionalParameter_2: "Closing Price",
      parametersNum: 2,
    ),
    ParameterList(
      parameterName_short: "ROC",
      parameterName_full: "變動速度指標",
      optionalParameter_1: "Intervals",
      parametersNum: 1,
    ),
    ParameterList(
      parameterName_short: "RSI",
      parameterName_full: "相對強弱指數",
      optionalParameter_1: "Intervals",
      optionalParameter_2: "SMA for RSI",
      parametersNum: 2,
    ),
    ParameterList(
      parameterName_short: "STC-Fast",
      parameterName_full: "變動速度指標",
      optionalParameter_1: "%K",
      optionalParameter_2: "%D",
      parametersNum: 2,
    ),
    ParameterList(
      parameterName_short: "STC-Slow",
      parameterName_full: "相對強弱指數",
      optionalParameter_1: "%SK",
      optionalParameter_2: "%SD",
      parametersNum: 2,
    ),
    ParameterList(
      parameterName_short: "VOL",
      parameterName_full: "成交量",
      optionalParameter_1: "SMA for VOL",
      parametersNum: 1,
    ),
    ParameterList(
      parameterName_short: "WILL %R",
      parameterName_full: "威廉指數",
      optionalParameter_1: "Intervals",
      optionalParameter_2: "SMA for WILL %R",
      parametersNum: 2,
    ),
  ];

  Widget getParametersTextButton(
      {@required List<ParameterList> listOfParameter}) {
    for (int i = 0; i < listOfParameter.length; i++) {
      if (listOfParameter[i].parametersNum != null) {
        for (int j = 2; j <= (2 + listOfParameter[i].parametersNum); j++) {
          buttonOfParameterList.add(Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: AutoSizeText(
                  parametersList[i].optionalParameter_1.toString(),
                  style: TextStyle(fontSize: 20),
                  maxLines: 1,
                  maxFontSize: 20,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                flex: 4,
                child: FlatButton(
                  child: TextField(
                    keyboardType: TextInputType.number,
                  ),
                ),
              ),
            ],
          ));
        }
      }
    }
  }

  Widget getViewOfParameterList(
      {@required List<ParameterList> listOfParameter}) {
    for (int i = 0; i < parametersList.length; i++) {
      dynamic tempList = listOfParameter;
      debugPrint(parametersList[i].parameterName_short);
      viewOfParameterList.add(Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: AutoSizeText(
                    parametersList[i].parameterName_short.toString(),
                    style: TextStyle(fontSize: 30),
                    maxLines: 1,
                    maxFontSize: 20,
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: AutoSizeText(
                    parametersList[i].parameterName_full.toString(),
                    style: TextStyle(fontSize: 30),
                    maxLines: 1,
                    maxFontSize: 20,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            parametersList.length > 2
                ? Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Expanded(flex: 10, child: listOf_parameterListView[i]),
                        Expanded(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: FlatButton(
                                child: Container(
                                  margin: EdgeInsets.all(3),
                                  child: AutoSizeText(
                                    "重設預設數字",
                                    style: TextStyle(fontSize: 30),
                                    maxLines: 2,
                                    maxFontSize: 20,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onPressed: () =>
                                    debugPrint("Reset those Data!!!"),
                              ),
                            )),
                      ],
                    ),
                  )
                : Container(
                    color: Colors.blueAccent,
                  )
          ],
        ),
      ));
    }
    return new Row(
      children: viewOfParameterList,
    );
  }

  int currentListNum = 1;

  Widget getListOfParameterWidget(
      {@required List<ParameterList> listOfParameter}) {
    List<Widget> listOfParameterWidget = new List<Widget>();
    for (int i = 0; i < parametersList.length; i++) {
      listOfParameterWidget.add(
        Container(
          alignment: Alignment.center,
          child: FlatButton(
              padding: EdgeInsets.all(0),
              color: Colors.transparent,
              child: AutoSizeText(
                parametersList[i].parameterName_short.toString(),
                style: TextStyle(fontSize: 20),
                maxLines: 1,
                maxFontSize: 20,
                textAlign: TextAlign.start,
              ),
              onPressed: () {
                debugPrint(parametersList[i].parameterName_full.toString());
                setState(() {
                  currentListNum = i;
                });
              }),
        ),
      );
    }
    return new Column(
      children: listOfParameterWidget,
    );
  }

  bool isDialogPage = true;
  @override
  Widget build(BuildContext context) {
    getParametersTextButton(listOfParameter: parametersList);
    getViewOfParameterList(listOfParameter: parametersList);
    // TODO: implement build

    void switchSettingPage() {
      setState(() {
        isDialogPage = false;
      });
    }

    void returnDialogPage() {
      setState(() {
        isDialogPage = true;
      });
    }

    // ignore: missing_return
    Widget currentPageSetting({bool isDialogPage}) {
      if (isDialogPage) {
        return Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
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
                                onPressed: () => switchSettingPage(),
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
            Container(
              height: MediaQuery.of(context).size.height / 1000,
//              color: Colors.deepPurpleAccent,
              child: Divider(
                thickness: 4,
                color: Colors.black.withOpacity(0.2),
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
            Container(
              height: MediaQuery.of(context).size.height / 1000,
//              color: Colors.deepPurpleAccent,
              child: Divider(
                color: Colors.black.withOpacity(0.2),
                thickness: 4,
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
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
            Container(
              height: MediaQuery.of(context).size.height / 1000,
//              color: Colors.deepPurpleAccent,
              child: Divider(
                color: Colors.black.withOpacity(0.2),
                thickness: 4,
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
        );
      } else {
        return Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: <Widget>[
                          IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                returnDialogPage();
                              }),
                          Container(
                              margin: EdgeInsets.all(5),
                              alignment: Alignment.centerLeft,
                              child: AutoSizeText(
                                "參數設置",
                                style: TextStyle(fontSize: 30),
                                maxLines: 1,
                                maxFontSize: 20,
                                textAlign: TextAlign.center,
                              )),
                        ],
                      ),

                      //主圖指標
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 5,
                            child: Container(
                              child: null,
                            ),
                          ),
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
            Container(
              height: MediaQuery.of(context).size.height / 1000,
//              color: Colors.deepPurpleAccent,
              child: Divider(
                thickness: 4,
                color: Colors.black.withOpacity(0.2),
              ),
            ),
            Expanded(
                flex: 11,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 4,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: getListOfParameterWidget(
                              listOfParameter: parametersList),
                        ),
                      ),
                      Container(
                        child: Divider(
                          thickness: 4,
                          color: Colors.black.withOpacity(0.2),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: viewOfParameterList[currentListNum],
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        );
      }
    }

    return Dialog(
      child: Stack(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.6,
            child: currentPageSetting(isDialogPage: isDialogPage),
          ),
        ],
      ),
    );
  }
}
