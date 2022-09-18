import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabHome/FoodRankingContainer.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'package:my_side_client/common/CommonHeader.dart';

import 'FoodRecommendationForDiseaseConnect/FoodRecommendationForDisease.dart';
import 'FoodRecommendationForDiseaseConnect/FoodRecommendationForDiseaseController.dart';

class ReasonForFood extends StatelessWidget {
  ReasonForFood({Key key}) : super(key: key);

  FoodRecommendationForDiseaseController controller =
      Get.put(FoodRecommendationForDiseaseController());

  @override
  Widget build(BuildContext context) {
    List<Widget> foodList = [];

    return Scaffold(
        appBar: CommonAppbar("아무음식이나 먹으면 안되는 이유"),
        body: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(child: Image.asset("images/not_try_any_food.jpg")),
            Padding(
                padding:
                    EdgeInsets.only(top: 16, bottom: 40, left: 16, right: 16),
                child: Row()),
            Padding(
                child: Text("질병별 추천 음식", style: TextStyle(fontSize: 22)),
                padding: EdgeInsets.only(top: 40, bottom: 32, left: 16)),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return CircularProgressIndicator();
                  }
                  foodList = [
                    getTiles(controller.cancer1Lst),
                    getTiles(controller.cancer2Lst),
                    getTiles(controller.cancer3Lst),
                    getTiles(controller.cancer4Lst),
                    getTiles(controller.cancer5Lst),
                    getTiles(controller.cancer6Lst)
                  ];
                  return Wrap(
                      // children: ret,
                      children: foodList);
                })),
          ],
        )));
  }

  getTiles(List<Cancer> lst) {
    if (lst.isNotEmpty) {
      return Column(children: [
        HeaderRow("${lst.first.cancerNm}", isViewMore: false),
        SizedBox(height: 13),
        Wrap(
          children: lst.map((e) {
            return FoodTile(
                e.name,
                e.img,
                0,
                e.likes,
                e.views,
                [
                  e.cancerNm,
                  e.nutrition1.trim(),
                ],
                isOnTabDisabled: true);
          }).toList(),
        )
      ]);
    }
    return Container();
  }
}
