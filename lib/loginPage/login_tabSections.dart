import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/loginPage/loginPage.dart';
import 'package:fluttercompletelibrary/loginPage/marqueeWidget.dart';

class TabSection extends StatefulWidget {
  @override
  TabSectionState createState() => new TabSectionState();
}

class TabSectionState extends State<TabSection> {
  static String _currentTitle = '帳號';
  static int _currentIndex = 2;
  static int _passIndex;

  static const List<String> _tabLists_LoginPage = [
    "註冊",
    "登入",
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  // TODO: 1. 帳號 2. 組合 3. 報價 4. 即時期貸 5. 新聞  6. 選單
  static TabController _tabController_LoginPage;

  TextEditingController _textController = new TextEditingController();
  int _tabIndex = 0;
  bool isSearching = true;

  @override
  void initState() {
    super.initState();
    _tabController_LoginPage = TabController(
      length: _tabLists_LoginPage.length,
      vsync: ScaffoldState(),
    );
  }

  ScrollController _scrollController = new ScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController_LoginPage.dispose();
    super.dispose();
  }

  // TODO: Update All the things

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: _scaffoldKey,
      body: new NestedScrollView(
          controller: _scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                title: Text("串流報價"),
                pinned: true,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                bottom: new PreferredSize(
                  preferredSize: const Size.fromHeight(75.0),
                  child: Column(
                    children: <Widget>[
                      new TabBar(
                        isScrollable: true,
                        controller: _tabController_LoginPage,
                        indicatorColor: Theme.of(context).accentIconTheme.color,
                        unselectedLabelColor: Theme.of(context).disabledColor,
                        labelColor: Theme.of(context).accentIconTheme.color,
                        tabs: _tabLists_LoginPage
                            .map((title) => Tab(
                                  child: Text(
                                    title,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                            .toList(),
                      ),
                      new Container(
                        height: 25,
                        width: MediaQuery.of(context).size.width,
                        child: MarqueeWidget(
                          text: "恒指: 26506.75 +55.72       期指: 26572.00 +55.72",
                          textStyle: new TextStyle(
                              fontSize: 16.0, color: Colors.white),
                          scrollAxis: Axis.horizontal,
                        ),
                      ),
                      // TODO: Mapping A List
                    ],
                  ),
                ),
              ),
            ];
          },
          body: new TabBarView(
            controller: _tabController_LoginPage,
            children: _tabLists_LoginPage.map((title) {
              if (title != null) {
                return LoginPage(tabSection_Name: title);
              }
              return new Container();
            }).toList(),
          )),
    );
  }
}
