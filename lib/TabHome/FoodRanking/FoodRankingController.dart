import 'package:get/state_manager.dart';
import 'package:my_side_client/TabBookmark/SearchBookmarkRepository/SearchFoodItem.dart';

import 'FoodRankingService.dart';

class FoodRankingController extends GetxController {
  var lst = <FoodItem>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      List<FoodItem> products = await FoodRankingService().fetch();
      if (products != null) {
        lst.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
