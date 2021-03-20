import 'package:flutter/material.dart';

class Main extends StatelessWidget {
  Main({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "이웃집닥터 메인",
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: MainTab());
  }
}

class MainTab extends StatelessWidget {
  MainTab();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Row(children: [SearchBar()]),
        Row(children: [LoginRequestBar()]),
        Flex(children: [DiseaseCategory()]),
        Flex(children: [DiseaseRanking()]),
        Flex(children: [FoodRanking()])
      ],
    ));
  }
}

class SearchBar extends StatelessWidget {
  // const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LoginRequestBar extends StatelessWidget {
  const LoginRequestBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DiseaseCategory extends StatelessWidget {
  const DiseaseCategory({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class DiseaseRanking extends StatelessWidget {
  const DiseaseRanking({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class FoodRanking extends StatelessWidget {
  const FoodRanking({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
