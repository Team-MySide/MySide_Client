import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabBookmark/SearchBookmarkRepository/SearchFoodItem.dart';
import 'package:my_side_client/TabHome/FoodRankingContainer.dart';
import 'package:my_side_client/TabSearch/SearchDiseaseRepository/SearchDiseaseController.dart';
import '../TabSearch/FoodInformation.dart';

class SearchCancerResult extends StatefulWidget {
  SearchCancerResult({Key key}) : super(key: key);

  @override
  State<SearchCancerResult> createState() => _SearchCancerResultState();
}

class _SearchCancerResultState extends State<SearchCancerResult> {
  String disease = Get.arguments;

  SearchDiseaseController controller;

  @override
  void initState() {
    super.initState();

    controller = Get.put(SearchDiseaseController(Get.arguments));
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     // systemNavigationBarColor: Colors.blue, // navigation bar color
    //     statusBarColor: Colors.white // status bar color
    //     ));
    // precacheImage(AssetImage(diseaseMap[disease]), context);
    double scrHeight = MediaQuery.of(context).size.height;
    print("scrHeight $scrHeight");
    return Scaffold(
        appBar: CustomAppBar(
          "$disease에 좋은 추천 음식",
          Colors.white.value,
          textColor: Colors.black,
          isBack: true,
          isReference: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Obx(
              () => controller.isLoading.value
                  ? SizedBox()
                  : Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF4F4F4),
                      ),
                      child: FoodTileGridView(controller.lst.toList())),
            )
          ],
        )));
  }
}

class FoodTileGridView extends StatelessWidget {
  const FoodTileGridView(
    this.items, {
    Key key,
  }) : super(key: key);
  final List<FoodItem> items;
  @override
  Widget build(BuildContext context) {
    // await Future.delayed(Duration(seconds: 2));
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisExtent: 246),
      itemBuilder: (BuildContext context, int index) {
        FoodItem e = items[index];
        return GestureDetector(
            child: FoodTile(e.name, e.img, 0, e.likes, e.wishes,
                [e.cancerNm, e.nutrition1 ?? ""],
                isOnTabDisabled: true),
            onTap: () => Get.to(() => FoodInformation(), arguments: e.name));
      },
    );
  }
}
