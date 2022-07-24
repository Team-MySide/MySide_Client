import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:my_side_client/TabHome/CommonViews.dart';
import 'package:my_side_client/TabSearch/SearchDetailFoodDetailInfo/SearchDetailFoodDetailInfoController.dart';
import 'package:my_side_client/TabSearch/SearchDetailFoodNutritionPercentageRepo/SearchDetailFoodNutritionPercentageBody.dart';
import 'package:my_side_client/TabSearch/SearchDetailFoodState/SearchDetailFoodStateController.dart';
import 'package:my_side_client/TabSearch/SearchDetailReference/SearchDetailMainInfoController.dart';
import 'package:my_side_client/common/ChangeBookmarkStatusRepository/ChangeBookmarkController.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/wigets/dialogwidget/singleButtonDialog.dart';
import '../Constants.dart';
import 'SearchDetailFoodNutritionPercentageRepo/SearchDetailFoodNutritionPercentageController.dart';
import 'SearchDetailMainInfo/SearchDetailMainInfoController.dart';
import 'SearchDetailReference/SearchDetailReference.dart';

RxString seletedFoodState;

class FoodInformation extends StatefulWidget {
  FoodInformation({Key key}) : super(key: key);

  @override
  _FoodInformationState createState() => _FoodInformationState();
}

bool isChangedBookmark = true;

class _FoodInformationState extends State<FoodInformation> {
  final String category = Get.arguments;
  @override
  void initState() {
    super.initState();
    seletedFoodState = "".obs;
  }

  SearchDetailMainInfoController _controller =
      Get.put(SearchDetailMainInfoController(Get.arguments));

  Future<bool> _onWillPop() async {
    Get.back(result: isChangedBookmark);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    print("category: $category");
    return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(body: SafeArea(
          child: Obx(() {
            if (_controller.isLoading.value) {
              return loadingPage();
            } else {
              if (_controller.isError.value) {
                return NetworkErrorPage();
              } else {
                return DefaultTabController(
                    length: 2,
                    child: NestedScrollView(
                      headerSliverBuilder: (context, _) {
                        return [
                          SliverList(
                              delegate: SliverChildListDelegate(
                                  List.generate(1, (index) {
                            return Stack(children: [
                              Container(
                                  color: Color(int.parse(
                                      "0xFF${_controller.item.value.color}")),
                                  child: Column(children: [
                                    CustomAppBar(
                                      "음식 정보",
                                      _controller.isLoading.value
                                          ? Colors.black
                                          : int.parse(
                                              "0xFF${_controller.item.value.color}"),
                                      isBack: true,
                                    ),
                                    Container(
                                        height: 140, color: Colors.transparent),
                                    Container(
                                      // height: 190,
                                      width: double.infinity,
                                      // color: Colors.transparent,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30))),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 46),
                                          Obx(() => _controller.isLoading.value
                                              ? Text("")
                                              : Text(
                                                  _controller.item.value.name,
                                                  style: TextStyle(
                                                      fontSize: 24,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color:
                                                          Color(0xFF111111)))),
                                          SizedBox(height: 8),
                                          Obx(() => _controller.isLoading.value
                                              ? ShimmerLoadingContainer(334, 37)
                                              : Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 16),
                                                  child: Text(
                                                      _controller.item.value
                                                              .title ??
                                                          "",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w100,
                                                          color: Color(
                                                              0xFF666666))))),
                                          SizedBox(height: 24),
                                          Obx(() => _controller.isLoading.value
                                              ? ShimmerLoadingContainer(334, 33)
                                              : Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Wrap(
                                                    spacing: 8,
                                                    runSpacing: 8,
                                                    alignment:
                                                        WrapAlignment.center,
                                                    children: [
                                                      ..._getCancerTagList(
                                                          _controller.item.value
                                                              .cancer),
                                                      ..._getNutritionTagList(
                                                          _controller.item.value
                                                              .nutrition),
                                                      ..._getEtcTagList(
                                                          _controller
                                                              .item.value.etc),
                                                    ],
                                                  ))),
                                          SizedBox(height: 32),
                                          Obx(
                                            () => _controller.isLoading.value
                                                ? ShimmerLoadingContainer(
                                                    180, 14)
                                                : FittedBox(
                                                    child: Obx(() =>
                                                        FoodInfoLikeShare(
                                                            _controller.item
                                                                .value.name,
                                                            _controller.item
                                                                .value.likes,
                                                            _controller
                                                                .item
                                                                .value
                                                                .likeStatus,
                                                            isOnTabDisabled:
                                                                false))),
                                          ),
                                          SizedBox(height: 12),
                                        ],
                                      ),
                                    ),
                                  ])),
                              Column(children: [
                                SizedBox(height: 102),
                                Container(
                                    height: 132,
                                    child: Obx(() => _controller.isLoading.value
                                        ? Center(
                                            child: SizedBox(
                                                width: 60,
                                                height: 60,
                                                child:
                                                    CircularProgressIndicator(
                                                        //color: Colors.white,
                                                        )))
                                        : Center(
                                            child: _controller
                                                    .item.value.img.isNotEmpty
                                                ? getImage(
                                                    _controller.item.value.img,
                                                  )
                                                : ImageLoadFailed()))),
                              ]),
                              _controller.item.value.infoTag == "none"
                                  ? SizedBox()
                                  : Positioned(
                                      left: 16,
                                      top: 212,
                                      child: _controller.item.value.infoTag ==
                                              "recommended"
                                          ? SvgPicture.asset(
                                              "images/svg/foodinfo_recommend.svg")
                                          : SvgPicture.asset(
                                              "images/svg/foodinfo_caution.svg")),
                              Positioned(
                                  right: 16,
                                  top: 212,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                          "images/svg/icon_eye.svg"),
                                      SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                          _controller.item.value.views
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color(0xFF666666))),
                                    ],
                                  )),
                            ]);
                          })))
                        ];
                      },
                      body: Column(children: [
                        TabBar(
                          tabs: [Tab(text: "성분표"), Tab(text: "세부설명")],
                          indicatorColor: Color(Constants.primaryColorInt),
                          labelColor: Color(Constants.primaryColorInt),
                          unselectedLabelColor: Color(0xFF666666),
                        ),
                        Expanded(
                            child: TabBarView(
                          children: [
                            IngredientTable(
                              category: category,
                            ),
                            DetailInfo()
                          ],
                        )),
                      ]),
                    ));
              }
            }
          }),
        )));
  }

  List<Widget> _getCancerTagList(List<String> cancers) {
    return cancers.map((tag) => ColorTag(tag, 0xFF1260A8, 0xFFE4F7FB)).toList();
  }

  List<Widget> _getNutritionTagList(List<String> nutritions) {
    return nutritions
        .map((nutrition) => ColorTag(nutrition, 0xFFFF7D05, 0xFFFFF6D6))
        .toList();
  }

  List<Widget> _getEtcTagList(List<String> etcs) {
    return etcs.map((etc) => ColorTag(etc, 0xFF306C13, 0xFFE1F0DB)).toList();
  }
}

class FoodInfoLikeShare extends StatefulWidget {
  int bookmark;
  int like;
  int likeStatus;
  int bookmarkStatus;
  String food;
  bool isOnTabDisabled = true;

  FoodInfoLikeShare(this.food, this.like, this.likeStatus,
      {this.isOnTabDisabled, Key key})
      : super(key: key);

  @override
  _FoodInfoLikeShareState createState() => _FoodInfoLikeShareState();
}

class _FoodInfoLikeShareState extends State<FoodInfoLikeShare> {
  ChangeBookmarkStatusController controller =
      Get.put(ChangeBookmarkStatusController());

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        GestureDetector(
          child: Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFDDDDDD),
                width: 1,
              ),
              shape: BoxShape.circle,
            ),
            child: Column(children: [
              SizedBox(
                height: 13,
              ),
              SizedBox(
                  width: 16,
                  height: 15,
                  child: SvgPicture.asset(widget.likeStatus == 0
                      ? "images/svg/like.svg"
                      : "images/svg/like_selected.svg")),
              SizedBox(height: 4.5),
              Text(widget.like.toString(),
                  style: TextStyle(fontSize: 16, color: Color(0xFF666666)))
            ]),
          ),
          onTap: () async {
            if (widget.isOnTabDisabled) {
              return;
            } else {
              bool result =
                  await controller.putLike(widget.food, widget.likeStatus);
              if (result) {
                if (widget.likeStatus == 0) {
                  widget.likeStatus = 1;
                  widget.like += 1;
                } else {
                  widget.likeStatus = 0;
                  widget.like -= 1;
                }
                Constants.isFoodInformationChanged =
                    !Constants.isFoodInformationChanged;
              }
              setState(() {});
            }
          },
        ),
        SizedBox(
          width: 16,
        ),
        GestureDetector(
            child: Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFDDDDDD),
                  width: 1,
                ),
                shape: BoxShape.circle,
              ),
              child: Column(children: [
                SizedBox(
                  height: 13,
                ),
                SizedBox(
                    width: 13,
                    height: 15,
                    child: SvgPicture.asset("assets/icons/share.svg")),
                SizedBox(height: 5.5),
                Text("공유",
                    style: TextStyle(fontSize: 14, color: Color(0xFF666666)))
              ]),
            ),
            onTap: () async {
              bool result = await controller.putBookmark(
                  widget.food, widget.bookmarkStatus);
              if (result) {
                if (widget.bookmarkStatus == 0) {
                  widget.bookmarkStatus = 1;
                  widget.bookmark += 1;
                } else {
                  widget.bookmarkStatus = 0;
                  widget.bookmark -= 1;
                }
                Constants.isFoodInformationChanged =
                    !Constants.isFoodInformationChanged;
              }
              setState(() {});
            }),
      ],
      // ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final int backgroundColor;
  bool isBack = true;
  bool isReference = false;
  CustomAppBar(this.title, this.backgroundColor,
      {Key key, this.isBack, this.isReference})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(widget.title,
            style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w400)),
        centerTitle: true,
        backgroundColor: Color(widget.backgroundColor),
        elevation: 0,
        leading: widget.isBack
            ? BackButton(
                color: Colors.black,
                onPressed: () {
                  Navigator.of(context).pop();
                })
            : null,
        actions: [
          // Container(
          //   margin: EdgeInsets.only(top: 13, bottom: 13, right: 13),
          //   child: InkWell(
          //     borderRadius: BorderRadius.all(Radius.circular(24)),
          //     onTap: () {
          //       Get.defaultDialog(
          //           title: '출처',
          //           content: Column(
          //               mainAxisSize: MainAxisSize.min,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text("• 사단법인 대한암협회",
          //                     style: TextStyle(
          //                         fontSize: 14, color: Color(0xFF666666))),
          //                 Text("• 세브란스병원",
          //                     style: TextStyle(
          //                         fontSize: 14, color: Color(0xFF666666)))
          //               ]));
          //     },
          //     child: Container(
          //       alignment: Alignment.center,
          //       padding: EdgeInsets.symmetric(horizontal: 15),
          //       decoration: BoxDecoration(
          //         // shape: BoxShape.rectangle,
          //         border: Border.all(width: 1.0, color: Color(0xFF666666)),
          //         borderRadius: BorderRadius.all(Radius.circular(24)),
          //       ),
          //       child: Text(
          //         "출처",
          //         style: TextStyle(fontSize: 12, color: Color(0xFF666666)),
          //       ),
          //     ),
          //   ),
          // )
        ]);
  }
}

class IngredientTable extends StatelessWidget {
  SearchDetailReferenceController _searchDetailReferenceController =
      Get.put(SearchDetailReferenceController(Get.arguments));
  final String category;
  IngredientTable({Key key, this.category}) : super(key: key);
  // final String food;
  SearchDetailFoodNutritionPercentageController
      _foodNutritionPercentageController =
      Get.put(SearchDetailFoodNutritionPercentageController(Get.arguments, ""));
  //add 날것, 삶은것
  // SearchDetailNutritionFactsController _nutritionfactsController =
  //     Get.put(SearchDetailNutritionFactsController(Get.arguments));
  SearchDetailFoodStateController _foodStateController =
      Get.put(SearchDetailFoodStateController(Get.arguments));
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      color: Color(0xFFF4F4F4),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Card(
                  elevation: 0,
                  margin: EdgeInsets.zero,
                  child: Obx(() {
                    if (_searchDetailReferenceController.isLoading.value) {
                      return
                          // ignore: missing_required_param
                          ReferenceContainer();
                    } else {
                      return ReferenceContainer(
                          item: _searchDetailReferenceController.item.value);
                    }
                  }))),
          Obx(() {
            if (_foodStateController.isLoading.value) {
              return SizedBox();
            } else {
              if (seletedFoodState.value.isEmpty) {
                seletedFoodState.value = _foodStateController.lst.first;
                //문제다
                _foodNutritionPercentageController
                    .fetch(seletedFoodState.value);
              }
              return Wrap(
                children: _foodStateController.lst
                    .map((state) => TextButton(
                        onPressed: () {
                          if (seletedFoodState.value != state) {
                            seletedFoodState.value = state;
                            _foodNutritionPercentageController
                                .fetch(seletedFoodState.value);
                          }
                        },
                        child: Text(state,
                            style: TextStyle(
                                fontSize: 16,
                                color: seletedFoodState.value == state
                                    ? Color(0xFF3BD7E2)
                                    : Color(0xFFAAAAAA)))))
                    .toList(),
              );
            }
          }),
          Padding(
              padding: EdgeInsets.all(16),
              child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1.0, color: Colors.transparent),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: Column(
                    children: [
                      SizedBox(height: 32),
                      Stack(children: [
                        Align(
                          child: DetailInfo().mainHeader("성분 퍼센트", 112),
                          alignment: Alignment.center,
                        ),
                        // SvgPicture.asset("images/arrow_right.svg")
                      ]),
                      SizedBox(height: 6),
                      Text("단위 : g\(12kcal=80g\)"),
                      SizedBox(height: 24),
                      Obx(() => _foodNutritionPercentageController
                              .isLoading.value
                          ? SizedBox(
                              width: 220,
                              height: 220,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ))
                          : AspectRatio(
                              aspectRatio: 1.5,
                              child: PieChart(
                                PieChartData(
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 0,
                                  sections: showingSections(
                                      _foodNutritionPercentageController.lst),
                                ),
                                swapAnimationDuration:
                                    Duration(milliseconds: 500),
                              ))),
                      SizedBox(height: 24),
                      Obx(() => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            child: _foodNutritionPercentageController
                                    .isLoading.value
                                ? ShimmerLoadingContainer(
                                    279,
                                    50,
                                    isRound: true,
                                  )
                                : GridView.count(
                                    shrinkWrap: true,
                                    crossAxisCount: 2,
                                    scrollDirection: Axis.vertical,
                                    childAspectRatio:
                                        5, //그리드뷰의 높이를 줄이기 위해 사용. why/????
                                    children: showingSectionColor(
                                        _foodNutritionPercentageController.lst),
                                  ),
                            // Wrap(
                            //   alignment: WrapAlignment.start,
                            //   runSpacing: 8,
                            //   children: showingSectionColor(
                            //       _foodNutritionPercentageController.lst),
                            // )
                          )),
                      SizedBox(height: 32)
                    ],
                  ))),
          NutritionDetailWidget(
              category: category, state: seletedFoodState.value)
        ],
      ),
    ));
  }

  Widget getChart(int v, int maxVal, int color) {
    double rate = v / maxVal;
    return ClipRRect(
      child: LinearProgressIndicator(
        //color: Color(color),
        backgroundColor: Color(0xFFE5E5E5),
        value: rate,
        minHeight: 6,
      ),
      borderRadius: BorderRadius.circular(7),
    );
  }

  List<int> colorList = [0xFF2F7DED, 0xFF31B6F7, 0xFF3BD7E2, 0xFFAAEADD];
  List<Container> showingSectionColor(List<FoodNutritionPercentageItem> items) {
    return items.asMap().entries.map((entry) {
      int idx = entry.key;
      FoodNutritionPercentageItem item = entry.value;

      return Container(
          child: Row(
            children: [
              // SizedBox(width: 32),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Color(colorList[idx])),
              ),
              SizedBox(width: 8),
              Text(item.nutnamekr, style: TextStyle(fontSize: 14)),
              // Text("(${item.category})",
              //     style: TextStyle(fontSize: 12, color: Color(0xFFAAAAAA))),
              // SizedBox(width: 32),
            ],
            mainAxisSize: MainAxisSize.min,
          ),
          height: 21);
    }).toList();
  }

  List<PieChartSectionData> showingSections(
      List<FoodNutritionPercentageItem> items) {
    return items.asMap().entries.map((entry) {
      int idx = entry.key;
      FoodNutritionPercentageItem item = entry.value;
      return PieChartSectionData(
        color: Color(colorList[idx]),
        value: item.g,
        title: item.g.toString(), //'16%',
        radius: 100,
        titleStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff)),
        // badgeWidget: _Badge(
        //   'assets/fitness-svgrepo-com.svg',
        //   size: widgetSize,
        //   borderColor: const Color(0xff845bef),
        // ),
        // badgePositionPercentageOffset: .98,
      );
    }).toList();
  }
}

class NutritionDetailWidget extends StatelessWidget {
  final String category;
  final String state;
  const NutritionDetailWidget({
    Key key,
    this.category,
    this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 46),
      child: GestureDetector(
        onTap: () => Get.toNamed("/FoodInformationNutritionDetail",
            arguments: [category, state]),
        child: Card(
            margin: EdgeInsets.zero,
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xFF3BD7E2), width: 1.0),
                borderRadius: BorderRadius.circular(8.0)),
            child: Container(
              width: double.infinity,
              height: 50,
              child: Center(
                child: Text("상세 성분 전체보기",
                    style: TextStyle(color: Color(0xFF3BD7E2))),
              ),
            )),
      ),
    );
  }
}

// class FoodStateHeaderListWidget extends StatefulWidget {
//   SearchDetailFoodNutritionPercentageController
//       _foodNutritionPercentageController;
//   FoodStateHeaderListWidget(
//     this._foodNutritionPercentageController,
//     this.stateList, {
//     Key key,
//   }) : super(key: key);
//   final List<String> stateList;

//   @override
//   State<FoodStateHeaderListWidget> createState() =>
//       _FoodStateHeaderListWidgetState();
// }

// class _FoodStateHeaderListWidgetState extends State<FoodStateHeaderListWidget> {
//   @override
//   void initState() {
//     super.initState();
//     widget._foodNutritionPercentageController.fetch(seletedFoodState.value);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Wrap(
//       children: widget.stateList
//           .map((state) => TextButton(
//               onPressed: () {
//                 if (seletedFoodState.value != state) {
//                   seletedFoodState.value = state;
//                   widget._foodNutritionPercentageController
//                       .fetch(seletedFoodState.value);
//                 }
//               },
//               child: Text(state,
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: seletedFoodState == state
//                           ? Color(0xFF3BD7E2)
//                           : Color(0xFFAAAAAA)))))
//           .toList(),

//     );
//   }
// }

class ReferenceContainer extends StatelessWidget {
  const ReferenceContainer({
    this.item,
  });

  final List<SearchDetailReferenceItem> item;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 64,
        child: Stack(children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: DetailInfo().mainHeader('출처', 48)),
          Positioned(
              right: 24,
              top: 36,
              child: SizedBox(
                width: 24,
                height: 24,
                child: GestureDetector(
                  onTap: () => Get.dialog(SingleButtonDialog(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    widgetBetween: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '출처 기준이 무엇인가요?',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text("이웃집닥터는 공신력 있는 병원과 기관에서 내용을 발췌해 출처를 제공해요.",
                            style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 16,
                                height: 1.5,
                                fontWeight: FontWeight.w300)),
                        SizedBox(
                          height: 32,
                        ),
                        Text("참고리스트",
                            style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                            "서울대병원 공식 블로그, 한양대 병원, 대한암협회, 국가암정보센터, 미국암협회(ACS), 미국 국립 보건원(NIH), 미국국립암연구소(NCI), 국제암연구소 등",
                            style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 16,
                                height: 1.5,
                                fontWeight: FontWeight.w300)),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                    dialogHeight: 432,
                    routeFunc: () {
                      Get.back();
                    },
                  )),
                  child: SvgPicture.asset("images/svg/questionmark.svg"),
                ),
              )),
        ]),
      ),
      SizedBox(
        height: 24,
      ),
      ...referenceRows(item)
    ]);
  }
}

List<Widget> referenceRows(List<SearchDetailReferenceItem> items) {
  if (items == null) {
    return [ReferenceRow()];
  }
  List<Widget> ret = [];
  for (SearchDetailReferenceItem item in items) {
    ret.add(ReferenceRow(item: item));
  }
  return ret;
}

class ReferenceRow extends StatelessWidget {
  final SearchDetailReferenceItem item;
  const ReferenceRow({
    this.item,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              width: 58,
              child: Text(item == null ? "?" : item.cancerNm,
                  style: TextStyle(fontSize: 16))),
          ReferenceItem(
              item == null ? "" : item.cancerNm,
              item == null ? "0" : item.flagList[0].count.toString(),
              ReferenceEffectType.effective),
          ReferenceItem(
              item == null ? "" : item.cancerNm,
              item == null ? "0" : item.flagList[1].count.toString(),
              ReferenceEffectType.arguing),
          ReferenceItem(
              item == null ? "" : item.cancerNm,
              item == null ? "0" : item.flagList[2].count.toString(),
              ReferenceEffectType.danger),
        ],
      ),
    );
  }
}

enum ReferenceEffectType { effective, arguing, danger }

class ReferenceItem extends StatelessWidget {
  final String count;
  final ReferenceEffectType type;
  final String cancerNm;
  const ReferenceItem(
    this.cancerNm,
    this.count,
    this.type, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("");
        Get.toNamed("/FoodReferenceDesc", arguments: {
          "cancerNm": cancerNm,
          "food": Get.arguments,
          "code": type == ReferenceEffectType.effective
              ? "1"
              : type == ReferenceEffectType.arguing
                  ? "2"
                  : "3"
        });
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color(
                  count == "0" ? 0xFFF4F4F4 : getColorOfType(type),
                ).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8)),
            width: 40,
            height: 40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 8),
                Divider(
                  indent: 12,
                  endIndent: 12,
                  color: Color(getColorOfType(type)),
                  thickness: 1,
                  height: 2,
                ),
                SizedBox(height: 6),
                Text(
                  count,
                  style: TextStyle(
                      color: count == "0"
                          ? Colors.black.withOpacity(0.3)
                          : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            type == ReferenceEffectType.effective
                ? "효과있음"
                : type == ReferenceEffectType.arguing
                    ? "의견갈림"
                    : "주의",
            style: TextStyle(fontSize: 12, color: Color(0xFF666666)),
          )
        ],
      ),
    );
  }

  int getColorOfType(ReferenceEffectType type) {
    switch (type) {
      case ReferenceEffectType.effective:
        return 0xFF7EC05E;
      case ReferenceEffectType.arguing:
        return 0xFFFECE00;
      case ReferenceEffectType.danger:
        return 0xFFFA665B;
    }
  }
}

class DetailInfo extends StatelessWidget {
  DetailInfo({Key key}) : super(key: key);
  SearchDetailFoodDetailController _controller =
      Get.put(SearchDetailFoodDetailController(Get.arguments));
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            color: Color(0xFFF4F4F4),
            child: Column(mainAxisSize: MainAxisSize.max, children: [
              Padding(
                  padding: EdgeInsets.all(16),
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    child: Column(
                      children: <Widget>[
                        Padding(
                            child: mainHeader("효능 및 영양성분", 158),
                            padding: EdgeInsets.only(top: 32, bottom: 24)),
                        Obx(() => _controller.isLoading.value
                            ? ShimmerLoadingContainer(311, 150)
                            : content(_controller.item.value.efficacy)),
                        SizedBox(height: 32)
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            child: mainHeader("섭취 가이드", 110),
                            padding: EdgeInsets.only(top: 32, bottom: 24)),
                        subHeader("궁합"),
                        SizedBox(
                          height: 8,
                        ),
                        Obx(() => _controller.isLoading.value
                            ? ShimmerLoadingContainer(311, 22)
                            : content(_controller.item.value.combination)),
                        SizedBox(
                          height: 16,
                        ),
                        subHeader("고르는 법"),
                        SizedBox(
                          height: 8,
                        ),
                        Obx(() => _controller.isLoading.value
                            ? ShimmerLoadingContainer(311, 22)
                            : content(_controller.item.value.selectTip)),
                        SizedBox(
                          height: 16,
                        ),
                        subHeader("손질법"),
                        SizedBox(
                          height: 8,
                        ),
                        Obx(() => _controller.isLoading.value
                            ? ShimmerLoadingContainer(311, 22)
                            : content(_controller.item.value.care)),
                        SizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  )),
            ])));
  }

  mainHeader(String title, double width) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          width: width,
          child: Container(
            height: 8,
            color: Color(0x483BD7E2),
          ),
        ),
        SizedBox(
          // height: 32,
          child: Text(title,
              style: TextStyle(
                fontSize: 22,
                // color: Color(0xFF111111),
                // backgroundColor: Color(0x483BD7E2)
              )),
        ),
        // backgroundColor: Color(0x483BD7E2))),
        //  Column(children: [
        // SizedBox(height: 12),

        // ]
      ],
    );
  }

  // getDoubledText(String input){
  //   String ret = "$input$input";
  //   for ()
  //   return
  // }
  subHeader(String title) {
    return Padding(
        child: Align(
            alignment: Alignment.centerLeft,
            child: Text(title,
                style: TextStyle(fontSize: 16, color: Color(0xFF111111)))),
        padding: EdgeInsets.symmetric(horizontal: 14));
  }

  content(String content) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Text(content,
            style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 14,
                height: 1.5,
                color: Color(0xFF666666))));
  }
}
// class NutritionFactCombination extends StatelessWidget {
//   const NutritionFactCombination({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Card(
//                   elevation: 0,
//                   margin: EdgeInsets.zero,
//                   child: Column(
//                     children: [
//                       Padding(
//                           child: Stack(children: [
//                             Align(
//                               child: DetailInfo().mainHeader("성분구성", 88),
//                               alignment: Alignment.center,
//                             ),
//                             // Align(
//                             //   child: Text(">"),
//                             //   alignment: Alignment.centerRight,
//                             // ),
//                           ]),
//                           padding: EdgeInsets.symmetric(
//                               vertical: 32, horizontal: 24)),
//                       Padding(
//                         child: Obx(() => Row(
//                               children: [
//                                 SizedBox(
//                                     width: 140,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Text("특정암에 좋은 성분",
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                             )),
//                                         SizedBox(height: 13),
//                                         Text("특정암에 안좋은 성분",
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                             )),
//                                         SizedBox(height: 13),
//                                         Text("기능성 성분",
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                             )),
//                                         SizedBox(height: 13),
//                                         Text("기타성분",
//                                             style: TextStyle(
//                                               fontSize: 14,
//                                             ))
//                                       ],
//                                     )),
//                                 Expanded(
//                                     child: Column(
//                                   children: [
//                                     SizedBox(height: 4),
//                                     _nutritionfactsController.isLoading.value
//                                         ? ShimmerLoadingContainer(117, 8)
//                                         : getChart(
//                                             _nutritionfactsController
//                                                 .item.value.good,
//                                             _nutritionfactsController
//                                                 .item.value.goodMax,
//                                             0xFF31B6F7),
//                                     SizedBox(height: 23),
//                                     _nutritionfactsController.isLoading.value
//                                         ? ShimmerLoadingContainer(117, 8)
//                                         : getChart(
//                                             _nutritionfactsController
//                                                 .item.value.bad,
//                                             _nutritionfactsController
//                                                 .item.value.badMax,
//                                             0xFFFA665B),
//                                     SizedBox(height: 23),
//                                     _nutritionfactsController.isLoading.value
//                                         ? ShimmerLoadingContainer(117, 8)
//                                         : getChart(
//                                             _nutritionfactsController
//                                                 .item.value.function,
//                                             _nutritionfactsController
//                                                 .item.value.functionMax,
//                                             0xFF31B6F7),
//                                     SizedBox(height: 23),
//                                     _nutritionfactsController.isLoading.value
//                                         ? ShimmerLoadingContainer(117, 8)
//                                         : getChart(
//                                             _nutritionfactsController
//                                                 .item.value.etc,
//                                             _nutritionfactsController
//                                                 .item.value.etcMax,
//                                             0xFFAAAAAA),
//                                   ],
//                                 )
//                                     // child: BarChartSample1(
//                                     //     _nutritionfactsController.item.value)
//                                     ),
//                                 Padding(
//                                     child: Column(
//                                       children: [
//                                         _nutritionfactsController
//                                                 .isLoading.value
//                                             ? ShimmerLoadingContainer(10, 15)
//                                             : Text(_nutritionfactsController
//                                                 .item.value.good
//                                                 .toString()),
//                                         SizedBox(height: 13),
//                                         _nutritionfactsController
//                                                 .isLoading.value
//                                             ? ShimmerLoadingContainer(10, 15)
//                                             : Text(_nutritionfactsController
//                                                 .item.value.bad
//                                                 .toString()),
//                                         SizedBox(height: 13),
//                                         _nutritionfactsController
//                                                 .isLoading.value
//                                             ? ShimmerLoadingContainer(10, 15)
//                                             : Text(_nutritionfactsController
//                                                 .item.value.function
//                                                 .toString()),
//                                         SizedBox(height: 13),
//                                         _nutritionfactsController
//                                                 .isLoading.value
//                                             ? ShimmerLoadingContainer(10, 15)
//                                             : Text(_nutritionfactsController
//                                                 .item.value.etc
//                                                 .toString()),
//                                       ],
//                                     ),
//                                     padding:
//                                         EdgeInsets.only(left: 11, right: 32))
//                               ],
//                             )),
//                         padding: EdgeInsets.only(bottom: 32, left: 32),
//                       )
//                     ],
//                   )))
//           ;
//   }
// }
