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
      Row(children: [SearchBar()]),
      Row(children: [LoginRequestBar()]),
      Flex(direction: Axis.horizontal, children: [DiseaseCategoryContainer()]),
      Flex(direction: Axis.horizontal, children: [DiseaseRankingContainer()]),
      Flex(direction: Axis.horizontal, children: [FoodRankingContainer()])
    ]);
  }
}
