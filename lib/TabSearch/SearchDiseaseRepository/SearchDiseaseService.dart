import 'package:my_side_client/TabSearch/SearchCategoryFoodRepository/SearchFoodItem.dart';
import 'package:my_side_client/common/MySideConnect.dart';

import '../../Constants.dart';

abstract class IFetch {
  Future<List<FoodItem>> fetch(String cancer);
}

class SearchDiseaseService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<List<FoodItem>> fetch(String cancer) async {
    //
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = Constants.temp_token;
      return request;
    });
    var resp = await get("/main/cancer/rank/$cancer/1");
    if (resp.statusCode == 200) {
      return searchFoodItemFromJson(resp.bodyString).data;
    }
    return [];
  }
}
