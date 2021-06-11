import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabBookmark/BookmarkController.dart';
import 'package:my_side_client/TabHome/FoodRankingContainer.dart';
import 'package:my_side_client/TabSearch/FoodInformation.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/UserProfile.dart';

class TabBookmark extends StatelessWidget {
  final BookmarkController _bookmarkController = Get.put(BookmarkController(0));

  TabBookmark({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            child: UserProfile.isLogin
                ? Obx(() => Wrap(
                    children: _bookmarkController.data
                        .map(
                          (item) => FoodTile(
                              item.name,
                              item.path,
                              0,
                              int.parse(item.like),
                              int.parse(item.bookmark),
                              item.tags),
                        )
                        .toList()))
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
}
