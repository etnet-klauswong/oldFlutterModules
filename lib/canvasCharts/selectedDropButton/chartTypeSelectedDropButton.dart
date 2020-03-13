import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/canvasCharts/chartContainer.dart';

class ChartTypeSelectedDropButton extends StatefulWidget {
  @override
  ChartTypeSelectedDropButtonState createState() =>
      new ChartTypeSelectedDropButtonState();
}

class ChartTypeSelectedDropButtonState
    extends State<ChartTypeSelectedDropButton> {
  String serverValue = "1";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropdownButton(
      items: [
        DropdownMenuItem(
          value: "1",
          child: new Text(
            "陰陽燭",
            textDirection: TextDirection.rtl,
          ),
        ),
        DropdownMenuItem(
          value: "2",
          child: new Text(
            "線形圖",
            textDirection: TextDirection.rtl,
          ),
        ),
        DropdownMenuItem(
          value: "3",
          child: new Text(
            "山形圖",
            textDirection: TextDirection.rtl,
          ),
        ),
        DropdownMenuItem(
          value: "4",
          child: new Text(
            "棒形圖",
            textDirection: TextDirection.rtl,
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          serverValue = value;
          if (serverValue == "1") {
            chartTypeStream_Add(ChartType.candlesTickChart);
//            chartTypeState = ChartType.candlesTickChart;
          } else if (serverValue == "2") {
            chartTypeStream_Add(ChartType.lineChart);
//            chartTypeState = ChartType.lineChart;
          } else if (value == "3") {
            chartTypeStream_Add(ChartType.areaChart);
//            chartTypeState = ChartType.areaChart;
          } else if (value == "4") {
            chartTypeStream_Add(ChartType.barChart);
//            chartTypeState = ChartType.barChart;
          }
//          print(chartTypeState.index); //0,1,2,3
        });
      },
      value: serverValue,
    );
  }
}
