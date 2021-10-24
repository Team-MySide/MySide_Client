import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabSearch/DownloadFoodListRepository/DownloadFoodListController.dart';
import 'package:my_side_client/TabSearch/SearchIngredientRepository/SearchIngredientController.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'SearchHistory.dart';

class TabSearch extends StatefulWidget {
  const TabSearch({Key key}) : super(key: key);

  @override
  _TabSearchState createState() => _TabSearchState();
}

class _TabSearchState extends State<TabSearch> {
  TextEditingController _textEditingController = new TextEditingController();

  DownloadIngredientController downloadIngredientController =
      Get.put(DownloadIngredientController());

  DownloadFoodListController downloadFoodListController =
      Get.put(DownloadFoodListController());

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 40,
          ),
          child: Column(children: [
            SizedBox(
              height: 40,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: 174,
                  child: Text("음식, 성분, 병명을 검색하세요.",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                )),
            SizedBox(height: 24),
            SearchContainer(
              _textEditingController,
              onChanged: onSearchTextChanged,
              hintText: "사과",
            ),
            SearchButtonsContainer(),
            SizedBox(height: 21)
          ])),
      _textEditingController.text.isEmpty || _searchResult.length == 0
          ? Expanded(child: SearchHistory())
          : Expanded(
              child: ListView.separated(
                  itemCount: _searchResult.length,
                  separatorBuilder: (_, __) {
                    return SizedBox(height: 0);
                  },
                  itemBuilder: (context, i) {
                    return GestureDetector(
                        // child: Card(child: ListTile(title: Text(_searchResult[i]))),
                        child: Card(
                            child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Text(_searchResult[i]))),
                        onTap: () => Get.toNamed(
                            navigateNextMenu(_searchResult[i]),
                            arguments: _searchResult[i]));
                    // onTap: () => Get.to(page, arguments: _searchResult[i]));
                  })),
    ]));
  }

  String navigateNextMenu(String item) {
    if (downloadFoodListController.lst.contains(item)) {
      return "/FoodInformation";
    } else if (downloadIngredientController.lst.contains(item)) {
      return "/SearchIngredientCategoryResultList";
    } else {
      return "/SearchDiseaseResult";
    }
  }

  List<String> _searchResult = [];

  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    downloadFoodListController.lst.forEach((item) {
      if (item.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(item);
      }
    });

    downloadIngredientController.lst.forEach((item) {
      if (item.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(item);
      }
    });
    setState(() {});
  }
}
