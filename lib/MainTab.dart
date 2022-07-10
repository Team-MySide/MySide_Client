import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'TabBookmark/TabBookmark.dart';
import 'TabHome/TabHome.dart';
import 'TabSearch/TabSearch.dart';
import 'screens/mypagescreens/tabMyPage.dart';

class Main extends StatelessWidget {
  Main({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        // GetMaterialApp(
        //     title: "이웃집닥터 메인",
        //     theme: ThemeData(
        //         canvasColor: Colors.white,
        //         primaryColor: Color(Constants.primaryColorInt),
        //         visualDensity: VisualDensity.adaptivePlatformDensity),
        // home:
        MainTab();
    //  );
  }
}

class MainTab extends StatefulWidget {
  int initialIndex = 0;
  MainTab({this.initialIndex});

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> with SingleTickerProviderStateMixin {
  TabController _controller;
  @override
  void initState() {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    // ));
    super.initState();
    _controller = new TabController(
        length: 4, initialIndex: widget.initialIndex ?? 0, vsync: this);
    _controller.addListener(_handleTabSelection);

    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   // systemNavigationBarColor: Colors.blue, // navigation bar color
    //   statusBarColor: Colors.white, // status bar color
    // ));
  }

  // @override
  // void dispose() {
  //   super.dispose();
  // }

  void _handleTabSelection() {
    setState(() {});
  }

  // @override
  // void didChangeAppLifecycleState(final AppLifecycleState state) {
  //   if (state == AppLifecycleState.resumed) {
  //     setState(() {
  //       // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //       //   // systemNavigationBarColor: Colors.blue, // navigation bar color
  //       //   statusBarColor: Colors.white, // status bar color
  //       // ));
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //     child:
    return DefaultTabController(
        length: 4,
        child: Scaffold(
            // appBar: AppBar(
            //   title: Text("이웃집닥터"),
            // ),
            body: SafeArea(
              child: TabBarView(controller: _controller, children: [
                TabHome(),
                TabBookmark(),
                TabSearch(),
                TabMyPage(),
              ]),
            ),
            bottomNavigationBar: TabBar(
                onTap: (index) {
                  setState(() {});
                },
                controller: _controller,
                tabs: [
                  Tab(
                      child: Text(
                        '홈',
                        style: TextStyle(fontSize: 12),
                      ),
                      icon: _controller.index == 0
                          ? SvgPicture.asset('images/svg/home_selected.svg')
                          : SvgPicture.asset('images/svg/home_grey.svg')),
                  Tab(
                      child: Text(
                        '레시피',
                        style: TextStyle(fontSize: 12),
                      ),
                      icon: _controller.index == 1
                          ? SvgPicture.asset('images/svg/favorite_selected.svg')
                          : SvgPicture.asset('images/svg/favorite.svg')),
                  Tab(
                      child: Text(
                        '검색',
                        style: TextStyle(fontSize: 12),
                      ),
                      icon: _controller.index == 2
                          ? SvgPicture.asset('images/svg/search_selected.svg')
                          : SvgPicture.asset(
                              'images/svg/searchbar_search.svg')),
                  Tab(
                      child: Text(
                        '마이페이지',
                        style: TextStyle(fontSize: 12),
                      ),
                      //text: '마이페이지',
                      icon: _controller.index == 3
                          ? SvgPicture.asset('images/svg/person_selected.svg')
                          : SvgPicture.asset('images/svg/person.svg'))
                ]))
        // )
        );
  }
}
