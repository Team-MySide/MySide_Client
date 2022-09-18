import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabHome/FoodRankingContainer.dart';
import 'package:my_side_client/TabSearch/FoodInformation.dart';
import 'package:my_side_client/common/CommonHeader.dart';

import 'NoSearchResult.dart';
import 'SearchNutritionResultListRepository/SearchNutritionResultBody.dart';
import 'SearchNutritionResultListRepository/SearchNutritionResultListController.dart';

class SearchIngredientCategoryResultList extends StatelessWidget {
  SearchIngredientCategoryResultList({Key key}) : super(key: key);
  SearchNutritionResultListController controller =
      Get.put(SearchNutritionResultListController(Get.arguments));

  String category = Get.arguments;

  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppbar(category),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }
          return Column(
              children: [Expanded(child: CommonFoodGridList(controller.lst))]);
        }));
  }
}

class CommonFoodGridList extends StatelessWidget {
  const CommonFoodGridList(this.foodItemList, {this.isShowRanking, key})
      : super(key: key);
  final List<SearchNutritionResultItem> foodItemList;
  final isShowRanking;
  @override
  Widget build(BuildContext context) {
    return foodItemList.length != 0
        ? Container(
            decoration: BoxDecoration(color: Color(0xFFf4f4f4)),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // maxCrossAxisExtent: 240, mainAxisSpacing: 20, crossAxisSpacing: 5),
                  crossAxisCount: 2,
                  mainAxisExtent: 267),
              itemCount: foodItemList.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext ctx, index) {
                SearchNutritionResultItem item = foodItemList[index];
                bool showRanking = isShowRanking ?? false;
                return GestureDetector(
                    child: FoodTile(
                        item.name,
                        item.img,
                        showRanking ? index : 0,
                        item.likes,
                        item.wishes,
                        [item.cancerNm, item.nutrition],
                        isOnTabDisabled: true),
                    onTap: () =>
                        Get.to(() => FoodInformation(), arguments: item.name));
              },
            ),
          )
        : NoSearchResult();
  }
}
