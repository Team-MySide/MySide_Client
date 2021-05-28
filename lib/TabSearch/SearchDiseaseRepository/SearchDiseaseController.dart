import 'package:get/state_manager.dart';
import 'package:my_side_client/TabSearch/SearchCategoryFoodRepository/SearchFoodItem.dart';

import 'SearchDiseaseService.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class SearchDiseaseController extends GetxController {
  var lst = <FoodItem>[].obs;
  var isLoading = true.obs;
  final String cancer;
  SearchDiseaseController(this.cancer);
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      List<FoodItem> products = await SearchDiseaseService().fetch(cancer);
      if (products != null) {
        lst.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
