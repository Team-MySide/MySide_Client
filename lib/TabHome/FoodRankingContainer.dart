import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/common/CommonComponent.dart';

import 'CommonViews.dart';

class FoodRankingContainer extends StatelessWidget {
  const FoodRankingContainer({Key key}) : super(key: key);

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
              child: HeaderRow("좋아요가 많은 음식", isViewMore: true)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.5),
              child: Wrap(
                spacing: 7.5,
                runSpacing: 5,
                children: _getTop4FoodRankingList(),
              )),
          // SizedBox(height: 40)
        ]));
  }

  List<Widget> _getTop4FoodRankingList() {
    List<FoodTile> ret = [];
    List<Map> lst = [
      {
        "name": "볶은 땅콩",
        "path": "images/food4.png",
        "like": "123",
        "bookmark": "22"
      },
      {
        "name": "마늘",
        "path": "images/food3.png",
        "like": "123",
        "bookmark": "22"
      },
      {
        "name": "브로콜리",
        "path": "images/food2.png",
        "like": "123",
        "bookmark": "22"
      },
      {
        "name": "미역",
        "path": "images/food1.png",
        "like": "123",
        "bookmark": "22"
      }
    ];

    lst.asMap().forEach((index, e) => ret
        .add(FoodTile(e["name"], e["path"], index, e["like"], e["bookmark"])));

    return ret;
  }
}

class FoodTile extends StatelessWidget {
  final String title;
  final String path;
  final int ranking;
  final String like;
  final String bookmark;
  const FoodTile(
    this.title,
    this.path,
    this.ranking,
    this.like,
    this.bookmark, {
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
                                child: Image.asset(path))),
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
                        Align(alignment: Alignment.center, child: Tags()),
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
            Padding(
              padding: EdgeInsets.only(left: 10, top: 6),
              child: Align(
                  alignment: Alignment.topLeft, child: RankingBanner(ranking)),
            ),
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
      path = 'images/svg/foodranking_1.svg';
    } else if (ranking == 1) {
      path = 'images/svg/foodranking_2.svg';
    } else if (ranking == 2) {
      path = 'images/svg/foodranking_3.svg';
    } else {
      //ranking ==3
      path = 'images/svg/foodranking_4.svg';
    }
    return SvgPicture.asset(path);
  }
}
