import 'package:get/state_manager.dart';

import 'SearchNutritionResultBody.dart';
import 'SearchNutritionResultListService.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class SearchNutritionResultListController extends GetxController {
  var lst = <SearchNutritionResultItem>[].obs;
  var isLoading = true.obs;
  final String keyword;
  SearchNutritionResultListController(this.keyword);
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      List<SearchNutritionResultItem> products =
          await SearchNutritionResultListService().fetch(keyword);
      if (products != null) {
        lst.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
