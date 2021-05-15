import 'package:flutter/material.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/CommonHeader.dart';

class SearchFood extends StatelessWidget {
  SearchFood({Key key}) : super(key: key);
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppbar("성분 검색"),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 40),
                SearchContainer(_textEditingController),
                SizedBox(height: 40),
                HeaderRow("음식 카테고리", isViewMore: false),
                CategoryContainer(diseases)
              ],
            )));
  }

  final List<Map> diseases = [
    {"disease": "곡류", "path": "images/svg/disease_1.svg"},
    {"disease": "채소류", "path": "images/svg/disease_2.svg"},
    {"disease": "과일류", "path": "images/svg/disease_3.svg"},
    {"disease": "육류", "path": "images/svg/disease_4.svg"},
    {"disease": "해산물", "path": "images/svg/disease_5.svg"},
    {"disease": "차류", "path": "images/svg/disease_6.svg"},
    {"disease": "유제품", "path": "images/svg/disease_4.svg"},
    {"disease": "유동식", "path": "images/svg/disease_5.svg"},
    {"disease": "기타", "path": "images/svg/disease_6.svg"},
  ];
}
