import 'package:flutter/material.dart';

class StockName extends StatefulWidget{
  @override
  StockNameState createState() => StockNameState();
}


class StockNameState extends State<StockName> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Row(
            children: <Widget>[
              new SizedBox(
                width: 70.0,
                height: 40.0,
                child: GestureDetector(
                  // TODO: Tap the StockCode Input Button to Change the Stock -> This Button Should Be pop up the NumKeyBoard for user input and search
                  onTap: () {
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.lightBlue, width: 1),
                        color: Color.fromRGBO(50, 62, 77, 1),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child:  Text(
                      "00423",
                      style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
              new Text("經濟日報集團",
                  style: TextStyle(fontSize: 20))
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  color: Colors.red,
                  child: InkWell(
                      child: Text("DD", style: TextStyle(color: Colors.white),),
                      onTap: (){
//                            getChartUtil("D1");
                      }
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 4),
                ),
                Container(
                  color: Colors.blue,
                  child: InkWell(
                      child: Text("DD", style: TextStyle(color: Colors.white),),
                      onTap: (){
//                            getChartUtil("D1");
                      }
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}
