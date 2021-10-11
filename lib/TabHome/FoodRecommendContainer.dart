import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabHome/CommonViews.dart';
import 'package:my_side_client/TabHome/FoodRecommend/FoodRecommendController.dart';
import 'package:my_side_client/TabSearch/FoodInformation.dart';
import 'package:my_side_client/TabSearch/SerachDiseaseResult.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'FoodRecommend/FoodRecommendation.dart';

class FoodRecommendContainer extends StatefulWidget {
  FoodRecommendContainer({Key key}) : super(key: key);

  @override
  _FoodRecommendContainerState createState() => _FoodRecommendContainerState();
}

class _FoodRecommendContainerState extends State<FoodRecommendContainer> {
  FoodRecommendController _controller = Get.put(FoodRecommendController());
  int activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            Padding(
                padding:
                    EdgeInsets.only(top: 40, bottom: 30, left: 16, right: 16),
                child: _controller.isLoading.value || _controller.lst == null
                    ? HeaderRow("병에 좋은 추천음식", isViewMore: false)
                    : HeaderRow("${_controller.lst.first.cancerNm}에 좋은 추천음식",
                        onClickAction: () => Get.to(() => SearchDiseaseResult(),
                            arguments: _controller.lst.first.cancerNm),
                        isViewMore: true)),
            Container(
                // color: Colors.amber,
                height: 296, //원래 283 ㄱ
                child:
                    Stack(alignment: AlignmentDirectional.topCenter, children: [
                  _controller.isLoading.value || _controller.lst == null
                      ? Container()
                      : Container(
                          width: 200,
                          height: 180,
                          child: ClipPath(
                            child: AnimatedContainer(
                                color: Color(int.parse(
                                    "0xFF${_controller.lst[activePage].backgroundColor ?? 'E9F1D1'}")),
                                duration: Duration(
                                  milliseconds: 1000,
                                )),
                            clipper: OctagonClipper(),
                          )),
                  _controller.isLoading.value || _controller.lst == null
                      ? Column(children: [
                          Row(
                            children: [
                              ShimmerLoadingContainer(20, 180),
                              ShimmerLoadingContainer(200, 180),
                              ShimmerLoadingContainer(20, 180)
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              ShimmerLoadingContainer(20, 86),
                              ShimmerLoadingContainer(200, 86),
                              ShimmerLoadingContainer(20, 86)
                            ],
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          )
                        ])
                      : PageView.builder(
                          itemCount: _controller.lst.length,
                          controller: PageController(viewportFraction: 0.5),
                          onPageChanged: (int index) {
                            setState(() {
                              activePage = index;
                            });
                          },
                          itemBuilder: (_, i) {
                            return LikeBestTile(_controller.lst[i]);
                          },
                        )
                ]))
          ],
        ));
  }
}

class LikeBestTile extends StatelessWidget {
  final FoodRecommendItem item;

  const LikeBestTile(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 64, left: 6, right: 6),
                    child: Container(
                        // color: Colors.yellow,
                        width: 184,
                        height: 144,
                        child: getImage(item.img))),
                SizedBox(
                    height: 28,
                    child: Text(item.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))),
                SizedBox(height: 4),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Align(
                        alignment: Alignment.center,
                        child: ColorTags([item.cancerNm, item.nutrition1]))),
                SizedBox(height: 11),
                LikeBookmark("", item.likes, item.wishes, 0, 0),
              ],
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center
            )),
        onTap: () => Get.to(() => FoodInformation(), arguments: item.name));
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
