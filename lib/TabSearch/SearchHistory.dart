import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabHome/CommonViews.dart';
import 'package:my_side_client/TabSearch/FoodInformation.dart';
import 'package:my_side_client/TabSearch/SearchPopularKeywordRepository/SearchPopularKeywordController.dart';
import 'package:my_side_client/common/CommonComponent.dart';

class SearchHistory extends StatelessWidget {
  SearchHistory({Key key}) : super(key: key);
  SearchPopularKeywordController _controller =
      Get.put(SearchPopularKeywordController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
          padding: EdgeInsets.only(top: 40, left: 16, right: 11),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Text("인기 검색",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFF666666),
                            fontWeight: FontWeight.w500)),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ),
              SizedBox(height: 19),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Obx(() => _controller.isLoading.value
                      ? Wrap(
                          spacing: 8,
                          children: getLoadingContainers(),
                          runSpacing: 8,
                        )
                      : Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: getSearchTags(_controller.lst))),
                ),
              ),
              // ListView.builder(
              //     itemBuilder: (BuildContext context, int index) {
              //       return Text(temp[index]["item"ㅇ]);
              //     },
              //     itemCount: temp.length),
            ],
          )),
      decoration: BoxDecoration(color: Color(0xFFF4F4F4)),
    );
  }
}

List<Widget> getLoadingContainers() {
  List<Widget> ret = [
    ShimmerLoadingContainer(
      66,
      34,
      isRound: true,
    ),
    ShimmerLoadingContainer(66, 34, isRound: true),
    ShimmerLoadingContainer(66, 34, isRound: true)
  ];
  return ret;
}

List<Widget> getSearchTags(RxList<String> lst) {
  List<Widget> ret = [];
  ret.addAll(lst
      .map((e) => GestureDetector(
          child: ColorTag("#$e", 0xFF666666, Colors.white.value),
          onTap: () => Get.to(() => FoodInformation(), arguments: e)))
      .toList());
  return ret;
}

List<dynamic> temp = [
  {"item": "포도"},
  {"item": "비타민c"},
  {"item": "바나나"},
  {"item": "노니"},
  {"item": "해바라기씨"},
];

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [Text("최근 검색 ")],
    );
  }
}
