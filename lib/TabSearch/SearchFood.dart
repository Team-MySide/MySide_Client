import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/CommonHeader.dart';

import 'FoodGridList.dart';
import 'FoodInformation.dart';

class SearchFood extends StatelessWidget {
  SearchFood({Key key}) : super(key: key);
  TextEditingController _textEditingController = TextEditingController();

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
                ),
                SizedBox(height: 40),
                HeaderRow("음식 카테고리", isViewMore: false),
                FoodCategoryContainer(diseases)
              ],
            )));
  }

  //어떻게 submit 동작을 외부에서 넘겨? get.to는 불가능한가?
  void onSubmitted(BuildContext context) {
    print(_textEditingController.text);
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) =>
    //             FoodInformation(_textEditingController.text)));
    // return () => Get.to(FoodDetailInfoContainer(_textEditingController.text));
    Get.to(FoodInformation(_textEditingController.text),
        arguments: [_textEditingController.text]);
  }

  final List<Map> diseases = [
    {"disease": "곡류", "path": "images/svg/gogryu.svg"},
    {"disease": "채소류", "path": "images/svg/chaesoryu.svg"},
    {"disease": "과일류", "path": "images/svg/gwailryu.svg"},
    {"disease": "육류", "path": "images/svg/yookryu.svg"},
    {"disease": "해산물", "path": "images/svg/seafood.svg"},
    {"disease": "차류", "path": "images/svg/tea.svg"},
    {"disease": "유제품", "path": "images/svg/milk.svg"},
    {"disease": "유동식", "path": "images/svg/yoodongsik.svg"},
    {"disease": "기타", "path": "images/svg/etc.svg"},
  ];
}

class FoodCategoryContainer extends StatelessWidget {
  final diseases;

  FoodCategoryContainer(this.diseases, {Key key}) : super(key: key);

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
        onTap: () => Get.to(() => SearchFoodcategoryResultList(),
            arguments: [d['disease']]),
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
            ))));
  }
  return ret;
}
