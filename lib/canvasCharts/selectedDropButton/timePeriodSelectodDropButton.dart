import 'package:flutter/material.dart';

class TimePeriodSelectedDropButton extends StatefulWidget {
  @override
  TimePeriodSelectedDropButtonState createState() =>
      new TimePeriodSelectedDropButtonState();
}

class TimePeriodSelectedDropButtonState
    extends State<TimePeriodSelectedDropButton> {
  String serverValue = "2";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DropdownButton(
      items: [
        DropdownMenuItem(
          value: "1",
          child: new Text(
            "1分鐘圖",
            textDirection: TextDirection.rtl,
          ),
        ),
        DropdownMenuItem(
          value: "2",
          child: new Text(
            "5分鐘圖",
            textDirection: TextDirection.rtl,
          ),
        ),
        DropdownMenuItem(
          value: "3",
          child: new Text(
            "15分鐘圖",
            textDirection: TextDirection.rtl,
          ),
        ),
        DropdownMenuItem(
          value: "4",
          child: new Text(
            "30分鐘圖",
            textDirection: TextDirection.rtl,
          ),
        ),
        DropdownMenuItem(
          value: "5",
          child: new Text(
            "60分鐘圖",
            textDirection: TextDirection.rtl,
          ),
        ),
        DropdownMenuItem(
          value: "6",
          child: new Text(
            "日線圖",
            textDirection: TextDirection.rtl,
          ),
        ),
        DropdownMenuItem(
          value: "8",
          child: new Text(
            "週線圖",
            textDirection: TextDirection.rtl,
          ),
        ),
        DropdownMenuItem(
          value: "9",
          child: new Text(
            "月線圖",
            textDirection: TextDirection.rtl,
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          serverValue = value;
        });
      },
      value: serverValue,
    );
  }
}
