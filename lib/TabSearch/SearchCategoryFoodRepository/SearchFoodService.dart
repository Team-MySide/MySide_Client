import 'package:my_side_client/TabBookmark/SearchBookmarkRepository/SearchFoodItem.dart';
import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

abstract class IFetch {
  Future<List<FoodItem>> fetchFoodCategoryList(String category, int id);
}

class SearchFoodCategoryService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<List<FoodItem>> fetchFoodCategoryList(String category, int id) async {
    //
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.TEMP_TOKEN;
      return request;
    });
    var resp = await get("/search/food/$category/$id");
    if (resp.statusCode == 200) {
      return searchFoodItemFromJson(resp.bodyString).data;
    }
    return [];
  }
}
