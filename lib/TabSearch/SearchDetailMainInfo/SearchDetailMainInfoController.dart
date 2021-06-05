import 'package:get/state_manager.dart';

import 'SearchDetailMainInfoBody.dart';
import 'SearchDetailMainInfoService.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class SearchDetailMainInfoController extends GetxController {
  var item = SearchDetailMainInfoItem().obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  final String food;
  SearchDetailMainInfoController(this.food);
  void fetch() async {
    isLoading(true);
    try {
      SearchDetailMainInfoItem products =
          await SearchIngredientService().fetch(food);
      if (products != null) {
        item.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
