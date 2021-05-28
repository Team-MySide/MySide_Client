import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabSearch/SerachDiseaseResult.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/CommonHeader.dart';

class SearchDisease extends StatelessWidget {
  SearchDisease({Key key}) : super(key: key);

  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppbar(
          "병명 검색",
          backgroundColor: Color(0xFFE4F7FB),
        ),
        body: Column(
          children: [
            Container(
              height: 280,
              decoration: BoxDecoration(color: Color(0xFFE4F7FB)),
            ),
            Padding(
                child: Column(children: [
                  HeaderRow("질병 카테고리", isViewMore: false),
                  SizedBox(height: 20),
                  DiseaseCategoryContainer(diseases)
                ]),
                padding: EdgeInsets.only(top: 40, left: 16, right: 16))
          ],
        ));
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

class DiseaseCategoryContainer extends StatelessWidget {
  final diseases;
  DiseaseCategoryContainer(this.diseases, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.horizontal,
      crossAxisAlignment: WrapCrossAlignment.start,
      alignment: WrapAlignment.start,
      spacing: 7.5,
      runSpacing: 7.5,
      children: _getCategories(diseases),
    );
  }
}

_getCategories(var diseases) {
  List<Widget> ret = [];
  for (var d in diseases) {
    ret.add(GestureDetector(
        child: Container(
            width: 104,
            height: 95,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFDDDDDD)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                SizedBox(height: 18),
                SizedBox(
                    width: 32, height: 32, child: SvgPicture.asset(d['path'])),
                SizedBox(height: 9.87),
                Text(d['disease'])
              ],
            )),
        onTap: () =>
            Get.to(() => SearchDiseaseResult(), arguments: [d['disease']])));
  }
  return ret;
}
