import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:my_side_client/TabRecipe/RecipeMain.dart';
import 'package:my_side_client/TabRecipe/RecipeMainBestService/RecipeMainBestData.dart';
import 'package:my_side_client/TabRecipe/Service/RecipeListService.dart';

import 'RecipeListDiseaseType.dart';
import 'RecipeListItem.dart';

class Recipe02ListController extends GetxController {
  var lst = <RecipeItem>[].obs;
  var isLoading = true.obs;
  final Category subject;
  final String target;
  String order = "1";

  Recipe02ListController(
    this.subject,
    this.target,
  );
  @override
  void onInit() {
    super.onInit();
    switch (subject) {
      case Category.disease:
        fetchDiseaseList();
        break;
      case Category.food:
        fetchFoodList();
        break;
      case Category.recommend:
        fetchRecommendList();
        break;
      case Category.best:
        fetchMonthAllRankList();
        break;
    }
  }

  void fetchDiseaseList() async {
    try {
      List<RecipeListDiseaseItem> resp =
          await RecipeListService().getDiseaseRecipeList(target, order);
      if (resp != null) {
        List<RecipeItem> ret = resp
            .map((item) => RecipeItem(
                receipeId: item.receipeId,
                receipeName: item.receipeName,
                receipeImg: item.receipeImg,
                receipeDifficulty: item.receipeDifficulty,
                receipeTime: item.receipeTime,
                receipeUserId: item.receipeUserId,
                userName: item.userName,
                userCancerNm: item.userCancerNm,
                userStageNm: item.userStageNm,
                userProgressNm: item.userProgressNm))
            .toList();
        lst.value = ret;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchFoodList() async {
    try {
      //'최신순', '좋아요순', '별점순', '난이도순'
      List<RecipeItem> resp =
          await RecipeListService().getFoodRecipeList(target, order);
      if (resp != null) {
        lst.value = resp;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchRecommendList() async {
    try {
      List<RecipeItem> resp = await RecipeListService().getRecommendList();
      if (resp != null) {
        lst.value = resp;
      }
    } finally {
      isLoading(false);
    }
  }

  void fetchMonthAllRankList() async {
    try {
      List<RecipeMainBestItem> resp =
          await RecipeListService().getAllRankList();
      if (resp != null) {
        List<RecipeItem> ret = resp
            .map((item) => RecipeItem(
                receipeId: item.receipeId.toString(),
                receipeName: item.receipeName,
                receipeImg: item.receipeImg,
                receipeDifficulty: item.receipeDifficulty,
                receipeTime: item.receipeTime,
                receipeUserId: item.userId,
                userName: item.userId,
                userCancerNm: "",
                userStageNm: "",
                userProgressNm: ""))
            .toList();
        lst.value = ret;
      }
    } finally {
      isLoading(false);
    }
  }
}
