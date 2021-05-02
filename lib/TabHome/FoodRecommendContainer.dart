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
    {"name": "마늘", "path": "images/food1.png", "like": "23", "bookmark": "122"},
    {"name": "마늘", "path": "images/food1.png", "like": "23", "bookmark": "122"}
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 40, bottom: 30, left: 16, right: 16),
            child: HeaderRow("위암에 좋은 추천음식", isViewMore: true)),
        Container(
            // color: Colors.amber,
            height: 296, //원래 283 ㄱ
            // child: ListView.separated(
            //   padding:
            //       EdgeInsets.only(top: Constants.paddingBetweenMainComponent),
            //   itemCount: 2,
            //   scrollDirection: Axis.horizontal,
            //   itemBuilder: (BuildContext context, int index) {
            //     return LikeBestTile(lst[index], index);
            //   },
            //   separatorBuilder: (BuildContext context, int index) =>
            //       SizedBox(width: 20),
            // ))
            child:
                // Align(
                //     alignment: Alignment.center,
                //     child:
                Stack(alignment: AlignmentDirectional.topCenter, children: [
              // Positioned.fill(
              //     child: Align(
              //         alignment: AlignmentDirectional.center,
              //         child:
              Container(
                  width: 200,
                  height: 180,
                  child: ClipPath(
                    child: Container(color: Color(0xFFF9F1DF)),
                    clipper: OctagonClipper(),
                    // )
                    // )
                  )),
              PageView.builder(
                itemCount: lst.length,
                controller: PageController(viewportFraction: 0.5),
                // onPageChanged: (int index) => setState(()=> _index = index),
                itemBuilder: (_, i) {
                  return LikeBestTile(lst[i]);
                },
              )
            ])
            // )
            )
      ],
    );
  }
}

class LikeBestTile extends StatelessWidget {
  final Map item;

  const LikeBestTile(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(top: 64, left: 6, right: 6),
              child: Container(
                  // color: Colors.yellow,
                  width: 184,
                  height: 144,
                  child: Image.asset(item["path"]))
              // ),

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
        ]));
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

class ListWheelScrollViewX extends StatelessWidget {
  final Widget Function(BuildContext, int) builder;
  final Axis scrollDirection;
  final FixedExtentScrollController controller;
  final double itemExtent;
  final double diameterRatio;
  final void Function(int) onSelectedItemChanged;
  const ListWheelScrollViewX({
    Key key,
    @required this.builder,
    @required this.itemExtent,
    this.controller,
    this.onSelectedItemChanged,
    this.scrollDirection = Axis.vertical,
    this.diameterRatio = 100000,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: scrollDirection == Axis.horizontal ? 3 : 0,
      child: ListWheelScrollView.useDelegate(
        onSelectedItemChanged: onSelectedItemChanged,
        controller: controller,
        itemExtent: itemExtent,
        diameterRatio: diameterRatio,
        physics: FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            return RotatedBox(
              quarterTurns: scrollDirection == Axis.horizontal ? 1 : 0,
              child: builder(context, index),
            );
          },
        ),
      ),
    );
  }
}
