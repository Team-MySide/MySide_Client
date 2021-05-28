import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabHome/CommonViews.dart';
import 'package:my_side_client/TabHome/FoodRecommend/FoodRecommendController.dart';
import 'package:my_side_client/common/CommonComponent.dart';

import 'FoodRecommend/FoodRecommendation.dart';

class FoodRecommendContainer extends StatelessWidget {
  FoodRecommendContainer({Key key}) : super(key: key);
  FoodRecommendController _controller = Get.put(FoodRecommendController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => _controller.isLoading.value
        ? CircularProgressIndicator()
        : Column(
            children: [
              Padding(
                  padding:
                      EdgeInsets.only(top: 40, bottom: 30, left: 16, right: 16),
                  child: HeaderRow("${_controller.lst.first.cancerNm}에 좋은 추천음식",
                      isViewMore: true)),
              Container(
                  // color: Colors.amber,
                  height: 296, //원래 283 ㄱ

                  child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: [
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
                          itemCount: _controller.lst.length,
                          controller: PageController(viewportFraction: 0.5),
                          // onPageChanged: (int index) => setState(()=> _index = index),
                          itemBuilder: (_, i) {
                            return LikeBestTile(_controller.lst[i]);
                          },
                        )
                      ])
                  // )
                  )
            ],
          ));
  }
}

class LikeBestTile extends StatelessWidget {
  final FoodRecommendItem item;

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
                  child: FadeInImage.assetNetwork(
                      image: item.img,
                      placeholder: Constants.IMG_PLACE_HOLDER))),
          SizedBox(
              height: 28,
              child: Text(item.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))),
          SizedBox(height: 4),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Align(
                  alignment: Alignment.center,
                  child: Tags([item.cancerNm, item.nutrition1]))),
          SizedBox(height: 11),
          LikeBookmark(like: item.likes, bookmark: item.wishes),
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
