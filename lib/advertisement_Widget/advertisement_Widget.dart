import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/platformChannel/navigatorUtil.dart';

class AdvertisementWidget extends StatefulWidget {
  @override
  AdvertisementWidgetState createState() => new AdvertisementWidgetState();
}

class AdvertisementWidgetState extends State<AdvertisementWidget> {
  final indexFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      child: dialogContent(context: context),
    );
  }
}

dialogContent({BuildContext context}) {
  return Stack(
    children: <Widget>[
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.6,
        child: new Image.asset(
          'assets/advertisement_Picture1.jpg',
          fit: BoxFit.fill,
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.05,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.white,
                    ),
//                    child: Text(
//                      "確定",
//                      style: TextStyle(color: Colors.white),
//                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    closeFlutter(context: context);
                  }
//                  closeFlutter
                  ),
            ),
          ],
        ),
      ),
    ],
  );
}
