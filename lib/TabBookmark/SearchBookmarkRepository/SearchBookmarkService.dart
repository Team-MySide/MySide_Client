import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

import '../../Constants.dart';
import 'SearchFoodItem.dart';

abstract class IFetch {
  Future<List<FoodItem>> fetch();
}

class SearchFoodCategoryService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<List<FoodItem>> fetch() async {
    //
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.temp_token;
      return request;
    });
    var resp = await get("/wish/list");
    if (resp.statusCode == 200) {
      return searchFoodItemFromJson(resp.bodyString).data;
    }
    return [];
  }
}
