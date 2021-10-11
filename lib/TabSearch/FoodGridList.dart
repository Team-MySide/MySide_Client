import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabBookmark/SearchBookmarkRepository/SearchFoodItem.dart';
import 'package:my_side_client/TabHome/FoodRankingContainer.dart';
import 'package:my_side_client/common/CommonHeader.dart';
import 'FoodInformation.dart';
import 'SearchCategoryFoodRepository/SearchFoodController.dart';

class SearchFoodcategoryResultList extends StatelessWidget {
  SearchFoodcategoryResultList({Key key}) : super(key: key);
  SearchFoodCategoryController controller =
      Get.put(SearchFoodCategoryController(Get.arguments, 1));

  String category = Get.arguments;

  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppbar(category),
        body: Obx(() {
          if (controller.isLoading.value) {
            return CircularProgressIndicator();
          }
          return Column(
              children: [Expanded(child: CommonFoodGridList(controller.lst))]);
        }));
  }
}

class CommonFoodGridList extends StatelessWidget {
  const CommonFoodGridList(this.foodItemList, {this.isShowRanking, key})
      : super(key: key);
  final List<FoodItem> foodItemList;
  final isShowRanking;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // maxCrossAxisExtent: 240, mainAxisSpacing: 20, crossAxisSpacing: 5),

          crossAxisCount: 2,
          mainAxisExtent: 240),
      itemCount: foodItemList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext ctx, index) {
        FoodItem item = foodItemList[index];
        bool showRanking = isShowRanking ?? false;
        return GestureDetector(
          child: FoodTile(item.name, item.img, showRanking ? index : 0,
              item.likes, item.wishes, [item.cancerNm, item.nutrition1],
              isOnTabDisabled: true),
          onTap: () => Get.to(() => FoodInformation(), arguments: item.name),
        );
      },
    );
  }
}

class CommonFoodGridList2 extends StatelessWidget {
  const CommonFoodGridList2(this.foodItemList, {this.isShowRanking, key})
      : super(key: key);
  final RxList<FoodItem> foodItemList;
  final isShowRanking;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // maxCrossAxisExtent: 240, mainAxisSpacing: 20, crossAxisSpacing: 5),
          crossAxisCount: 2,
          mainAxisExtent: 240),
      itemCount: foodItemList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext ctx, index) {
        FoodItem item = foodItemList[index];
        bool showRanking = isShowRanking ?? false;
        return GestureDetector(
          child: FoodTile(item.name, item.img, showRanking ? index : 0,
              item.likes, item.wishes, [item.cancerNm, item.nutrition1],
              isOnTabDisabled: true),
          onTap: () => Get.to(() => FoodInformation(), arguments: item.name),
        );
      },
    );
  }
}
