import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CursorPainterController extends CustomPainter {
  Paint cursorAreaPainter = new Paint()
    ..color = Colors.orangeAccent.withOpacity(0.5)
    ..style = PaintingStyle.fill
    ..isAntiAlias = true
    ..strokeWidth = 2;
  Paint cursorButtonPainter = new Paint()
    ..color = Colors.black.withOpacity(0.7)
    ..style = PaintingStyle.fill
    ..isAntiAlias = true
    ..strokeWidth = 2;
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    // e.g barWidth = 10
    // e.g customAreaWidth = 50 (mutable)

    // TODO: if rightLimit  - boundLimit (size.width - barWidth/2, size.height)
    /// 1.  rightBar: center: new Offset(size.width - barWidth/2, size.height / 2), width: barWidth, height: size.height
    /// 2.  centerArea: center: new Offset(size.width - barWidth/2 - customAreaWidth/2 , size.height / 2), width: customAreaWidth, height: size.height
    /// 3.  leftBar: center: new Offset(size.width - barWidth - customAreaWidth/2 - barWidth/2, size.height / 2), width: barWidth, height: size.height

    // TODO: if leftLimit  - boundLimit ( + barWidth/2, size.height)
    /// 1.  leftBar: center: new Offset( +barWidth/2, size.height / 2), width: barWidth, height: size.height
    /// 2.  centerArea: center: new Offset( +barWidth + customAreaWidth/2 , size.height / 2), width: customAreaWidth, height: size.height
    /// 3.  rightBar: center: new Offset(+barWidth +  customAreaWidth + barWidth/2, size.height / 2), width: barWidth, height: size.height

    // TODO: if rightBar & leftBar within the boundLimit -> it could be any point

    /// condition:
    ///   1.  overLimit leftLimit - overLeftLimit leftBar centerPoint dx = + barWidth/2 ; dy = size.height /2 ;  width: barWidth  +
    ///   2.  overLimit leftRight - overLeftLimit rightBar enterPoint dx = barWidth.width - width/2 ; dy = size.height /2 ; width: barWidth

    /// originalPosition -

    /// leftBar & rightBar have fixed width
    // TODO: leftBar centerPoint dx = + width/2 ; dy = size.height /2    // overLimit Situation
    canvas.drawRect(
        new Rect.fromCenter(
            center: new Offset(size.width - 20 - 50 - 10, size.height / 2),
            width: 20,
            height: size.height),
        cursorButtonPainter);
    canvas.drawRect(
        new Rect.fromCenter(
            center: new Offset(size.width - 20 - 25, size.height / 2),
            width: 50,
            height: size.height),
        cursorAreaPainter);
    // TODO: rightBar centerPoint dx = size.width - width/2 ; dy = size.height /2    // overLimit Situation
    canvas.drawRect(
        new Rect.fromCenter(
            center: new Offset(size.width - 10, size.height / 2),
            width: 20,
            height: size.height),
        cursorButtonPainter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
