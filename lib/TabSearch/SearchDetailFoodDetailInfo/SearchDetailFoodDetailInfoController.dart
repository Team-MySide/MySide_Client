import 'package:get/state_manager.dart';

import 'SearchDetailFoodDetailnfoBody.dart';
import 'SearchDetailFoodDetailInfoService.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class SearchDetailFoodDetailController extends GetxController {
  var item = SearchDetailFoodDetailItem().obs;
  var isLoading = true.obs;
  final String food;
  SearchDetailFoodDetailController(this.food);
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      SearchDetailFoodDetailItem products =
          await SearchDetailService().fetch(food);
      if (products != null) {
        item.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
