import 'package:flutter/material.dart';

class ColorTypeSelectedDropButton extends StatefulWidget {
  @override
  ColorTypeSelectedDropButtonState createState() =>
      new ColorTypeSelectedDropButtonState();
}

class ColorTypeSelectedDropButtonState
    extends State<ColorTypeSelectedDropButton> {
  String serverValue = "1";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: DropdownButton(
        items: [
          DropdownMenuItem(
            value: "1",
            child: new Text(
              "深",
              textDirection: TextDirection.rtl,
            ),
          ),
          DropdownMenuItem(
            value: "2",
            child: new Text(
              "淺",
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
      ),
    );
  }
}
