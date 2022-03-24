import 'package:get/state_manager.dart';
import 'package:my_side_client/TabBookmark/SearchBookmarkRepository/SearchFoodItem.dart';
import 'package:my_side_client/TabRecipe/CommentService/Comment.dart';
import 'package:my_side_client/TabRecipe/CommentService/CommentService.dart';




//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class CommentController extends GetxController {
  var lst = <Comment>[].obs;
  var isLoading = true.obs;
  var isError = false.obs;
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      List<Comment> products = await Commentservice().fetch();
      if (products != null) {
        lst = products;
        print("okokokokokokokokokoko");
      }
    } finally {
      if (lst = null) {
        isError(true);
      }
      isLoading(false);
    }
  }
}
