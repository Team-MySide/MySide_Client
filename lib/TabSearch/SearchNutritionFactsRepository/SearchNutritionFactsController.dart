import 'package:get/state_manager.dart';

import 'SearchNutritionFactsBody.dart';
import 'SearchNutritionFactsService.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class SearchNutritionFactsController extends GetxController {
  var item = SearchNutritionFactsItem().obs;
  final String food;
  var isLoading = true.obs;
  SearchNutritionFactsController(this.food);
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      SearchNutritionFactsItem products =
          await SearchIngredientService().fetch(food);
      if (products != null) {
        item.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
