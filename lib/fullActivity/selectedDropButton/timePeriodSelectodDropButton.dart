import 'package:flutter/material.dart';

class TimePeriodSelectedDropButton extends StatefulWidget {
  @override
  TimePeriodSelectedDropButtonState createState() =>
      new TimePeriodSelectedDropButtonState();
}

class TimePeriodSelectedDropButtonState
    extends State<TimePeriodSelectedDropButton> {
  String dropdownValue = '1分鐘圖';
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
        '1分鐘圖',
        '5分鐘圖',
        '15分鐘圖',
        '30分鐘圖',
        '60分鐘圖',
        '日線圖',
        '週線圖',
        '月線圖'
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
