import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'RecipeMainRecommendRecipeData.dart';
import 'RecipeMainService.dart';

class RecipeMainRecommendRecipeController extends GetxController {
  var lst = <RecipeMainRecommendItem>[].obs;
  var isLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  fetch() async {
    try {
      List<RecipeMainRecommendItem> resp =
          await RecipeMainRecommendRecipeService().getRecipeList();
      if (resp != null) {
        lst.value = resp;
      }
    } finally {
      isLoaded(true);
    }
  }
}
