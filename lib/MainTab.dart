import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'TabBookmark/TabBookmark.dart';
import 'TabHome/TabHome.dart';

import 'Constants.dart';
import 'TabMyPage/TabMyPage.dart';
import 'TabSearch/TabSearch.dart';

class Main extends StatelessWidget {
  Main({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "이웃집닥터 메인",
        theme: ThemeData(
            primaryColor: Color(Constants.primaryColorInt),
            visualDensity: VisualDensity.adaptivePlatformDensity),
        home: MainTab());
  }
}

class MainTab extends StatefulWidget {
  MainTab();

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 4, initialIndex: 3, vsync: this);
    _controller.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
            length: 4,
            child: Scaffold(
                // appBar: AppBar(
                //   title: Text("이웃집닥터"),
                // ),
                body: TabBarView(controller: _controller, children: [
                  TabHome(),
                  TabBookmark(),
                  TabSearch(),
                  TabMyPage(),
                ]),
                bottomNavigationBar: TabBar(
                    onTap: (index) {
                      setState(() {});
                    },
                    controller: _controller,
                    tabs: [
                      Tab(
                          icon: _controller.index == 0
                              ? SvgPicture.asset('images/svg/home_selected.svg')
                              : SvgPicture.asset('images/svg/home_grey.svg')),
                      Tab(
                          icon: _controller.index == 1
                              ? SvgPicture.asset(
                                  'images/svg/favorite_selected.svg')
                              : SvgPicture.asset('images/svg/favorite.svg')),
                      Tab(
                          icon: _controller.index == 2
                              ? SvgPicture.asset(
                                  'images/svg/search_selected.svg')
                              : SvgPicture.asset(
                                  'images/svg/searchbar_search.svg')),
                      Tab(
                          icon: _controller.index == 3
                              ? SvgPicture.asset(
                                  'images/svg/person_selected.svg')
                              : SvgPicture.asset('images/svg/person.svg'))
                    ]))));
  }
}
