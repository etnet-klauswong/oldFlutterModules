import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget EMA_ParameterWidget() {
  return Column(
    children: <Widget>[
      Expanded(
        flex: 1,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: AutoSizeText(
                "1st MA Line",
                style: TextStyle(fontSize: 16),
                maxLines: 2,
                maxFontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        flex: 1,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: AutoSizeText(
                "2st MA Line",
                style: TextStyle(fontSize: 16),
                maxLines: 2,
                maxFontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        flex: 1,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: AutoSizeText(
                "3st MA Line",
                style: TextStyle(fontSize: 16),
                maxLines: 2,
                maxFontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
          ],
        ),
      ),
      Expanded(
        flex: 1,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: AutoSizeText(
                "4st MA Line",
                style: TextStyle(fontSize: 16),
                maxLines: 2,
                maxFontSize: 16,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                margin: EdgeInsets.all(10),
                child: TextField(
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
          ],
        ),
      ),
      Expanded(flex: 1, child: Container())
    ],
  );
}
