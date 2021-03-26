import 'package:flutter/material.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/common/CommonComponent.dart';

import 'CommonViews.dart';

class FoodRankingContainer extends StatelessWidget {
  const FoodRankingContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      HeaderRow("위암에 좋은 추천음식", isViewMore: true),
      SizedBox(height: Constants.paddingBetweenTitleAndBelowComponent),
      Wrap(
        children: _getTop4FoodRankingList(),
      ),
      SizedBox(height: 50)
    ]);
  }

  List<Widget> _getTop4FoodRankingList() {
    List<FoodTile> ret = [];
    List<Map> lst = [
      {"name": "볶은 땅콩", "path": "images/food4.png"},
      {"name": "마늘", "path": "images/food3.png"},
      {"name": "브로콜리", "path": "images/food2.png"},
      {"name": "미역", "path": "images/food1.png"}
    ];

    lst.forEach((e) => ret.add(FoodTile(e["name"], e["path"])));

    return ret;
  }
}

class FoodTile extends StatelessWidget {
  final String title;
  final String path;
  const FoodTile(this.title, this.path, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 163.5,
      height: 211.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 144, height: 144, child: Image.asset(path)),
          // SizedBox(height: 13.5),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 4.2, //11인데 한글 일 때 높이가 약간 안맞음
          ),
          Tags()
        ],
      ),
    );
  }
}
