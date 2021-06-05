import 'package:get/state_manager.dart';

import 'SearchDetailNutritionFactsBody.dart';
import 'SearchDetailNutritionFactsService.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class SearchDetailNutritionFactsController extends GetxController {
  var item = SearchDetailNutritionFactsItem().obs;
  final String food;
  var isLoading = true.obs;
  SearchDetailNutritionFactsController(this.food);
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      SearchDetailNutritionFactsItem products =
          await SearchDetailNutritionService().fetch(food);
      if (products != null) {
        item.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
