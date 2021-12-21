import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabHome/SearchBar.dart';
import 'package:my_side_client/TabSearch/DownloadFoodListRepository/DownloadFoodListController.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/CommonHeader.dart';
import 'package:my_side_client/common/Data/MenuData.dart';

import 'FoodInformation.dart';
import 'SearchFood.dart';

class testtesttest extends StatefulWidget {
  testtesttest({Key key}) : super(key: key);

  @override
  _SearchFoodState createState() => _SearchFoodState();
}

class _SearchFoodState extends State<testtesttest> {
  TextEditingController _textEditingController = TextEditingController();
  DownloadFoodListController _controller =
  Get.put(DownloadFoodListController());
  List<String> _searchResult = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppbar("이준현 테스트"),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [


                Text("테스트테스트"),

              ],
            )));
  }

}
