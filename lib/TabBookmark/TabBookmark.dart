import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabBookmark/SearchBookmarkRepository/SearchBookmarkController.dart';
import 'package:my_side_client/TabHome/FoodRankingContainer.dart';
import 'package:my_side_client/TabSearch/FoodInformation.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/UserProfile.dart';

import 'SearchBookmarkRepository/SearchFoodItem.dart';

class TabBookmark extends StatefulWidget {
  TabBookmark({Key key}) : super(key: key);

  @override
  _TabBookmarkState createState() => _TabBookmarkState();
}

class _TabBookmarkState extends State<TabBookmark> with WidgetsBindingObserver {
  SearchBookmarkController _controller = Get.put(SearchBookmarkController());
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      //do your stuff
      print("onResume");
      _controller.fetch();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: UserProfile.isLogin
                ? Obx(() => _controller.isLoading.value
                    ? loadingPage()
                    : _controller.lst.length == 0
                        ? noContent()
                        : mainContent(_controller.lst))
                : RequestLoginPage()),
        appBar: CustomAppBar(
          // title: Text("찜목록", style: TextStyle(fontSize: 16)),
          "찜목록",
          0xFFFFFFFF, isBack: false,
          // centerTitle: true,
          // automaticallyImplyLeading: false,
          // backgroundColor: Colors.white,
          //  Colors.white,

          // elevation: 0,
          // actions: [
          // GestureDetector(
          //   child: Padding(
          //       child: SvgPicture.asset('images/svg/searchbar_search.svg'),
          //       padding: EdgeInsets.only(right: 16)),
          //   onTap: () {},
          // ),
          // ],
        ));
  }

  Widget noContent() {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("찜! 해둔 음식이\n     없어요😢 ",
            style: TextStyle(color: Color(0xFF111111), fontSize: 22)),
        SizedBox(height: 16),
        Text("도움이 될만한 음식들을 찜해두어\n       목록으로 만들어보세요!",
            style: TextStyle(color: Color(0xFF666666), fontSize: 14))
      ],
    ));
  }

  Widget mainContent(List<FoodItem> lst) {
    return SingleChildScrollView(
        child: Wrap(
            children: lst
                .map(
                  (item) => FoodTile(
                    item.name,
                    item.img,
                    0,
                    item.likes,
                    item.wishes,
                    [item.cancerNm, item.nutrition1],
                    likeStatus: 1,
                    bookmarkStatus: 1,
                    isOnTabDisabled: true,
                  ),
                )
                .toList()));
  }
}
