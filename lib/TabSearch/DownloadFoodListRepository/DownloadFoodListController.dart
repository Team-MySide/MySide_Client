import 'package:get/state_manager.dart';

import 'DownloadFoodItem.dart';
import 'DownloadFoodListService.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class DownloadFoodListController extends GetxController {
  var lst = <String>[].obs;
  var isLoading = true.obs;
  String category;
  int id;
  DownloadFoodListController();
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      List<String> products =
          await DownloadFoodListService().fetchFoodCategoryList();
      if (products != null) {
        lst.value = products;
        // lst.value = ['당근', '당당근', '당당당근', '사과', '사사과', '사사사과'];
      }
    } finally {
      isLoading(false);
    }
  }
}
