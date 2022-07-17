import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabBookmark/SearchBookmarkRepository/SearchFoodItem.dart';
import 'package:my_side_client/TabSearch/FoodGridList.dart';
import 'package:my_side_client/TabSearch/FoodInformation.dart';

import 'package:my_side_client/common/CommonComponent.dart';
import 'CommonViews.dart';
import 'FoodRanking/FoodRankingController.dart';
import 'WholeFoodRankingContainer.dart';

class FoodRankingContainer extends StatelessWidget {
  FoodRankingContainer({this.isLimit = true, Key key}) : super(key: key);
  bool isLimit = true;
  final FoodRankingController controller = Get.put(FoodRankingController());
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 634,
        decoration: BoxDecoration(
          color: Color(0xFFF4F4F4),
        ),
        child: Column(children: [
          Padding(
              padding:
                  EdgeInsets.only(top: 40, bottom: 20, left: 16, right: 16),
              child: HeaderRow("좋아요가 많은 음식",
                  onClickAction: () =>
                      Get.to(() => WholeFoodRankingContainer(isLimit: false)),
                  // onClickAction: () => Navigator.push(
                  // context,
                  // MaterialPageRoute(
                  //     builder: (context) =>
                  //         FoodRankingContainer(isLimit: false))),
                  isViewMore: true)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.5),
              child: Obx(() {
                if (controller.lst.length == 0) {
                  return CircularProgressIndicator();
                }
                if (isLimit) {
                  return Wrap(
                    spacing: 7.5,
                    runSpacing: 5,
                    children: _getTop4FoodRankingList(controller.lst,
                        isLimit: isLimit),
                  );
                } else {
                  return Expanded(
                      child: CommonFoodGridList(controller.lst,
                          isShowRanking: false));
                }
              })),
        ]));
  }

  List<Widget> _getTop4FoodRankingList(List<FoodItem> lst, {bool isLimit}) {
    List<Widget> ret = [];

    if (isLimit) {
      lst = lst.sublist(0, 4);
    }

    lst.asMap().forEach((index, e) {
      return ret.add(GestureDetector(
          onTap: () => Get.to(() => FoodInformation(), arguments: e.name),
          child: FoodTile(
            // e.name, e.img, index, e.likes, e.wishes, e['tags'])));
            e.name,
            e.img,
            isLimit ? index + 1 : 0,
            e.likes,
            e.views,
            [e.cancerNm, e.nutrition1 ?? ""],
          )));
    });

    return ret;
  }
}

class FoodTile extends StatelessWidget {
  final String title;
  final String path;
  final int ranking;
  final int like;
  final int bookmark;
  int likeStatus = 0;
  int bookmarkStatus = 0;
  final List<String> tags;
  bool isOnTabDisabled = true;
  FoodTile(
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
        height: 246,
        child: Stack(
          children: [
            Container(
                height: 240,
                decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(
                  const Radius.circular(30.0),
                )),
                padding: EdgeInsets.only(top: 6),
                child: Card(
                    elevation: 0,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(top: 1),
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
                            child: ColorTags(tags)),
                        SizedBox(
                          height: 16,
                        ),
                        FittedBox(
                            child: LikeBookmark("", like, bookmark,
                                likeStatus ?? 0, bookmarkStatus ?? 0,
                                isOnTabDisabled: true)),
                      ],
                    ))),
            Padding(
                padding: EdgeInsets.only(left: 10, top: 6),
                child: Align(
                  alignment: Alignment.topLeft,
                  // child: ranking != 0 ? RankingBanner(ranking) : null),
                  child: RankingBanner(ranking),
                ))
          ],
        ));
  }
}

class RankingBanner extends StatelessWidget {
  final int ranking;
  const RankingBanner(this.ranking, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String path;
    if (ranking == 0) {
      return Container();
    }
    if (ranking == 1) {
      path = 'images/svg/foodranking_1.svg';
    } else if (ranking == 2) {
      path = 'images/svg/foodranking_2.svg';
    } else if (ranking == 3) {
      path = 'images/svg/foodranking_3.svg';
    } else if (ranking == 4) {
      //ranking ==3
      path = 'images/svg/foodranking_4.svg';
    }
    return SvgPicture.asset(path);
  }
}
