import 'package:flutter/material.dart';
import 'TabHome/TabHome.dart';

import 'Constants.dart';
import 'TabCommunity/TabCommunity.dart';
import 'TabMyPage/TabMyPage.dart';
import 'TabSearch/TabSearch.dart';

class Main extends StatelessWidget {
  Main({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "이웃집닥터 메인",
        theme: ThemeData(
            primaryColor: Color(Constants.primaryColorInt),
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: MainTab());
  }
}

class MainTab extends StatelessWidget {
  MainTab();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(),
            body: TabBarView(children: [
              TabHome(),
              TabSearch(),
              TabCommunity(),
              TabMyPage()
            ]),
            bottomNavigationBar: TabBar(tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_boat_sharp)),
              Tab(icon: Icon(Icons.directions_bike))
            ])));
  }
}
