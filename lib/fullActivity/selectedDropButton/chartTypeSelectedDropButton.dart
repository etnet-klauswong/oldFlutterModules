import 'package:flutter/material.dart';

class ChartTypeSelectedDropButton extends StatefulWidget {
  @override
  ChartTypeSelectedDropButtonState createState() =>
      new ChartTypeSelectedDropButtonState();
}

class ChartTypeSelectedDropButtonState
    extends State<ChartTypeSelectedDropButton> {
  String dropdownValue = '陰陽燭';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(
        Icons.arrow_downward,
        size: 15,
      ),
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 0,
        color: Colors.transparent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        '陰陽燭',
        '線形圖',
        '山形圖',
        '棒形圖',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(fontSize: 13),
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
        );
      }).toList(),
    );
  }
}
