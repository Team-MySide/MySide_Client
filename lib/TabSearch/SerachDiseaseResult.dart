import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Constants.dart';
import 'package:my_side_client/TabBookmark/SearchBookmarkRepository/SearchFoodItem.dart';
import 'package:my_side_client/TabHome/FoodRankingContainer.dart';
import 'package:my_side_client/TabSearch/SearchDiseaseRepository/SearchDiseaseController.dart';
import 'package:my_side_client/common/CommonComponent.dart';
import 'FoodInformation.dart';

class SearchDiseaseResult extends StatelessWidget {
  SearchDiseaseResult({Key key}) : super(key: key);
  String disease = Get.arguments;
  SearchDiseaseController controller =
      Get.put(SearchDiseaseController(Get.arguments));

  dynamic diseaseMap = {
    '위암': 'images/detail_cancer/detail_we_cancer.jpg',
    '간암': 'images/detail_cancer/detail_liver_cancer.jpg',
    '대장암': 'images/detail_cancer/detail_colorectal_cancer.jpg',
    '폐암': 'images/detail_cancer/detail_lung_cancer.jpg',
    '유방암': 'images/detail_cancer/detail_breast_cancer.jpg',
    '갑상선암': 'images/detail_cancer/detail_thyroid_cancer.jpg',
  };

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     // systemNavigationBarColor: Colors.blue, // navigation bar color
    //     statusBarColor: Colors.white // status bar color
    //     ));

    return Scaffold(
        appBar: CustomAppBar(
          "$disease 소개",
          Colors.white.value,
          isBack: true,
          isReference: true,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                child: FadeInImage(
                    image: AssetImage(diseaseMap[disease]),
                    placeholder: AssetImage(Constants.IMG_PLACE_HOLDER_GREY),
                    imageErrorBuilder: (context, _, __) {
                      return SizedBox(
                          width: 52, height: 44, child: ImageLoadFailedGrey());
                    })),
            Padding(
                padding:
                    EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
                child: Row()),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: HeaderRow("$disease에 좋은 랭킹별 추천 음식", isViewMore: false)),
            Obx(() {
              List<Widget> ret = [];
              List<FoodItem> lst2 = [];
              if (controller.lst.length > 4) {
                lst2.addAll(controller.lst.sublist(0, 4));
              } else {
                lst2.addAll(controller.lst);
              }

              lst2.asMap().forEach((index, e) {
                print(index.toString());
                print(e.name.toString());
                print(e.img.toString());
                return ret.add(GestureDetector(
                    child: FoodTile(e.name, e.img, 0, e.likes, e.wishes,
                        [e.cancerNm, e.nutrition1 ?? ""],
                        isOnTabDisabled: true),
                    onTap: () =>
                        Get.to(() => FoodInformation(), arguments: e.name)));
              });
              return Wrap(
                children: ret,
              );
            }),
          ],
        )));
  }
}
