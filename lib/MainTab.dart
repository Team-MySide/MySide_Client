import 'package:flutter/material.dart';
import 'package:my_side_client/FoodRankingContainer.dart';

import 'Constants.dart';
import 'DiseaseCategoryContainer.dart';
import 'DiseaseRankingContainer.dart';
import 'LoginRequestBar.dart';
import 'SearchBar.dart';

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
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("매인 메뉴"),
        ),
        body: Container(
            child: Column(
          children: [
            Row(children: [SearchBar()]),
            Row(children: [LoginRequestBar()]),
            Flex(
                direction: Axis.horizontal,
                children: [DiseaseCategoryContainer()]),
            Flex(
                direction: Axis.horizontal,
                children: [DiseaseRankingContainer()]),
            Flex(direction: Axis.horizontal, children: [FoodRankingContainer()])
          ],
        )));
  }
}
