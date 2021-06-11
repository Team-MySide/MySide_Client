import 'package:get/state_manager.dart';
import 'package:my_side_client/TabSearch/SearchDetailMainInfo/SearchDetailMainInfoController.dart';

import 'ChangeBookmarkStatusService.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class ChangeBookmarkStatusController extends GetxController {
  var isSuccess = false.obs;
  var isLoading = false.obs;
  String category;
  int id;

  ChangeBookmarkStatusController();
  @override
  void onInit() {
    super.onInit();
  }

  Future<bool> putBookmark(String food, int status) async {
    isLoading(true);
    try {
      bool products = await ChangeBookmarkStatusService()
          .requestBookmarkChangeStatus(food, status);
      if (products != null) {
        if (products) {
          isSuccess(products);
          return true;
        }
      }
      return false;
    } finally {
      isLoading(false);
    }
  }

  Future<bool> putLike(String food, int status) async {
    isLoading(true);
    try {
      bool products = await ChangeBookmarkStatusService()
          .requestLikeChangeStatus(food, status);
      if (products != null) {
        if (products) {
          isSuccess(products);
          return true;
        }
      }
      return false;
    } finally {
      isLoading(false);
    }
  }
}
