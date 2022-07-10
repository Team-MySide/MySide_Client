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
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (UserProfile.isLogin) {
      _controller.fetch();
    }
    print("initState");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
    print("dispose");
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      //do your stuff
      print("onResume");
      if (UserProfile.isLogin) {
        _controller.fetch();
      }
    } else {
      print("onResume else " + state.toString());
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
          "좋아요 목록",
          0xFFFFFFFF,
          isBack: false,
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
                .map((item) => GestureDetector(
                      onTap: () async {
                        dynamic d = await Get.to(() => FoodInformation(),
                            arguments: item.name);
                        print("activity result $d");
                        if (d as bool) {
                          setState(() {});
                        }
                      },
                      child: FoodTile(
                        item.name,
                        item.img,
                        0,
                        item.likes,
                        item.wishes,
                        [item.cancerNm, item.nutrition1],
                        likeStatus: 0,
                        bookmarkStatus: 1,
                        isOnTabDisabled: true,
                      ),
                    ))
                .toList()));
  }
}
