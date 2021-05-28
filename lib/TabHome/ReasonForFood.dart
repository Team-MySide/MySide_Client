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
    return Scaffold(
        appBar: CommonAppbar("아무음식이나 먹으면 안되는 이유"),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 200,
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: 16, bottom: 40, left: 16, right: 16),
                child: Row()),

            // Obx(() {
            //   print(controller.isLoading.value);
            //   print(controller.lst.length);
            //   if (controller.isLoading.value) {
            //     return Center(child: CircularProgressIndicator());
            //   } else {
            //     List<FoodItem> foodLst = [];
            //     if (controller.lst.length > 3) {
            //       foodLst.addAll(controller.lst.sublist(0, 4));
            //     } else {
            //       foodLst.addAll(controller.lst);
            //     }
            //     return CommonFoodGridList(
            //       foodLst,
            //       isShowRanking: true,
            //     );
            //   }
            // })
            Padding(
                child: Text("질병별 추천 음식", style: TextStyle(fontSize: 22)),
                padding: EdgeInsets.only(top: 40, bottom: 32)),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return CircularProgressIndicator();
                  }
                  List<Widget> ret = [
                    getTiles(controller.cancer1Lst),
                    getTiles(controller.cancer2Lst),
                    getTiles(controller.cancer3Lst),
                    getTiles(controller.cancer4Lst),
                    getTiles(controller.cancer5Lst),
                    getTiles(controller.cancer6Lst),
                  ];

                  return Wrap(
                      // children: ret,
                      children: ret);
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
                // e.name, e.img, index, e.likes, e.wishes, e['tags'])));
                e.name,
                e.img,
                -1,
                e.likes,
                e.wishes,
                [e.cancerNm, e.nutrition1.trim()]);
          }).toList(),
        )
      ]);
    }
    return Container();
  }
}
