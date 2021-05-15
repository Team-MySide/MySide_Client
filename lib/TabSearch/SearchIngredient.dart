import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/CommonHeader.dart';

class SearchIngredient extends StatelessWidget {
  SearchIngredient({Key key}) : super(key: key);
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppbar("성분 검색"),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              HeaderRow("하나의 성분을 입력해주세요", isViewMore: false),
              SizedBox(
                height: 20,
              ),
              SearchContainer(_textEditingController),
              SizedBox(
                height: 24,
              ),
              Text("추천 검색어"),
              SizedBox(height: 16),
              getTags(),
              Container()
            ],
          ),
        ));
  }

  List<String> tags = ['비타민', '폴로보노이드', '베타카로틴', '셀레늄'];
  getTags() {
    List<Widget> ret = tags
        .map((e) => ChoiceChip(
              label: Text("#$e",
                  style: TextStyle(color: Color(0xFFFF9635), fontSize: 14)),
              selected: true,
              selectedColor: Color(0xFFFFF6D6),
            ))
        .toList();
    return Wrap(
      children: ret,
    );
  }
}
