import 'package:flutter/material.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/CommonHeader.dart';
import 'package:my_side_client/common/Data/MenuData.dart';

class SearchDisease extends StatelessWidget {
  SearchDisease({Key key}) : super(key: key);
  int pageColor = 0xFFE4F7FB;
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   // systemNavigationBarColor: Colors.blue, // navigation bar color
    //   statusBarColor: Color(pageColor), // status bar color
    // ));
    return Scaffold(
      appBar: CommonAppbar(
        "병명 검색",
        backgroundColor: Color(pageColor),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(
              "images/disease_intro.png",
              fit: BoxFit.cover,
            ),
          ),
          Padding(
              child: Column(children: [
                HeaderRow("질병 카테고리", isViewMore: false),
                SizedBox(height: 20),
                NavigateIconViewsContainer(diseases, "/SearchDiseaseResult")
              ]),
              padding: EdgeInsets.only(top: 40, left: 16, right: 16))
        ],
      ),
    );
  }
}
