import 'package:flutter/material.dart';

class ColorTypeSelectedDropButton extends StatefulWidget {
  @override
  ColorTypeSelectedDropButtonState createState() =>
      new ColorTypeSelectedDropButtonState();
}

class ColorTypeSelectedDropButtonState
    extends State<ColorTypeSelectedDropButton> {
  String dropdownValue = '深';
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
        '深',
        '淺',
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
