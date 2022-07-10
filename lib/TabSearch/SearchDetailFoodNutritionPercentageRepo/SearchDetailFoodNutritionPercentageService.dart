import 'package:my_side_client/TabSearch/SearchDetailFoodState/SearchDetailFoodStateBody.dart';
import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'SearchDetailFoodNutritionPercentageBody.dart';

abstract class IFetch {
  Future<List<FoodNutritionPercentageItem>> fetch(String food, String state);
}

class SearchDetailFoodNutritionPercentageService extends MySideConnect
    implements IFetch {
  // static var client = http.Client();

  @override
  Future<List<FoodNutritionPercentageItem>> fetch(
      String food, String state) async {
    //
    httpClient.baseUrl = "http://3.39.126.13:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.token;
      return request;
    });
    var resp = await get("/search/info/percent/$food/$state");
    if (resp.statusCode == 200) {
      return searchDetailFoodNutritionPercentageBodyFromJson(resp.bodyString)
          .data;
    }
    return [];
  }
}
