import 'package:get/state_manager.dart';

import 'SearchDetailFoodStateService.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class SearchDetailFoodStateController extends GetxController {
  var lst = <String>[].obs;
  var isLoading = true.obs;
  final String food;
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  SearchDetailFoodStateController(this.food);
  void fetch() async {
    isLoading(true);
    try {
      List<String> products = await SearchDetailFoodStateService().fetch(food);
      if (products != null) {
        lst.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
