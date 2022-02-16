import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_side_client/TabRecipe/Service/RecipeListService.dart';

import 'RecipeListItem.dart';

class Recipe02ListController extends GetxController {
  var lst = <RecipeItem>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  Future<List<RecipeItem>> fetch() async {
    try {
      List<RecipeItem> resp = await RecipeListService().getRecipeList();
      if (resp != null) {
        lst.value = resp;
      }
    } finally {
      isLoading(false);
    }
  }
}
