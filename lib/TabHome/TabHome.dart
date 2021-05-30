import 'package:flutter/material.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabHome/AdContainer.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'DiseaseCategoryContainer.dart';
import 'FoodRecommendContainer.dart';
import 'FoodRankingContainer.dart';

import 'SearchBar.dart';
import 'LoginRequestBar.dart';

class TabHome extends StatelessWidget {
  const TabHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // Padding(
        // padding: EdgeInsets.symmetric(
        //     horizontal: Constants.paddingMainContainerVertical),
        // child:
        SingleChildScrollView(
            child: UserProfile.isLogin
                ? Column(children: [
                    SearchBar(),
                    LoginRequestBar(),
                    FoodRecommendContainer(),
                    AdContainer(),
                    FoodRankingContainer(),
                    DiseaseCategoryContainer(),
                    // AdContainer()
                  ])
                : Column(children: [
                    SearchBar(),
                    LoginRequestBar(),
                    // FoodRecommendContainer(),
                    FoodRankingContainer(),

                    DiseaseCategoryContainer(),
                    AdContainer()
                  ]
                    // )
                    ));
  }
}
