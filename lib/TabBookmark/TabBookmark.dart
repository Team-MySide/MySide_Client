import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabBookmark/SearchBookmarkRepository/SearchBookmarkController.dart';
import 'package:my_side_client/TabHome/FoodRankingContainer.dart';
import 'package:my_side_client/TabSearch/FoodInformation.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/UserProfile.dart';

class TabBookmark extends StatelessWidget {
  TabBookmark({Key key}) : super(key: key);
  SearchBookmarkController _controller = Get.put(SearchBookmarkController());
  List<dynamic> lst = [
    // {
    //   "name": "땅콩",
    //   "path": "images/food4.png",
    //   "like": "123",
    //   "bookmark": "22",
    //   "tags": ["위암", "비타민e"]
    // },
    // {
    //   "name": "마늘",
    //   "path": "images/food1.png",
    //   "like": "23",
    //   "bookmark": "122",
    //   "tags": ["비타민1", "비타민e"]
    // },
    // {
    //   "name": "마늘",
    //   "path": "images/food1.png",
    //   "like": "23",
    //   "bookmark": "122",
    //   "tags": ["위암", "비타민e"]
    // },
    // {
    //   "name": "마늘",
    //   "path": "images/food1.png",
    //   "like": "23",
    //   "bookmark": "122",
    //   "tags": ["위암", "비타민e"]
    // }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: UserProfile.isLogin
                ? Obx(() => _controller.isLoading.value
                    ? loadingPage()
                    : lst.length == 0
                        ? noContent()
                        : mainContent())
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

  Widget mainContent() {
    return Wrap(
        children: lst
            .map(
              (item) => FoodTile(item.name, item.path, 0, int.parse(item.like),
                  int.parse(item.bookmark), item.tags),
            )
            .toList());
  }
}
