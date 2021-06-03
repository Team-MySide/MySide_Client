import 'package:get/state_manager.dart';

import 'TotalSearchBody.dart';
import 'TotalSearchService.dart';

class TotalSearchController extends GetxController {
  var lst = <String>[].obs;
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      List<String> products = await TotalSearchService().fetch();
      if (products != null) {
        lst.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}