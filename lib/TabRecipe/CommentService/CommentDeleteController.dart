import 'package:get/state_manager.dart';
import 'package:my_side_client/TabBookmark/SearchBookmarkRepository/SearchFoodItem.dart';
import 'package:my_side_client/TabRecipe/CommentService/Comment.dart';
import 'package:my_side_client/TabRecipe/CommentService/CommentDeleteService.dart';

class CommentDeleteController extends GetxController {
  var lst = "".obs;
  var isLoading = true.obs;
  int index;
  CommentDeleteController(this.index);
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      String products = await CommentDeleteService().fetch(index);
      if (products != null) {
        lst.value = products;
      }
    } finally {
      isLoading(false);
    }
  }
}
