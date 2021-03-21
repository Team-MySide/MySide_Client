import 'package:flutter/material.dart';

import 'DiseaseCategoryContainer.dart';
import 'DiseaseRankingContainer.dart';
import 'FoodRankingContainer.dart';
import 'SearchBar.dart';
import 'LoginRequestBar.dart';

class TabHome extends StatelessWidget {
  const TabHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SearchBar(),
      LoginRequestBar(),
      DiseaseCategoryContainer(),
      DiseaseRankingContainer(),
      FoodRankingContainer(),
    ]);
  }
}
