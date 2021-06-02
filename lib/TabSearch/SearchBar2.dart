import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_side_client/TabHome/SearchBar.dart';
import 'package:my_side_client/TabSearch/SearchFood.dart';
import 'package:my_side_client/TabSearch/SearchIngredient.dart';
import 'package:my_side_client/common/CommonComponent.dart';

import '../Constants.dart';
import 'SearchDisease.dart';

// ignore: must_be_immutable
class SearchBar2 extends StatelessWidget {
  TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
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
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                  )),
              SizedBox(height: 24),
              // SearchContainer(_textEditingController),
              SearchButtonsContainer(),
              SizedBox(height: 21)
            ])));
  }

  ButtonStyle _buttonRoundShape(int backgroundColor) {
    return ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Color(backgroundColor)),
        foregroundColor: MaterialStateProperty.all(Color(0xFF666666)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.tagButtonRadius),
        )));
  }

  _callNotification() {}
}
