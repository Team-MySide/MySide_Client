import 'dart:math';

import 'package:dropdown_search/dropdown_search.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabSearch/SearchIngredientRepository/SearchIngredientController.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/CommonHeader.dart';

import 'FoodInformation.dart';

class SearchIngredient extends StatefulWidget {
  SearchIngredient({Key key}) : super(key: key);

  @override
  _SearchIngredientState createState() => _SearchIngredientState();
}

class _SearchIngredientState extends State<SearchIngredient> {
  SearchIngredientController controller = Get.put(SearchIngredientController());

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppbar("성분 검색"),
        body: Obx(() {
          if (controller.isLoading.value) {
            return CircularProgressIndicator();
          } else {
            return Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  HeaderRow("하나의 성분을 입력해주세요", isViewMore: false),
                  SizedBox(
                    height: 20,
                  ),
                  SearchContainer(_textEditingController,
                      onChanged: onSearchTextChanged),
                  SizedBox(
                    height: 24,
                  ),
                  _textEditingController.text.isEmpty
                      ? Container(
                          child: Column(
                          children: [
                            Text("추천 검색어"),
                            SizedBox(height: 16),
                            getTags(),
                            Container()
                          ],
                        ))
                      : Expanded(
                          child: ListView.separated(
                              itemCount: _searchResult.length,
                              separatorBuilder: (_, __) {
                                return SizedBox(height: 3);
                              },
                              itemBuilder: (context, i) {
                                return GestureDetector(
                                  child: Card(
                                      child: ListTile(
                                          title: Text(_searchResult[i]))),
                                  // onTap: () => Get.to()
                                );
                              })),
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
      if (item.contains(text)) {
        _searchResult.add(item);
      }
    });
    setState(() {});
  }

  List<String> tags = ['비타민', '폴로보노이드', '베타카로틴', '셀레늄'];

  getTags() {
    List<Widget> ret = tags
        .map((e) => ChoiceChip(
              label: Text("#$e",
                  style: TextStyle(
                      color: Color(0xFFFF9635),
                      fontSize: 14,
                      fontWeight: FontWeight.w300)),
              selected: true,
              selectedColor: Color(0xFFFFF6D6),
            ))
        .toList();
    return Wrap(
      children: ret,
    );
  }
}
