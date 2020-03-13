import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  final String tabSection_Name;

  // ignore: non_constant_identifier_names
  LoginPage({@required this.tabSection_Name, Key key}) : super(key: key);
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  bool password_IsCheck;
  bool login_IsCheck;
  String serverValue;
  @override
  void initState() {
    super.initState();
    password_IsCheck = false;
    login_IsCheck = false;
  }

  String _email, _password;
  final GlobalKey<FormState> _logInformKey = new GlobalKey<FormState>();

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  void _erase() {
    setState(() {
      _emailController.clear();
      _passwordController.clear();
    });
  }

  void _password_IsSave(password_IsCheck) {
    setState(() {
      password_IsCheck = password_IsCheck;
    });
  }

  void _login_IsSave(login_IsCheck) {
    setState(() {
      login_IsCheck = login_IsCheck;
    });
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    // TODO: implement build
    if (widget.tabSection_Name == "登入") {
      return ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(15),
        children: <Widget>[
          new Container(
            alignment: Alignment.center,
            child: Text(
              "經濟通",
              style: TextStyle(fontSize: 25),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            child: Text(
              "etnet",
              style: TextStyle(fontSize: 45),
            ),
          ),
          new Form(
            key: _logInformKey,
            child: new Theme(
              data: new ThemeData(
                  brightness: Brightness.light,
                  inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ))),
              child: Container(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      // ignore: missing_return
                      validator: (input) {
                        if (input.isEmpty) {
                          // ignore: missing_return, missing_return
                          return 'Please type an email:';
                        }
                      },
                      onSaved: (input) => _email = input,
                      controller: _emailController,
                      decoration: new InputDecoration(
                        labelText: "用戶名稱",
                        hintText: "DEV49",
                        icon: new Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    new TextFormField(
                      // ignore: missing_return
                      validator: (input) {
                        if (input.length < 6) {
                          // ignore: missing_return, missing_return
                          return 'You password needs to be at least 6 characters';
                        }
                      },
                      onSaved: (input) => _password = input,
                      controller: _passwordController,
                      decoration: new InputDecoration(
                        labelText: "密碼",
                        hintText: "IQDEV49",
                        icon: new Icon(Icons.lock),
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: new Text(
                        "記住我",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: new Switch(
                        value: password_IsCheck,
                        onChanged: _password_IsSave,
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: new Text(
                        "自動登入",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: new Switch(
                        value: login_IsCheck,
                        onChanged: _login_IsSave,
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: new Text(
                        "選擇伺服器",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: new DropdownButton(
                        items: [
                          DropdownMenuItem(
                            value: "1",
                            child: new Text(
                              "香港",
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          DropdownMenuItem(
                            value: "2",
                            child: new Text(
                              "中國-中國電訊",
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          DropdownMenuItem(
                            value: "3",
                            child: new Text(
                              "中國-中國聯通",
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
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: OutlineButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.transparent,
                        child: new Center(
                          child: Text(
                            "登入",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        onPressed: () => debugPrint("LOGIN"),
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Text(
                      "串流版用戶可於登入後查看串流報價，查詢詳情或試用串流報價，請致電（852）28807004或電郵至cs@etnet.com.hk與客戶服務部聯絡",
                      textDirection: TextDirection.ltr,
                    ))
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    } else if (widget.tabSection_Name == "註冊") {
      return ListView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(15),
        children: <Widget>[
          new Container(
            alignment: Alignment.center,
            child: Text(
              "經濟通",
              style: TextStyle(fontSize: 25),
            ),
          ),
          new Container(
            alignment: Alignment.center,
            child: Text(
              "etnet",
              style: TextStyle(fontSize: 45),
            ),
          ),
          new Form(
            key: _logInformKey,
            child: new Theme(
              data: new ThemeData(
                  brightness: Brightness.light,
                  inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ))),
              child: Container(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: new Column(
                  children: <Widget>[
                    new TextFormField(
                      // ignore: missing_return
                      validator: (input) {
                        if (input.isEmpty) {
                          // ignore: missing_return, missing_return
                          return 'Please type an email:';
                        }
                      },
                      onSaved: (input) => _email = input,
                      controller: _emailController,
                      decoration: new InputDecoration(
                        labelText: "用戶名稱",
                        hintText: "DEV49",
                        icon: new Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    new TextFormField(
                      // ignore: missing_return
                      validator: (input) {
                        if (input.length < 6) {
                          // ignore: missing_return, missing_return
                          return 'You password needs to be at least 6 characters';
                        }
                      },
                      onSaved: (input) => _password = input,
                      controller: _passwordController,
                      decoration: new InputDecoration(
                        labelText: "密碼",
                        hintText: "IQDEV49",
                        icon: new Icon(Icons.lock),
                      ),
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: new Text(
                        "選擇伺服器",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: new DropdownButton(
                        items: [
                          DropdownMenuItem(
                            value: "1",
                            child: new Text(
                              "香港",
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          DropdownMenuItem(
                            value: "2",
                            child: new Text(
                              "中國-中國電訊",
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                          DropdownMenuItem(
                            value: "3",
                            child: new Text(
                              "中國-中國聯通",
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
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                      child: OutlineButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: new Center(
                          child: Text(
                            "註冊",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                        onPressed: () => debugPrint("LOGIN"),
                      ),
                    ),
                  ],
                ),
                new Row(
                  children: <Widget>[
                    new Expanded(
                        child: new Text(
                      "串流版用戶可於登入後查看串流報價，查詢詳情或試用串流報價，請致電（852）28807004或電郵至cs@etnet.com.hk與客戶服務部聯絡",
                      textDirection: TextDirection.ltr,
                    ))
                  ],
                ),
                new Container(
                    padding: EdgeInsets.only(top: 10),
                    child: new Text(
                      "Version 9.9.9",
                    )),
              ],
            ),
          ),
          new Container(
            height: 140,
            width: MediaQuery.of(context).size.width,
            child: new Image.asset(
              'assets/loginPage/picture1.jpg',
              fit: BoxFit.fill,
            ),
          )
        ],
      );
    }
  }
}
