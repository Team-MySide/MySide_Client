import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabHome/AdContainer.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'DiseaseCategoryContainer.dart';
import 'FoodRecommendContainer.dart';
import 'FoodRankingContainer.dart';

import 'SearchBar.dart';
import 'LoginRequestBar.dart';

class TabHome extends StatefulWidget {
  const TabHome({Key key}) : super(key: key);

  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> with WidgetsBindingObserver {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  // late AppLifecycleState _notification;
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  // ignore: override_on_non_overriding_member
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    setState(() {
      // _notification = state;
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          // systemNavigationBarColor: Colors.blue, // navigation bar color
          statusBarColor: Colors.white // status bar color
          ));
    });
  }

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
