import 'package:flutter/material.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabHome/AdContainer.dart';
import 'BestLikeContainer.dart';
import 'FoodRankingContainer.dart';

import 'SearchBar.dart';
import 'LoginRequestBar.dart';

class TabHome extends StatelessWidget {
  const TabHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Constants.paddingMainContainerVertical),
            child: Column(children: [
              SearchBar(),
              LoginRequestBar(),
              BestLikeContainer(),
              AdContainer(),
              FoodRankingContainer(),
              // DiseaseCategoryContainer(),
              // AdContainer()
            ])));
  }
}
