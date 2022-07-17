import 'package:get/state_manager.dart';

import 'SearchDetailFoodNutritionPercentageBody.dart';
import 'SearchDetailFoodNutritionPercentageService.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class SearchDetailFoodNutritionPercentageController extends GetxController {
  var lst = <FoodNutritionPercentageItem>[].obs;
  var isLoading = true.obs;
  final String food;
  final String state;

  SearchDetailFoodNutritionPercentageController(this.food, this.state);
  @override
  void onInit() {
    super.onInit();
    // fetch();
  }

  void fetch(String st) async {
    // isLoading(true);
    try {
      List<FoodNutritionPercentageItem> products =
          await SearchDetailFoodNutritionPercentageService()
              .fetch(this.food, st);
      if (products != null) {
        lst.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
