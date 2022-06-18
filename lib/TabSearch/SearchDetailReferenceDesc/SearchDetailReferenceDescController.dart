import 'package:get/state_manager.dart';

import 'SearchDetailReferenceDescService.dart';
import 'SearchDetailReferenceDesc.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class SearchDetailReferenceDescController extends GetxController {
  var list = <SearchDetailReferenceDescItem>[].obs;
  var isLoading = true.obs;
  var isError = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  final String food;
  final String cancerNm;
  final String code;

  SearchDetailReferenceDescController(this.cancerNm, this.food, this.code);
  void fetch() async {
    isLoading(true);
    try {
      List<SearchDetailReferenceDescItem> products =
          await SearchDetailReferenceDescService().fetch(cancerNm, food, code);
      if (products != null) {
        list.value = products;
      }
    } finally {
      if (list.value == null) {
        isError(true);
      }
      isLoading(false);
    }
  }
}
