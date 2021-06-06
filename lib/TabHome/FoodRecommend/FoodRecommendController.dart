import 'package:get/state_manager.dart';

import 'FoodRecommendation.dart';
import 'FoodRecommendServices.dart';

class FoodRecommendController extends GetxController {
  var lst = <FoodRecommendItem>[].obs;

  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      List<FoodRecommendItem> products =
          await FoodRecommendationService().fetch();
      if (products != null) {
        lst = RxList(products);
      }
    } finally {
      if (lst != null) {
        isLoading(false);
      }
    }
  }
}
