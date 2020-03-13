// TODO: System Package
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttercompletelibrary/nss_core/singleQuote.dart';
import 'package:fluttercompletelibrary/quotesPage_nss_Core/MaterialStyle.dart';
import 'package:fluttercompletelibrary/quotesPage_nss_Core/ReusableWidget.dart';
import 'package:nss_core/nss_core.dart';
import 'package:shared_preferences/shared_preferences.dart'; // TODO: SingleQuoteParameter

class HomePage extends StatefulWidget {
  HomePage() : super();
  @override
  _HomePageWidget createState() => new _HomePageWidget();
}

class _HomePageWidget extends State<HomePage>
    implements OnQuoteDataReceived, OnSortListReceived {
  _HomePageWidget();
  int counter = 0;
  loadCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt('counter') ?? 0);
    });
  }

  incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', counter);
    });
  }

  @override
  void initState() {
    super.initState();
    loadCounter();
    nssCoreService.nssCore.login(username, password);
    quoteSubscriber.setOnQuoteDataReceived(this);
    quoteSubscriber.setNssCore(nssCoreService.nssCore);
    final asaLoadCompleteSub =
        nssCoreService.asaLoadComplete.listen((bool completed) {
      if (completed) {
        quoteSubscriber
          ..codes([codeList[position]])
          ..fields(fields)
          ..subscribe();
      }
    });
    subscription.add(asaLoadCompleteSub);
  }

  @override
  void dispose() {
    print('Unsubscribe Quote');
    quoteSubscriber.unsubscribe();
    subscription.forEach((StreamSubscription s) {
      s.cancel();
    });
    super.dispose();
    if (timer != null) {
      timer.cancel();
    }
  }

  List<Widget> stockView(BuildContext context) {
    return [
      Container(
        height: 25,
        width: MediaQuery.of(context).size.width,
        child: MarqueeWidget(
          text: "恒指: 26506.75 +55.72       期指: 26572.00 +55.72",
          textStyle: new TextStyle(fontSize: 16.0, color: Colors.white),
          scrollAxis: Axis.horizontal,
        ),
      ),
    ];
  }

  @override // ignore: missing_return
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 0; i < 100; i++) {
      widgets.add(Center(
        child: Text('$counter'),
      ));
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColors,
        body: new CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: new SliverList(
                  delegate: SliverChildListDelegate(
                stockView(context) +
                    stockPrice(context) +
                    stockDetail(context) +
                    transactionDetail(context),
              )),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onQuoteDataReceived(List<QuoteData> bundle) {
    // TODO: implement onQuoteDataReceived
    bundle.forEach((QuoteData data) {
      setState(() {
        if (!dataStream.containsKey(data.nssData.fieldId)) {
          dataStream.putIfAbsent(data.nssData.fieldId, () => data.nssData.data);
        } else {
          dataStream.update(
              data.nssData.fieldId, (currentValue) => data.nssData.data);
        }
      });
      setState(() {});
    });
  }

  @override
  void onSortListReceived(SortData sortData) {
    // TODO: implement onSortListReceived print(sortData);
    print('addist--------------------------------------------');
    print(sortData.addist);
    print('removeList--------------------------------------------');
    print(sortData.removeList);
    print('changedList--------------------------------------------');
    print(sortData.changedList);
  }
}
