import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabHome/FoodRanking/FoodRankingController.dart';
import 'package:my_side_client/TabHome/FoodRanking/FoodRankingItem.dart';
import 'package:my_side_client/common/CommonComponent.dart';

import 'CommonViews.dart';

class FoodRankingContainer extends StatelessWidget {
  FoodRankingContainer({Key key}) : super(key: key);
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
              child: HeaderRow("좋아요가 많은 음식", isViewMore: false)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.5),
              child: Obx(() {
                if (controller.lst.length == 0) {
                  return CircularProgressIndicator();
                }
                return Wrap(
                  spacing: 7.5,
                  runSpacing: 5,
                  children: _getTop4FoodRankingList(controller.lst),
                );
              })),
          // SizedBox(height: 40)
        ]));
  }

  List<Widget> _getTop4FoodRankingList(RxList<FoodRankingItem> lst) {
    List<FoodTile> ret = [];

    List<FoodRankingItem> lst2 = lst.sublist(0, 4);

    lst2.asMap().forEach((index, e) {
      print(index.toString());
      print(e.name.toString());
      print(e.img.toString());
      return ret.add(FoodTile(
          // e.name, e.img, index, e.likes, e.wishes, e['tags'])));
          e.name,
          e.img,
          index,
          e.likes,
          e.wishes,
          [e.cancerNm, e.nutrition1 ?? ""]));
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
  final List<String> tags;
  const FoodTile(
    this.title,
    this.path,
    this.ranking,
    this.like,
    this.bookmark,
    this.tags, {
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
                  const Radius.circular(150.0),
                )),
                padding: EdgeInsets.only(top: 6),
                child: Card(
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
                                child: path.isNotEmpty
                                    ? Image.network(
                                        path,
                                        errorBuilder: (_, __, ___) {
                                          return Image.asset(
                                              "images/searchbar_logo.png");
                                        },
                                      )
                                    : Image.asset(
                                        "images/searchbar_logo.png"))),
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
                        Align(alignment: Alignment.center, child: Tags(tags)),
                        SizedBox(
                          height: 16,
                        ),
                        FittedBox(
                            child: LikeBookmark(
                          like: like,
                          bookmark: bookmark,
                        )),
                        // SizedBox(
                        //   height: 20,
                        // )
                      ],
                    ))),
            // ranking != 0
            //     ?
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
    if (ranking == -1) {
      return Container();
    }
    if (ranking == 0) {
      path = 'images/svg/foodranking_1.svg';
    } else if (ranking == 1) {
      path = 'images/svg/foodranking_2.svg';
    } else if (ranking == 2) {
      path = 'images/svg/foodranking_3.svg';
    } else if (ranking == 3) {
      //ranking ==3
      path = 'images/svg/foodranking_4.svg';
    }
    return SvgPicture.asset(path);
  }
}
