import 'package:get/state_manager.dart';

import 'FoodRecommendationForDisease.dart';
import 'FoodRecommendationServices.dart';

class FoodRecommendationForDiseaseController extends GetxController {
  var cancer1Lst = <Cancer>[].obs;
  var cancer2Lst = <Cancer>[].obs;
  var cancer3Lst = <Cancer>[].obs;
  var cancer4Lst = <Cancer>[].obs;
  var cancer5Lst = <Cancer>[].obs;
  var cancer6Lst = <Cancer>[].obs;

  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      List<Datum> products =
          await FoodRecommendationForDiseaseService().fetch();
      if (products != null) {
        cancer1Lst = RxList(products[0].cancer1);
        cancer2Lst = RxList(products[1].cancer1);
        cancer3Lst = RxList(products[2].cancer1);
        cancer4Lst = RxList(products[3].cancer1);
        cancer5Lst = RxList(products[4].cancer1);
        cancer6Lst = RxList(products[5].cancer1);
      }
    } finally {
      isLoading(false);
    }
  }
}
