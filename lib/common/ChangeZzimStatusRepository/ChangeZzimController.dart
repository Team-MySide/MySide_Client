import 'package:get/state_manager.dart';

import 'DownloadFoodListService.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class ChangeZzimController extends GetxController {
  var lst = false.obs;
  var isLoading = true.obs;
  String category;
  int id;
  ChangeZzimController();
  @override
  void onInit() {
    super.onInit();
  }

  void fetch(String food, int status) async {
    isLoading(true);
    try {
      bool products = await RequestZzimStatusChangeService()
          .requestChangeStatus(food, status);
      if (products != null) {
        lst(products);
      }
    } finally {
      isLoading(false);
    }
  }
}
