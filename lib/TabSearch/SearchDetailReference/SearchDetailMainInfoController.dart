import 'package:get/state_manager.dart';
import 'package:my_side_client/TabSearch/SearchDetailReference/SearchDetailMainInfoService.dart';
import 'package:my_side_client/TabSearch/SearchDetailReference/SearchDetailReference.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class SearchDetailReferenceController extends GetxController {
  var item = <SearchDetailReferenceItem>[].obs;
  var isLoading = true.obs;
  var isError = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  final String food;
  SearchDetailReferenceController(this.food);
  void fetch() async {
    isLoading(true);
    try {
      List<SearchDetailReferenceItem> products =
          await SearchDetailReferenceService().fetch(this.food);
      if (products != null) {
        item.value = products;
      }
    } finally {
      if (item == null) {
        isError(true);
      }
      isLoading(false);
    }
  }
}
