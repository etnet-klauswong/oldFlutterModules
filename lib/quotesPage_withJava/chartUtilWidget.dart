import 'package:flutter/material.dart';

class ChartUtilWidget extends StatefulWidget {
  @override
  _ChartUtilWidget createState() => _ChartUtilWidget();
}

class _ChartUtilWidget extends State<ChartUtilWidget> {
  static String typeOfSmallChart = "D1";
  static String nameOfAndroidView = "SmallChartView";
  @override
  Widget build(BuildContext context) {
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
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.height,
                    height: MediaQuery.of(context).size.height,
                    child: FlatButton(
                      // TODO: Trigger the FullChart ->
                      onPressed: () => debugPrint("FullChart PopUp"),
//                      child: AndroidView(
//                        viewType: "$nameOfAndroidView",
//                      ),
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
}
