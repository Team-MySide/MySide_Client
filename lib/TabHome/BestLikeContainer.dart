import 'package:flutter/material.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabHome/CommonViews.dart';
import 'package:my_side_client/common/CommonComponent.dart';

class BestLikeContainer extends StatefulWidget {
  const BestLikeContainer({Key key}) : super(key: key);

  @override
  _BestLikeContainerState createState() => _BestLikeContainerState();
}

class _BestLikeContainerState extends State<BestLikeContainer> {
  List<Map> lst = [
    {"name": "땅콩", "path": "images/food4.png"},
    {"name": "마늘", "path": "images/food1.png"}
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderRow("😍 좋아요가 많은 음식", isViewMore: true),
        Container(
            height: 249.6,
            child: ListView.builder(
                padding:
                    EdgeInsets.only(top: Constants.paddingBetweenMainComponent),
                itemCount: 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return LikeBestTile(lst[index], index);
                }))
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
    return SizedBox(
        width: 245.08,
        height: 249.6,
        child: Column(children: [
          SizedBox(
              width: 198.8,
              height: 179.81,
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
          Text(item["name"],
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 6),
          Align(alignment: Alignment.center, child: Tags())
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
