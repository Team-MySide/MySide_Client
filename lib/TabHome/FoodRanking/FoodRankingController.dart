import 'package:get/state_manager.dart';

import 'FoodRankingItem.dart';
import 'FoodRankingService.dart';

class FoodRankingController extends GetxController {
  var lst = <FoodRankingItem>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      List<FoodRankingItem> products = await FoodRankingService().fetch();
      if (products != null) {
        lst.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
