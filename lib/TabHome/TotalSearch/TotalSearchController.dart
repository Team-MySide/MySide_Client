import 'package:get/state_manager.dart';

import 'TotalSearchBody.dart';
import 'TotalSearchService.dart';

class DownloadTotalSearchListController extends GetxController {
  var cancerLst = <String>[].obs;
  var foodLst = <String>[].obs;
  var nutritionLst = <String>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      TotalSearchBody products = await DownloadTotalSearchListService().fetch();
      if (products != null) {
        cancerLst.value = products.data.cancer;
        foodLst.value = products.data.food;
        nutritionLst.value = products.data.nutrition;
      }
    } finally {
      isLoading(false);
    }
  }
}
