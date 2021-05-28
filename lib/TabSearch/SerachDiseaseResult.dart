import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabHome/FoodRanking/FoodRankingItem.dart';
import 'package:my_side_client/TabHome/FoodRankingContainer.dart';
import 'package:my_side_client/TabSearch/FoodGridList.dart';
import 'package:my_side_client/TabSearch/SearchDiseaseRepository/SearchDiseaseController.dart';
import 'package:my_side_client/common/CommonHeader.dart';

import 'SearchCategoryFoodRepository/SearchFoodItem.dart';

class SearchDiseaseResult extends StatelessWidget {
  SearchDiseaseResult({Key key}) : super(key: key);
  String disease = Get.arguments[0];
  SearchDiseaseController controller =
      Get.put(SearchDiseaseController(Get.arguments[0]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppbar("$disease 소개"),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 400,
            ),
            Padding(
                padding:
                    EdgeInsets.only(top: 16, bottom: 40, left: 16, right: 16),
                child: Row()),
            Text("$disease에 좋은 랭킹별 추천 음식"),
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
            Obx(() {
              List<FoodTile> ret = [];
              List<FoodItem> lst2 = [];
              if (controller.lst.length > 4) {
                lst2.addAll(controller.lst.sublist(0, 4));
              }

              lst2.asMap().forEach((index, e) {
                print(index.toString());
                print(e.name.toString());
                print(e.img.toString());
                return ret.add(FoodTile(
                    // e.name, e.img, index, e.likes, e.wishes, e['tags'])));
                    e.name,
                    e.img,
                    index,
                    e.likes,
                    e.wishes,
                    [e.cancerNm, e.nutrition1 ?? ""]));
              });
              return Wrap(
                children: ret,
              );
            }),
          ],
        )));
  }
}

class RecommendContainer extends StatelessWidget {
  RecommendContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String disease = Get.arguments[0];
    return Column(
      children: [],
    );
  }
}
