import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Constants.dart';
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
  TabController tabController;
  @override
  void initState() {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    // ));
    super.initState();
    tabController = new TabController(
        length: 4, initialIndex: widget.initialIndex ?? 0, vsync: this);
    tabController.addListener(_handleTabSelection);

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
              child: TabBarView(controller: tabController, children: [
                TabHome(),
                TabBookmark(),
                TabSearch(),
                TabMyPage(),
              ]),
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: Color(0xFFDDDDDD),
              ))),
              child: TabBar(
                  onTap: (index) {
                    setState(() {});
                  },
                  controller: tabController,
                  tabs: [
                    Tab(
                        child: Text(
                          '홈',
                          style: TextStyle(
                              fontSize: 12,
                              color: tabController.index == 0
                                  ? Color(Constants.primaryColorInt)
                                  : Colors.black),
                        ),
                        icon: tabController.index == 0
                            ? SvgPicture.asset('images/svg/home_selected.svg')
                            : SvgPicture.asset('images/svg/home_grey.svg')),
                    Tab(
                        child: Text(
                          '좋아요',
                          style: TextStyle(
                              fontSize: 12,
                              color: tabController.index == 1
                                  ? Color(Constants.primaryColorInt)
                                  : Colors.black),
                        ),
                        // iconMargin: EdgeInsets.all(0),
                        icon: SizedBox(
                            width: 16,
                            height: 16,
                            child: tabController.index == 1
                                ? SvgPicture.asset(
                                    'images/svg/like_selected.svg')
                                : SvgPicture.asset('images/svg/like.svg'))),
                    Tab(
                        child: Text(
                          '검색',
                          style: TextStyle(
                              fontSize: 12,
                              color: tabController.index == 2
                                  ? Color(Constants.primaryColorInt)
                                  : Colors.black),
                        ),
                        icon: tabController.index == 2
                            ? SvgPicture.asset('images/svg/search_selected.svg')
                            : SvgPicture.asset(
                                'images/svg/searchbar_search.svg')),
                    Tab(
                        child: Text(
                          '마이페이지',
                          style: TextStyle(
                              fontSize: 12,
                              color: tabController.index == 3
                                  ? Color(Constants.primaryColorInt)
                                  : Colors.black),
                        ),
                        //text: '마이페이지',
                        icon: tabController.index == 3
                            ? SvgPicture.asset('images/svg/person_selected.svg')
                            : SvgPicture.asset('images/svg/person.svg'))
                  ]),
            ))
        // )
        );
  }
}
