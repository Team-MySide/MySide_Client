import 'package:flutter/material.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/CommonHeader.dart';

class SearchDisease extends StatelessWidget {
  SearchDisease({Key key}) : super(key: key);

  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppbar("병명 검색"),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(height: 40),
                HeaderRow("질병 카테고리", isViewMore: false),
                SizedBox(height: 20),
                CategoryContainer(diseases)
              ],
            )));
  }

  final List<Map> diseases = [
    {"disease": "위암", "path": "images/svg/disease_1.svg"},
    {"disease": "간암", "path": "images/svg/disease_2.svg"},
    {"disease": "대장암", "path": "images/svg/disease_3.svg"},
    {"disease": "폐암", "path": "images/svg/disease_4.svg"},
    {"disease": "유방암", "path": "images/svg/disease_5.svg"},
    {"disease": "갑상선암", "path": "images/svg/disease_6.svg"},
  ];
}
