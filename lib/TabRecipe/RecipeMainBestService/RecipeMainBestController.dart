import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'RecipeMainBestData.dart';
import 'RecipeMainBestService.dart';

class RecipeMainBestController extends GetxController {
  var lst = <RecipeMainBestItem>[].obs;
  var isLoaded = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  fetch() async {
    try {
      List<RecipeMainBestItem> resp =
          await RecipeMainBestService().getRecipeList();
      if (resp != null) {
        lst.value = resp;
      }
    } finally {
      isLoaded(true);
    }
  }
}
