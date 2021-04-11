import 'package:flutter/material.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabHome/CommonViews.dart';
import 'package:my_side_client/common/CommonComponent.dart';

class FoodRecommendContainer extends StatefulWidget {
  const FoodRecommendContainer({Key key}) : super(key: key);

  @override
  _FoodRecommendContainer createState() => _FoodRecommendContainer();
}

class _FoodRecommendContainer extends State<FoodRecommendContainer> {
  List<Map> lst = [
    {"name": "땅콩", "path": "images/food4.png", "like": "123", "bookmark": "22"},
    {"name": "마늘", "path": "images/food1.png", "like": "23", "bookmark": "122"},
    {"name": "마늘", "path": "images/food1.png", "like": "23", "bookmark": "122"}
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 40, bottom: 30),
            child: HeaderRow("위암에 좋은 추천음식", isViewMore: true)),
        Container(
            height: 296, //원래 283 ㄱ
            child: ListView.separated(
              padding:
                  EdgeInsets.only(top: Constants.paddingBetweenMainComponent),
              itemCount: 2,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return LikeBestTile(lst[index], index);
              },
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: 20),
            ))
      ],
    );
  }
}

class LikeBestTile extends StatelessWidget {
  final Map item;
  final int index;
  const LikeBestTile(this.item, this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          width: 200,
          height: 180,
          child: Stack(
            children: [
              ClipPath(
                child: Container(color: Color(0xFFF9F1DF)),
                clipper: OctagonClipper(),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 20, top: 2.6),
              // child: SizedBox(
              //     width: 39,
              //     height: 39,
              //     child: CircleAvatar(
              //         backgroundColor: Color(0xFFE9BF4D),
              //         child: Text("${index + 1}위",
              //             style: TextStyle(
              //                 fontSize: 14, color: Colors.white)))),
              // ),
              // Padding(
              // padding: EdgeInsets.only(top: 41),
              // child:
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 171.15,
                      height: 141.93,
                      child: Image.asset(item["path"])))
              // ),
            ],
          )),
      SizedBox(
        height: 22,
      ),
      SizedBox(
          height: 28,
          child: Text(item["name"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
      SizedBox(height: 4),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Align(alignment: Alignment.center, child: Tags())),
      SizedBox(height: 11),
      LikeBookmark(
        like: item["like"],
        bookmark: item["bookmark"],
      ),
    ]);
  }
}

class OctagonClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    return new Path()
      ..moveTo(0, 42)
      ..lineTo(0, 180)
      ..lineTo(200, 180)
      ..lineTo(200, 42)
      ..lineTo(100, 0)
      ..lineTo(0, 42);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
