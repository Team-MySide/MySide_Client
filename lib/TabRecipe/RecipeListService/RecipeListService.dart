import 'package:my_side_client/TabRecipe/RecipeMainBestService/RecipeMainBestModel.dart';
import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

import 'RecipeListData.dart';
import 'RecipeListDiseaseModel.dart';

abstract class IFetch {
  void getDiseaseRecipeList(String target, String tabIdx);
  void getFoodRecipeList(String target, String tabIdx);
  void getRecommendList();
  void getAllRankList();
}

//wiki link
class RecipeListService extends MySideConnect implements IFetch {
  @override
  Future<List<RecipeListDiseaseItem>> getDiseaseRecipeList(
      String target, String tabIdx) async {
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.TEMP_TOKEN;
      return request;
    });

    var resp = await get(
        "/recipe/search/disease/$target/$tabIdx"); //receipe/search/kinds/:foodtype/:tabIdx
    print("/recipe/search/disease/$target/$tabIdx");
    if (resp.statusCode == 200) {
      List<RecipeListDiseaseItem> item =
          recipeListDiseaseTypeFromJson(resp.bodyString).data;
      return item; //pass
    }
    return []; //fail
  }

  @override
  Future<List<RecipeItem>> getFoodRecipeList(
      String target, String tabIdx) async {
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.TEMP_TOKEN;
      return request;
    });

    var resp = await get(
        "/recipe/search/foodtype/$target/$tabIdx"); //receipe/search/kinds/:foodtype/:tabIdx
    print("/recipe/search/foodtype/$target/$tabIdx");
    if (resp.statusCode == 200) {
      RecipeItemData item = recipeListItemFromJson(resp.bodyString);
      return item.data; //pass
    }
    return []; //fail
  }

  @override
  Future<List<RecipeItem>> getRecommendList() async {
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.TEMP_TOKEN;
      return request;
    });

    var resp = await get(
        "/recipe/recommendation"); //receipe/search/kinds/:foodtype/:tabIdx
    print("/recipe/recommendation");
    if (resp.statusCode == 200) {
      RecipeItemData item = recipeListItemFromJson(resp.bodyString);
      return item.data; //pass
    }
    return []; //fail
  }

  @override
  Future<List<RecipeMainBestItem>> getAllRankList() async {
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.TEMP_TOKEN;
      return request;
    });

    var resp =
        await get("/recipe/month/all"); //receipe/search/kinds/:foodtype/:tabIdx
    print("/recipe/month/all");
    if (resp.statusCode == 200) {
      return recipeMainBestDataFromJson(resp.bodyString).data;
    }
    return []; //fail
  }
  // String sample = jsonEncode({
  //   "status": 200,
  //   "success": true,
  //   "message": "음식 검색 조회 성공",
  //   "data": [
  //     {
  //       "receipe_foodtype": "양식",
  //       "receipe_id": 30,
  //       "receipe_name": "보현이의 레시피",
  //       "receipe_img":
  //           "https://mysidebucket.s3.ap-northeast-2.amazonaws.com/1644906189541.png",
  //       "receipe_difficulty": 1,
  //       "receipe_time": 10,
  //       "user_id": 10,
  //       "name": "이웃집닥터",
  //       "cancerNm": "유방암",
  //       "stageNm": "1기",
  //       "progressNm": "방사선"
  //     },
  //     {
  //       "receipe_foodtype": "양식",
  //       "receipe_id": 39,
  //       "receipe_name": "만들기 쉬운 시금치 파스타!",
  //       "receipe_img":
  //           "https://mysidebucket.s3.ap-northeast-2.amazonaws.com/1644911032988.png",
  //       "receipe_difficulty": 1,
  //       "receipe_time": 10,
  //       "user_id": 28,
  //       "name": "테스트",
  //       "cancerNm": "위암",
  //       "stageNm": "수술",
  //       "progressNm": "항암중"
  //     }
  //   ]
  // });
}
