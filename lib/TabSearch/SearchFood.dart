import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabSearch/DownloadFoodListRepository/DownloadFoodListController.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/CommonHeader.dart';
import 'package:my_side_client/common/Data/MenuData.dart';
import 'FoodInformation.dart';

class SearchFood extends StatefulWidget {
  SearchFood({Key key}) : super(key: key);

  @override
  _SearchFoodState createState() => _SearchFoodState();
}

class _SearchFoodState extends State<SearchFood> {
  TextEditingController _textEditingController = TextEditingController();
  DownloadFoodListController _controller =
      Get.put(DownloadFoodListController());
  List<String> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppbar("음식 검색"),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 40),
                SearchContainer(
                  _textEditingController,
                  onSubmitted: onSubmitted,
                  onChanged: onSearchTextChanged,
                ),
                _textEditingController.text.isEmpty || _searchResult.length == 0
                    ? Column(children: [
                        SizedBox(height: 40),
                        HeaderRow("음식 카테고리", isViewMore: false),
                        SizedBox(height: 20),
                        NavigateIconViewsContainer(
                            foodCategories, "/SearchFoodcategoryResultList")
                      ])
                    : Expanded(
                        child: AutoCompleteListView(
                        _searchResult,
                        "/FoodInformation",
                      )),
              ],
            )));
  }

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _controller.lst.forEach((item) {
      if (item.contains(text)) {
        _searchResult.add(item);
      }
    });
    setState(() {});
  }

  void onSubmitted(BuildContext context) {
    print(_textEditingController.text);
    Get.to(() => FoodInformation(), arguments: _textEditingController.text);
  }
}
