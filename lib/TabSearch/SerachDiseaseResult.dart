import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabBookmark/SearchBookmarkRepository/SearchFoodItem.dart';
import 'package:my_side_client/TabHome/FoodRankingContainer.dart';
import 'package:my_side_client/TabSearch/SearchDiseaseRepository/SearchDiseaseController.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'FoodInformation.dart';

class SearchDiseaseResult extends StatefulWidget {
  SearchDiseaseResult({Key key}) : super(key: key);

  @override
  State<SearchDiseaseResult> createState() => _SearchDiseaseResultState();
}

class _SearchDiseaseResultState extends State<SearchDiseaseResult> {
  String disease = Get.arguments;

  SearchDiseaseController controller;

  dynamic diseaseMap = {
    '위암': 'images/detail_cancer/detail_we_cancer.jpg',
    '간암': 'images/detail_cancer/detail_liver_cancer.jpg',
    '대장암': 'images/detail_cancer/detail_colorectal_cancer.jpg',
    '폐암': 'images/detail_cancer/detail_lung_cancer.jpg',
    '유방암': 'images/detail_cancer/detail_breast_cancer.jpg',
    '갑상선암': 'images/detail_cancer/detail_thyroid_cancer.jpg',
  };
  dynamic diseaseBackgroundColor = {
    '위암': 0xFFFFD15A,
    '간암': 0xFFC0A7CF,
    '대장암': 0xFFC9D86D,
    '폐암': 0xFFAAC0FA,
    '유방암': 0xFFFFB6B6,
    '갑상선암': 0xFF90D5EB,
  };

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

    return Scaffold(
        backgroundColor: Color(diseaseBackgroundColor[disease]),
        appBar: CustomAppBar(
          "$disease 소개",
          Colors.white.value,
          isBack: true,
          isReference: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            ConstrainedBox(
                constraints: BoxConstraints(minHeight: scrHeight),
                child: Container(
                  // color: Color(diseaseBackgroundColor[disease]),
                  child: Image(image: AssetImage(diseaseMap[disease])),
                )),

            // Container(
            //     child: FadeInImage(
            //         image: AssetImage(diseaseMap[disease]),
            //         placeholder: AssetImage(diseaseMap[disease]),
            //         imageErrorBuilder: (context, _, __) {
            //           return SizedBox(
            //               width: 52, height: 44, child: ImageLoadFailedGrey());
            //         })),
            SizedBox(
              height: 16,
            ),
            Obx(() => controller.isLoading.value
                ? SizedBox()
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: HeaderRow("$disease에 좋은 랭킹별 추천 음식",
                        isViewMore: false))),
            Obx(
              () => controller.isLoading.value
                  ? SizedBox()
                  : FoodTileGridView(controller.lst.sublist(0, 4).toList()),
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
