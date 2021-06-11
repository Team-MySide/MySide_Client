import 'package:get/state_manager.dart';

import 'SearchPopularKeywordBody.dart';
import 'SearchPopularKeywordService.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class SearchPopularKeywordController extends GetxController {
  var lst = <String>[].obs;
  var isLoading = true.obs;
  String category;
  int id;
  SearchPopularKeywordController();
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      List<String> products = await SearchPopuylarKeywordService().fetch();
      if (products != null) {
        // lst.value = products;
        lst.value = products;
      }
    } finally {
      // isLoading(false);
    }
  }
}
