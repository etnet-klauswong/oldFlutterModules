import 'package:flutter/material.dart';

class CursorContainerWidget extends StatefulWidget {
  final List snapShotData;
  final Size parentSize;
  CursorContainerWidget({this.parentSize, this.snapShotData});
  @override
  CursorContainerWidgetState createState() => new CursorContainerWidgetState();
}

class CursorContainerWidgetState extends State<CursorContainerWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: widget.parentSize.width,
      height: widget.parentSize.height,
      child: GestureDetector(
        child: Draggable(
          child: Container(
            width: widget.parentSize.width / 10,
            height: widget.parentSize.height,
            color: Colors.cyan,
          ),
          feedback: Container(
            width: widget.parentSize.width / 10,
            height: widget.parentSize.height,
            color: Colors.yellowAccent,
          ),
//            child: CustomPaint(
//              size: Size(MediaQuery.of(context).size.width,
//                  MediaQuery.of(context).size.height),
//              isComplex: true,
//              painter: ChartPainterController(
//                tempSingleDataList: widget.snapShotData,
//                chartType: ChartType.areaChart,
//                isEnableGrid: true,
//                dataList: 999999,
//                isEnableVerticalGrid: false,
//                isEnableHorizontalGrid: true,
//                isWholeChart: true,
//              ),
//              foregroundPainter: CursorPainterController(),
////                          foregroundPainter: CursorPainterController(),
////                          child: Row(
////                            children: <Widget>[
////                              SingleChildScrollView(
////                                child: InkWell(
////                                  child: Row(
////                                    children: <Widget>[
////                                      Icon(
////                                        Icons.arrow_left,
////                                      ),
////                                      Container(
////                                        color: Colors.yellowAccent,
////                                        width:
////                                            MediaQuery.of(context).size.width /
////                                                20,
////                                      ),
////                                      Icon(Icons.arrow_right),
////                                    ],
////                                  ),
////                                ),
////                              )
////                            ],
//////                            color: Colors.orange.withOpacity(0.5),
////                          ),
//              // TODO: Test check the Stream update
//            ),
        ),
      ),
    );
  }
}
