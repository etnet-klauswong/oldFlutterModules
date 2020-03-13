// TODO: include a SafeArea -> Scaffold

import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/fullActivity/canvasChart/ChartPainterController.dart';
import 'package:fluttercompletelibrary/fullActivity/chartParameterModel.dart';
import 'package:fluttercompletelibrary/fullActivity/dataHandler/oneSecDataSet(old_to_current).dart';
import 'package:fluttercompletelibrary/fullActivity/selectedDropButton/chartTypeSelectedDropButton.dart';
import 'package:fluttercompletelibrary/fullActivity/selectedDropButton/colorTypeSelectedDropButton.dart';
import 'package:fluttercompletelibrary/fullActivity/selectedDropButton/indexTypeSelectedDropButton.dart';
import 'package:fluttercompletelibrary/fullActivity/selectedDropButton/timePeriodSelectodDropButton.dart';
import 'package:fluttercompletelibrary/platformChannel/navigatorUtil.dart';
import 'package:provider/provider.dart';

//oneSecDataStream(Duration(seconds: 2),
//(old_to_current_oneSecDataSet.length - 1)),

class DataHandler {
  static List<List> inputDataSet = new List<List>();

  int shiftStepNum;
  void set({@required int shiftNum}) {
    shiftStepNum = shiftNum;
  }

  void addDataSet({List inputData}) {
    inputDataSet.add(inputData);
  }

  List<List> getBackDataSet({@required int numOfDataList}) {
    if (numOfDataList >= inputDataSet.length) {
      return inputDataSet;
    }

    if (numOfDataList <= inputDataSet.length) {
      if (numOfDataList <= 0) {
        numOfDataList = 0;
      }
      List<List> croppingNestedDataList = inputDataSet.sublist(
          inputDataSet.length - numOfDataList, inputDataSet.length);
      return croppingNestedDataList;
    }

//    if(inputDataSet.length <= numOfDataList){
//      List<List> croppingNestedDataList = inputDataSet;
//      return croppingNestedyDataList;
//    }
//      if(inputDataSet.length > numOfDataList){
//        List<List> croppingNestedDataList = inputDataSet.sublist(inputDataSet.length - numOfDataList,numOfDataList -1);
//      return croppingNestedDataList;
//    }
  }
}

class FullActivityContainer extends StatefulWidget {
  final BuildContext context;
  final DataHandler dataHandler;
  final ChartModel chartModel;
  const FullActivityContainer(
      {Key key, this.dataHandler, this.context, this.chartModel})
      : super(key: key);
  @override
  FullActivityContainerState createState() => new FullActivityContainerState();
}

class FullActivityContainerState extends State<FullActivityContainer> {
  int dataListShiftingNum = 0;
  static var horizontalStart_dx = 5.0, horizontalStart_dy;
  static var horizontalUpdate_dx = 10.0, horizontalUpdate_dy;

  _onDragEnd(BuildContext context, DragEndDetails end) {
    if ((horizontalUpdate_dx - horizontalStart_dx) >= 0) {
      dataListShiftingNum =
          ((horizontalUpdate_dx - horizontalStart_dx) / 5).round();
      // Shift to Right Hand Side
    }
    if ((horizontalUpdate_dx - horizontalStart_dx) < 0) {
      dataListShiftingNum =
          ((horizontalUpdate_dx - horizontalStart_dx) / 5).round();
      // Shift to Left Hand Side
    }
    print(dataListShiftingNum);
  }

  _onDragStart(BuildContext context, DragStartDetails start) {
//    print(start.globalPosition.toString());
    RenderBox getBox = context.findRenderObject();
    var local = getBox.globalToLocal(start.globalPosition);
    horizontalStart_dx = local.dx;
    horizontalStart_dy = local.dy;
    print(local.dx.toString() + "|" + local.dy.toString());
  }

  _onDragUpdate(BuildContext context, DragUpdateDetails update) {
//    print(update.globalPosition.toString());
    RenderBox getBox = context.findRenderObject();
    var local = getBox.globalToLocal(update.globalPosition);
    horizontalUpdate_dx = local.dx;
    horizontalUpdate_dy = local.dy;
    print("Relative Shifting Distance as below: \n");

    print(local.dx.toString() + "|" + local.dy.toString());
  }

  GlobalKey _key_ofAreaContainer;
  GlobalKey _key_ofCursorContainer;
  String tapPosition;
  Offset onPanOffSet;
  bool isEnableGrid = true;
  static int defaultDataList = 10;
  int previewDataList;
//  int generatedNewDataList; // TODO: minNum = 10 & maxNum = 30

  Stream<List> oneSecDataStream(Duration interval, [int maxCount]) async* {
    int i = -1;
    while (true) {
      i++;
      await Future.delayed(interval);
      yield old_to_current_oneSecDataSet[i];
      if (i == maxCount) break;
    }
  }

//  void listenHandleData() async{
//    oneSecDataStream(Duration(seconds: 1), (old_to_current_oneSecDataSet.length - 1));
//    print(receiveStream);
//  }

  @override
  void initState() {
    super.initState();
    _streamData();
//    listenHandleData();
//    oneSecDataStream(Duration(seconds: 1), (old_to_current_oneSecDataSet.length - 1));
  }

  void _streamData() async {
    int limOfData = 0;
    Duration interval = Duration(seconds: 1);
    Stream<List> stream = Stream.periodic(interval, (data) {
      limOfData++;
      return old_to_current_oneSecDataSet[data];
    });
    await for (List i in stream) {
      widget.chartModel.updateDataList(i);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.14),
            child: Container(
              margin: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                              alignment: Alignment.center,
                              child: Icon(Icons.search)),
                        ),
                        Expanded(
                          flex: 4,
                          child: TextFormField(
                            maxLines: 2,
                            decoration: new InputDecoration.collapsed(
                                hintText: 'HSI\n恆生指數',
                                hintStyle: TextStyle(fontSize: 12)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Flex(
                            direction: Axis.horizontal,
                            children: <Widget>[
                              Expanded(
                                  flex: 6,
                                  child: Container(
                                    padding: EdgeInsets.all(0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Expanded(
                                            //時間
                                            flex: 1,
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              child: AutoSizeText(
                                                "時間", //恆生指數
                                                style: TextStyle(fontSize: 50),
                                                maxLines: 1,
                                                maxFontSize: 25,
                                                textAlign: TextAlign.center,
                                              ),
                                            )),
                                        Expanded(
                                            flex: 1,
                                            child: Container(
                                                alignment: Alignment.topLeft,
                                                child:
                                                    TimePeriodSelectedDropButton()))
                                      ],
                                    ),
                                  )),
                              Expanded(
                                flex: 2,
                                child: IconButton(
                                  icon: Icon(Icons.refresh),
                                  color: Colors.lightBlueAccent,
                                  onPressed: () => debugPrint("Refresh"),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: IconButton(
                                  icon: Icon(Icons.cancel),
                                  color: Colors.lightBlueAccent,
                                  onPressed: () {
                                    Navigator.pop(context);
                                    closeFlutter(context: context);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 5,
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 3),
                                            alignment: Alignment.centerLeft,
                                            child: AutoSizeText(
                                              "開: ",
                                              style: TextStyle(fontSize: 50),
                                              maxLines: 1,
                                              maxFontSize: 30,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 3),
                                            alignment: Alignment.centerLeft,
                                            child: AutoSizeText(
                                              "高: ",
                                              style: TextStyle(fontSize: 50),
                                              maxLines: 1,
                                              maxFontSize: 30,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      children: <Widget>[
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 3, bottom: 3),
                                            alignment: Alignment.centerLeft,
                                            child: AutoSizeText(
                                              "低: ",
                                              style: TextStyle(fontSize: 50),
                                              maxLines: 1,
                                              maxFontSize: 30,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                left: 3, bottom: 3),
                                            alignment: Alignment.centerLeft,
                                            child: AutoSizeText(
                                              "收: ",
                                              style: TextStyle(fontSize: 50),
                                              maxLines: 1,
                                              maxFontSize: 30,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 7,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                          //時間
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            child: AutoSizeText(
                                              "類型", //恆生指數
                                              style: TextStyle(fontSize: 50),
                                              maxLines: 1,
                                              maxFontSize: 25,
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: ChartTypeSelectedDropButton()),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                          //時間
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            child: AutoSizeText(
                                              "颜色", //恆生指數
                                              style: TextStyle(fontSize: 50),
                                              maxLines: 1,
                                              maxFontSize: 25,
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: ColorTypeSelectedDropButton()),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                          //時間
                                          flex: 1,
                                          child: Container(
                                            alignment: Alignment.topLeft,
                                            child: AutoSizeText(
                                              "指標", //恆生指數
                                              style: TextStyle(fontSize: 50),
                                              maxLines: 1,
                                              maxFontSize: 25,
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: IndexTypeSelectedDropButton()),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Colors.blueAccent,
                                    )),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            flex: 1,
                            child: Text(
                              "10-SMA: xxxxx.x",
                              style: TextStyle(fontSize: 11),
                              textAlign: TextAlign.start,
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "20-SMA: xxxxx.x",
                              style: TextStyle(fontSize: 11),
                              textAlign: TextAlign.start,
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "50-SMA: xxxxx.x",
                              style: TextStyle(fontSize: 11),
                              textAlign: TextAlign.start,
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              "100-SMA: xxxxx.x",
                              style: TextStyle(fontSize: 11),
                              textAlign: TextAlign.start,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                flex: 60,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 20,
                      child: Consumer<ChartModel>(
                        builder: (BuildContext buildContext,
                            ChartModel chartModel, Widget child) {
                          return Container(
                            color: Colors.white,
                            child: GestureDetector(
                              // TODO: Drag work  -> for what ? IDK...
//                              onHorizontalDragStart: (DragStartDetails start){
//                                RenderBox getBox = context.findRenderObject();
//                                var local = getBox.globalToLocal(start.globalPosition);
//                                horizontalStart_dx = local.dx;
//                                horizontalStart_dy = local.dy;
////                                print(local.dx.toString() + "|" + local.dy.toString());
//                              },
//                              onHorizontalDragUpdate: (DragUpdateDetails update){
//                                //    print(update.globalPosition.toString());
//                                RenderBox getBox = context.findRenderObject();
//                                var local = getBox.globalToLocal(update.globalPosition);
//                                horizontalUpdate_dx = local.dx;
//                                horizontalUpdate_dy = local.dy;
////                                print("Relative Shifting Distance as below: \n");
////                                print(local.dx.toString() + "|" + local.dy.toString());
//                              },
//                              onHorizontalDragEnd: (DragEndDetails end) {
//                                if ((horizontalUpdate_dx - horizontalStart_dx) >= 0) {
//                                  dataListShiftingNum = ((horizontalUpdate_dx - horizontalStart_dx) / 5).round();
//                                  // Shift to Right Hand Side
//                                }
//                                if ((horizontalUpdate_dx - horizontalStart_dx) < 0) {
//                                  dataListShiftingNum =
//                                      ((horizontalUpdate_dx - horizontalStart_dx) / 5).round();
//                                  // Shift to Left Hand Side
//                                }
//                                print(dataListShiftingNum);
//                                // TODO: controlSubList
//                              },

                              // TODO: OnScale zoomIn or zoomOut
                              onScaleStart: (zoomScaleDetails) =>
                                  previewDataList = defaultDataList,
                              onScaleUpdate:
                                  (ScaleUpdateDetails zoomScaleDetails) {
                                int generatedNewDataList =
                                    (previewDataList / zoomScaleDetails.scale)
                                        .round();
//              debugPrint("${zoomScaleDetails.scale}");
                                if (generatedNewDataList >= 10) {
                                  defaultDataList = generatedNewDataList;
                                }

                                if (generatedNewDataList >= 150) {
                                  generatedNewDataList = 150;
                                }
                              },
                              onScaleEnd: (ScaleEndDetails end) {
                                chartModel.updateDataSize(defaultDataList);
                              },
                              // TODO: CandlesTick Chart
                              child: CustomPaint(
                                size: Size(MediaQuery.of(context).size.width,
                                    MediaQuery.of(context).size.height),
                                isComplex: true,
                                painter: ChartPainterController(
                                  dataSetShiftingNum: dataListShiftingNum, //
                                  tempSingleDataList: chartModel.modifyDataList,
                                  chartType: ChartType.candlesTickChart,
                                  isEnableGrid: true,
                                  isWholeChart: false,
                                ),
                                // TODO: Test check the Stream update
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: new Container(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 20,
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 20,
                      child: Consumer<ChartModel>(
                        builder: (BuildContext buildContext,
                            ChartModel chartModel, Widget child) {
                          return Container(
                            key: _key_ofAreaContainer,
                            child: CustomPaint(
                              size: Size(MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height),
                              isComplex: true,
                              painter: ChartPainterController(
                                dataSetShiftingNum: dataListShiftingNum,
                                tempSingleDataList: chartModel.modifyDataList,
                                chartType: ChartType.areaChart,
                                isEnableGrid: true,
                                isEnableVerticalGrid: false,
                                isEnableHorizontalGrid: true,
                                isWholeChart: true,
                              ),
                              // TODO: Test check the Stream update
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                  )),
              Expanded(
                flex: 10,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 20,
                      child: Consumer<ChartModel>(
                        builder: (BuildContext buildContext,
                            ChartModel chartModel, Widget child) {
                          return Container(
                            key: _key_ofAreaContainer,
                            child: CustomPaint(
                              size: Size(MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height),
                              isComplex: true,
                              painter: ChartPainterController(
                                dataSetShiftingNum: dataListShiftingNum,
                                tempSingleDataList: chartModel.modifyDataList,
                                chartType: ChartType.barChart,
                                isEnableGrid: true,
                                isEnableVerticalGrid: false,
                                isEnableHorizontalGrid: true,
                                isWholeChart: true,
                              ),
                              // TODO: Test check the Stream update
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                  )),
              Expanded(
                flex: 10,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 20,
                      child: Consumer<ChartModel>(
                        builder: (BuildContext buildContext,
                            ChartModel chartModel, Widget child) {
                          return Container(
                            key: _key_ofAreaContainer,
                            child: CustomPaint(
                              size: Size(MediaQuery.of(context).size.width,
                                  MediaQuery.of(context).size.height),
                              isComplex: true,
                              painter: ChartPainterController(
                                dataSetShiftingNum: dataListShiftingNum,
                                tempSingleDataList: chartModel.modifyDataList,
                                chartType: ChartType.volChart,
                                isEnableGrid: true,
                                isEnableVerticalGrid: false,
                                isEnableHorizontalGrid: true,
                                isWholeChart: true,
                              ),
                              // TODO: Test check the Stream update
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height * 0.17),
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.only(left: 5.0, right: 5.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.all(0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                      //時間
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        child: AutoSizeText(
                                          "時間", //恆生指數
                                          style: TextStyle(fontSize: 25),
                                          maxLines: 1,
                                          maxFontSize: 20,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                          alignment: Alignment.topLeft,
                                          child:
                                              TimePeriodSelectedDropButton()))
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 2,
                            child: Container(
                              padding: EdgeInsets.all(0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                      //時間
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        child: AutoSizeText(
                                          "類型", //恆生指數
                                          style: TextStyle(fontSize: 25),
                                          maxLines: 1,
                                          maxFontSize: 20,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: ChartTypeSelectedDropButton()),
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.all(0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                      //時間
                                      flex: 1,
                                      child: Container(
                                        alignment: Alignment.topLeft,
                                        child: AutoSizeText(
                                          "颜色", //恆生指數
                                          style: TextStyle(fontSize: 25),
                                          maxLines: 1,
                                          maxFontSize: 20,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: ColorTypeSelectedDropButton()),
                                ],
                              ),
                            )),
                        Expanded(
                            flex: 7,
                            child: Container(
                              padding: EdgeInsets.all(0),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        padding: EdgeInsets.all(0),
                                        alignment: Alignment.center,
                                        icon: Icon(Icons.show_chart),
                                        onPressed: () =>
                                            debugPrint("chartSelected")),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        padding: EdgeInsets.all(0),
                                        alignment: Alignment.center,
                                        icon: Icon(Icons.camera),
                                        onPressed: () =>
                                            debugPrint("takePhoto")),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        padding: EdgeInsets.all(0),
                                        alignment: Alignment.center,
                                        icon: Icon(Icons.edit),
                                        onPressed: () => debugPrint("edit")),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: IconButton(
                                        padding: EdgeInsets.all(0),
                                        alignment: Alignment.center,
                                        icon: Icon(Icons.transform),
                                        onPressed: () =>
                                            debugPrint("transform")),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: IconButton(
                                          padding: EdgeInsets.all(0),
                                          alignment: Alignment.center,
                                          icon: isEnableGrid
                                              ? Icon(Icons.grid_on)
                                              : Icon(Icons.grid_off),
                                          onPressed: () {
                                            isEnableGrid = !isEnableGrid;
                                          })),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: Colors.blue,
                                      )),
                                  Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: Colors.deepPurple,
                                      )),
                                  Expanded(
                                    flex: 2,
                                    child: IconButton(
                                      icon: Icon(Icons.cancel),
                                      color: Colors.lightBlueAccent,
                                      onPressed: () {
                                        Navigator.pop(widget.context);
                                        closeFlutter(context: widget.context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "開: ",
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "高: ",
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "低: ",
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "收: ",
                                  style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "10-SMA:",
                                  style: TextStyle(fontSize: 9),
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "20-SMA:",
                                  style: TextStyle(fontSize: 9),
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "50-SMA:",
                                  style: TextStyle(fontSize: 9),
                                  textAlign: TextAlign.center,
                                )),
                            Expanded(
                                flex: 1,
                                child: Text(
                                  "100-SMA:",
                                  style: TextStyle(fontSize: 9),
                                  textAlign: TextAlign.center,
                                )),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width, // Like a widthFactor
            height: MediaQuery.of(context).size.height, // Like a heightFactor
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Consumer<ChartModel>(
                    builder: (BuildContext buildContext, ChartModel chartModel,
                        Widget child) {
                      return Container(
                        color: Colors.white,
                        child: GestureDetector(
//                          onHorizontalDragStart: (DragStartDetails start) =>
//                              _onDragStart(context, start),
//                          onHorizontalDragUpdate: (DragUpdateDetails update) =>
//                              _onDragUpdate(context, update),
//                          onHorizontalDragEnd: (DragEndDetails end) {
//                            _onDragEnd(context, end);
//                            // TODO: controlSubList
//                          },
                          // TODO: OnScale zoomIn or zoomOut
                          onScaleStart: (zoomScaleDetails) =>
                              previewDataList = defaultDataList,
                          onScaleUpdate: (ScaleUpdateDetails zoomScaleDetails) {
                            int generatedNewDataList =
                                (previewDataList / zoomScaleDetails.scale)
                                    .round();
//              debugPrint("${zoomScaleDetails.scale}");
                            if (generatedNewDataList >= 10) {
                              defaultDataList = generatedNewDataList;
                            }

                            if (generatedNewDataList >= 150) {
                              generatedNewDataList = 150;
                            }
                          },
                          onScaleEnd: (ScaleEndDetails end) {
                            chartModel.updateDataSize(defaultDataList);
                          },
                          // TODO: AreaChart
                          child: CustomPaint(
                            size: Size(MediaQuery.of(context).size.width,
                                MediaQuery.of(context).size.height),
                            isComplex: true,
                            foregroundPainter: ChartPainterController(
                              dataSetShiftingNum: dataListShiftingNum,
                              tempSingleDataList: chartModel.modifyDataList,
                              chartType: ChartType.areaChart,
//                              dataList: defaultDataList,
                              isEnableGrid: true,
                              isWholeChart: false,
                              closePriceTracking: true,
                            ),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 15,
                                  child: Container(
                                    color: Colors.transparent,
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    color: Colors.yellowAccent.withOpacity(0.5),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                            // TODO: Test check the Stream update
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
