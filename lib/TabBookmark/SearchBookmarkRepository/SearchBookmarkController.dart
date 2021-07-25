import 'package:get/state_manager.dart';

import 'SearchFoodItem.dart';
import 'SearchBookmarkService.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class SearchBookmarkController extends GetxController {
  var lst = <FoodItem>[].obs;
  var isLoading = true.obs;

  SearchBookmarkController();
  @override
  void onInit() {
    super.onInit();
    // fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      List<FoodItem> products = await SearchFoodCategoryService().fetch();
      if (products != null) {
        lst.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
