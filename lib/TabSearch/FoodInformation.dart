import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabHome/CommonViews.dart';
import 'package:my_side_client/TabSearch/SearchDetailFoodNutritionPercentageRepo/SearchDetailFoodNutritionPercentageBody.dart';
import 'package:my_side_client/TabSearch/SearchNutritionFactsRepository/SearchNutritionFactsController.dart';
import 'package:my_side_client/common/CommonComponent.dart';

import 'package:my_side_client/common/CommonHeader.dart';

import 'SearchDetailFoodNutritionPercentageRepo/SearchDetailFoodNutritionPercentageController.dart';
import 'SearchDetailMainInfo/SearchDetailMainInfoController.dart';

class FoodInformation extends StatelessWidget {
  FoodInformation(this.category, {Key key}) : super(key: key);
  final String category;
  SearchDetailMainInfoController _mainInfoController =
      Get.put(SearchDetailMainInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppbar("음식 정보"),
        body: DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, _) {
                return [
                  SliverList(
                      delegate:
                          SliverChildListDelegate(List.generate(1, (index) {
                    return Stack(children: [
                      Column(children: [
                        Padding(
                            padding: EdgeInsets.only(top: 40),
                            child: Container()),
                        SizedBox(
                            width: 224,
                            height: 200,
                            child: Obx(() => _mainInfoController.isLoading.value
                                ? Image.asset("images/food1.png")
                                : Image.network(
                                    _mainInfoController.item.value.img))),
                        SizedBox(height: 16),
                        Text(category,
                            style: TextStyle(
                                fontSize: 24, color: Color(0xFF111111))),
                        SizedBox(height: 8),
                        Obx(() => Text(_mainInfoController.item.value.title,
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF666666)))),
                        SizedBox(height: 24),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Obx(() => Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  alignment: WrapAlignment.center,
                                  children: [
                                    ..._getCancerTagList(
                                        _mainInfoController.item.value.cancer),
                                    ..._getNutritionTagList(_mainInfoController
                                        .item.value.nutrition),
                                    ..._getEtcTagList(
                                        _mainInfoController.item.value.etc),
                                  ],
                                ))),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 32),
                            child: Obx(() => FittedBox(
                                child: LikeBookmark(
                                    like: _mainInfoController.item.value.likes,
                                    bookmark: _mainInfoController
                                        .item.value.wishes))))
                      ]),
                    ]);
                  })))
                ];
              },
              body: Column(children: [
                TabBar(
                  tabs: [Tab(text: "성분표"), Tab(text: "세부설명")],
                ),
                Expanded(
                    child: TabBarView(
                  children: [IngredientTable(), DetailInfo()],
                )),
              ]),
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

class IngredientTable extends StatelessWidget {
  IngredientTable({Key key}) : super(key: key);
  SearchDetailFoodNutritionPercentageController
      _foodNutritionPercentageController =
      Get.put(SearchDetailFoodNutritionPercentageController());

  SearchNutritionFactsController _nutritionfactsController =
      Get.put(SearchNutritionFactsController("당근"));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: Column(
        children: [
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: null,
                  child: Text('생것',
                      style:
                          TextStyle(fontSize: 16, color: Color(0xFF3BD7E2)))),
              Text("|", style: TextStyle(color: Color(0xFFDDDDDD))),
              TextButton(
                  onPressed: null,
                  child: Text('삶은것',
                      style:
                          TextStyle(fontSize: 16, color: Color(0xFFAAAAAA)))),
              Text("|", style: TextStyle(color: Color(0xFFDDDDDD))),
              TextButton(
                  onPressed: null,
                  child: Text('마른것',
                      style:
                          TextStyle(fontSize: 16, color: Color(0xFFAAAAAA)))),
            ],
          ),
          Card(
              child: Column(
            children: [
              Padding(
                  child: Stack(children: [
                    Align(
                      child: Text("성분구성", style: TextStyle(fontSize: 22)),
                      alignment: Alignment.center,
                    ),
                    // Align(
                    //   child: Text(">"),
                    //   alignment: Alignment.centerRight,
                    // ),
                  ]),
                  padding: EdgeInsets.symmetric(vertical: 32, horizontal: 24)),
              Padding(
                child: Obx(() => Row(
                      children: [
                        SizedBox(
                            width: 140,
                            child: Column(
                              children: [
                                Text("특정암에 좋은 성분",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                SizedBox(height: 13),
                                Text("특정암에 안좋은 성분",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                SizedBox(height: 13),
                                Text("기능성 성분",
                                    style: TextStyle(
                                      fontSize: 14,
                                    )),
                                SizedBox(height: 13),
                                Text("기타성분",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ))
                              ],
                            )),
                        _nutritionfactsController.isLoading.value
                            ? CircularProgressIndicator()
                            : Expanded(
                                child: Column(
                                children: [
                                  SizedBox(height: 4),
                                  getChart(
                                      _nutritionfactsController.item.value.good,
                                      _nutritionfactsController
                                          .item.value.goodMax,
                                      0xFF31B6F7),
                                  SizedBox(height: 23),
                                  getChart(
                                      _nutritionfactsController.item.value.bad,
                                      _nutritionfactsController
                                          .item.value.badMax,
                                      0xFFFA665B),
                                  SizedBox(height: 23),
                                  getChart(
                                      _nutritionfactsController
                                          .item.value.function,
                                      _nutritionfactsController
                                          .item.value.functionMax,
                                      0xFF31B6F7),
                                  SizedBox(height: 23),
                                  getChart(
                                      _nutritionfactsController.item.value.etc,
                                      _nutritionfactsController
                                          .item.value.etcMax,
                                      0xFFAAAAAA),
                                ],
                              )
                                // child: BarChartSample1(
                                //     _nutritionfactsController.item.value)
                                ),
                        Padding(
                            child: Column(
                              children: [
                                Text(_nutritionfactsController.item.value.good
                                    .toString()),
                                SizedBox(height: 13),
                                Text(_nutritionfactsController.item.value.bad
                                    .toString()),
                                SizedBox(height: 13),
                                Text(_nutritionfactsController
                                    .item.value.function
                                    .toString()),
                                SizedBox(height: 13),
                                Text(_nutritionfactsController.item.value.etc
                                    .toString()),
                              ],
                            ),
                            padding: EdgeInsets.only(left: 11))
                      ],
                    )),
                padding: EdgeInsets.only(bottom: 32),
              )
            ],
          )),
          Card(
              child: Column(
            children: [
              Row(children: [
                Text("성분퍼센트"),
                SvgPicture.asset("images/arrow_right.svg")
              ]),
              Text("단위 : g\(12kcal=80g\)"),
              Obx(() => _foodNutritionPercentageController.isLoading.value
                  ? CircularProgressIndicator()
                  : AspectRatio(
                      aspectRatio: 1.5,
                      child: PieChart(
                        PieChartData(
                          sectionsSpace: 0,
                          centerSpaceRadius: 0,
                          sections: showingSections(
                              _foodNutritionPercentageController.lst),
                        ),
                        swapAnimationDuration: Duration(milliseconds: 500),
                      ))),
              Obx(() => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      scrollDirection: Axis.vertical,
                      childAspectRatio: 5, //그리드뷰의 높이를 줄이기 위해 사용. why/????
                      children: showingSectionColor(
                          _foodNutritionPercentageController.lst),
                    ),
                    // Wrap(
                    //   alignment: WrapAlignment.start,
                    //   runSpacing: 8,
                    //   children: showingSectionColor(
                    //       _foodNutritionPercentageController.lst),
                    // )
                  ))
            ],
          ))
        ],
      ),
    ));
  }

  Widget getChart(int v, int maxVal, int color) {
    double rate = v / maxVal;
    return ClipRRect(
      child: LinearProgressIndicator(
        color: Color(color),
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
              Text("(${item.category})",
                  style: TextStyle(fontSize: 12, color: Color(0xFFAAAAAA))),
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

class DetailInfo extends StatelessWidget {
  const DetailInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Card(
        child: Column(
          children: <Widget>[
            Padding(
                child: mainHeader("title"),
                padding: EdgeInsets.only(top: 32, bottom: 24)),
            content(
                "바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소"),
          ],
        ),
      ),
      Card(
        child: Column(
          children: <Widget>[
            Padding(
                child: mainHeader("title"),
                padding: EdgeInsets.only(top: 32, bottom: 24)),
            subHeader("r궁합"),
            SizedBox(
              height: 8,
            ),
            content(
                "바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소"),
            SizedBox(
              height: 16,
            ),
            subHeader("r궁합"),
            SizedBox(
              height: 8,
            ),
            content(
                "바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소"),
            SizedBox(
              height: 16,
            ),
            subHeader("r궁합"),
            SizedBox(
              height: 8,
            ),
            content(
                "바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소바다의채소"),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    ]);
  }

  mainHeader(String title) {
    return Text(title,
        style: TextStyle(fontSize: 22, color: Color(0xFF111111)));
  }

  subHeader(String title) {
    return Text(title,
        style: TextStyle(fontSize: 16, color: Color(0xFF111111)));
  }

  content(String content) {
    return Text(content,
        style: TextStyle(fontSize: 14, color: Color(0xFF666666)));
  }
}
