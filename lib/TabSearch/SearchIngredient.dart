import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabSearch/NoSearchResult.dart';
import 'package:my_side_client/TabSearch/SearchIngredientRepository/SearchIngredientController.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/CommonHeader.dart';

import 'IngredientGridList.dart';
import 'SearchIngredientRecommendRepository/SearchIngredientRecommendController.dart';

class SearchIngredient extends StatefulWidget {
  SearchIngredient({Key key}) : super(key: key);

  @override
  _SearchIngredientState createState() => _SearchIngredientState();
}

class _SearchIngredientState extends State<SearchIngredient> {
  DownloadIngredientController controller =
      Get.put(DownloadIngredientController());
  SearchIngredientRecommendController _recommendController =
      Get.put(SearchIngredientRecommendController());
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppbar("성분 검색"),
        body: Obx(() {
          if (controller.isLoading.value) {
            return CircularProgressIndicator();
          } else {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  HeaderRow("하나의 성분을 입력해주세요", isViewMore: false),
                  SizedBox(
                    height: 20,
                  ),
                  SearchContainer(
                    _textEditingController,
                    onChanged: onSearchTextChanged,
                    hintText: "비타민c",
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  _textEditingController.text.isEmpty
                      ? Container(
                          child: Column(
                          children: [
                            Align(
                                child: Text("추천 검색어",
                                    style: TextStyle(color: Color(0xFF666666))),
                                alignment: Alignment.centerLeft),
                            SizedBox(height: 16),
                            Obx(() => _recommendController.isLoading.value
                                ? Row(
                                    children: [
                                      ShimmerLoadingContainer(44, 34),
                                      ShimmerLoadingContainer(44, 34),
                                      ShimmerLoadingContainer(44, 34)
                                    ],
                                    // spacing: 4,
                                    // alignment: WrapAlignment.start,
                                  )
                                : getTags(_recommendController.lst)),
                            Container()
                          ],
                        ))
                      : Expanded(
                          child: _textEditingController.text.isNotEmpty &&
                                  _searchResult.length == 0
                              ? NoSearchResult()
                              : AutoCompleteListView(
                                  _searchResult,
                                  "/SearchIngredientCategoryResultList",
                                )

                          // child: ListView.separated(
                          //     itemCount: _searchResult.length,
                          //     separatorBuilder: (_, __) {
                          //       return SizedBox(height: 0);
                          //     },
                          //     itemBuilder: (context, i) {
                          //       return GestureDetector(
                          //           child: Card(
                          //               child: ListTile(
                          //                   title: Text(_searchResult[i]))),
                          //           onTap: () => Get.to(
                          //               SearchIngredientCategoryResultList(),
                          //               arguments: _searchResult[i]));
                          //     })),
                          )
                ],
              ),
            );
          }
        }));
  }

  List<String> _searchResult = [];
  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    controller.lst.forEach((item) {
      if (item.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(item);
      }
    });
    setState(() {});
  }

  getTags(List<String> tags) {
    List<Widget> ret = tags
        .map(
          (e) =>
              // GestureDetector(
              //     child:
              InputChip(
            label: Text("#$e",
                style: TextStyle(
                    color: Color(0xFFFF9635),
                    fontSize: 14,
                    fontWeight: FontWeight.w300)),
            // selected: true,
            padding: EdgeInsets.all(0),
            backgroundColor: Color(0xFFFFF6D6),
            onPressed: () {
              Get.to(() => SearchIngredientCategoryResultList(), arguments: e);
            },
            // selectedColor: Color(0xFFFFF6D6),
            // onSelected: (value) {
            //   print(value);
            // }
          ),
          // onTap: () {
          //   print(e);

          // }),
        )
        .toList();
    return Wrap(
      children: ret,
      spacing: 4,
      // runSpacing: 8,
    );
  }
}
