import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabBookmark/SearchBookmarkRepository/SearchBookmarkController.dart';
import 'package:my_side_client/TabHome/CommonViews.dart';
import 'package:my_side_client/TabHome/FoodRankingContainer.dart';
import 'package:my_side_client/TabSearch/FoodInformation.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/UserProfile.dart';

import 'SearchBookmarkRepository/SearchFoodItem.dart';

class TabBookmark extends StatefulWidget {
  TabBookmark({Key key});

  @override
  _TabBookmarkState createState() => _TabBookmarkState();
}

// SearchBookmarkController bookmarkController = SearchBookmarkController();

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
        body: Container(
      decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
      child: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: UserProfile.isLogin
              ? Obx(() => _controller.isLoading.value
                  ? loadingPage()
                  : _controller.lst.length == 0
                      ? noContent()
                      : mainContent(_controller.lst))
              : RequestLoginPage()),
    )
        // appBar: CustomAppBar(
        //   "좋아요 목록",
        //   0xFFF4F4F4,
        //   isBack: false,
        //   textColor: Colors.black,
        );
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
    return Column(
      children: [
        Container(
          height: 26,
          child: Text("좋아요 목록",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400)),
        ),
        Expanded(
          child: GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.6,
              mainAxisSpacing: 0,
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
                        child: BookmarkFoodTile(
                          item.name,
                          item.img,
                          0,
                          item.likes,
                          item.views,
                          [item.cancerNm ?? "", item.nutrition1 ?? ""],
                          likeStatus: 0,
                          bookmarkStatus: 1,
                          isOnTabDisabled: true,
                        ),
                      ))
                  .toList()),
        ),
      ],
    );
  }
}

class BookmarkFoodTile extends StatelessWidget {
  final String title;
  final String path;
  final int ranking;
  final int like;
  final int bookmark;
  int likeStatus = 0;
  int bookmarkStatus = 0;
  final List<String> tags;
  bool isOnTabDisabled = true;
  BookmarkFoodTile(
    this.title,
    this.path,
    this.ranking,
    this.like,
    this.bookmark,
    this.tags, {
    this.likeStatus,
    this.bookmarkStatus,
    this.isOnTabDisabled,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0),
        width: 164,
        height: 267,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Container(
                  height: 260,
                  decoration: BoxDecoration(
                      borderRadius: new BorderRadius.all(
                    const Radius.circular(30.0),
                  )),
                  // padding: EdgeInsets.only(top: 6),
                  child: Card(
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                  width: 128,
                                  height: 114,
                                  // child: Image.asset(path))),
                                  child: path != null
                                      ? path.isNotEmpty
                                          ? getImage(path)
                                          : Center(
                                              child: SizedBox(
                                                  child: ImageLoadFailedGrey(),
                                                  width: 52,
                                                  height: 44))
                                      : Center(
                                          child: SizedBox(
                                              child: ImageLoadFailedGrey(),
                                              width: 52,
                                              height: 44)))),
                          // SizedBox(height: 13.5),
                          SizedBox(
                              height: 24,
                              child: Text(
                                title,
                                style: TextStyle(fontSize: 16),
                              )),
                          SizedBox(
                            height: 5, //11인데 한글 일 때 높이가 약간 안맞음
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: ColorTags(
                                tags,
                                tagHeight: 24,
                                textHeight: 12,
                              )),
                          SizedBox(
                            height: 16,
                          ),
                          FittedBox(
                              child: LikeBookmark("", like, bookmark,
                                  likeStatus ?? 0, bookmarkStatus ?? 0,
                                  isOnTabDisabled: true)),
                        ],
                      ))),
            )
          ],
        ));
  }
}
