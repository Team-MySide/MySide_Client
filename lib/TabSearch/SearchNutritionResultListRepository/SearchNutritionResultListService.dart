import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

import 'SearchNutritionResultBody.dart';

abstract class IFetch {
  Future<List<SearchNutritionResultItem>> fetch(String keyword);
}

class SearchNutritionResultListService extends MySideConnect implements IFetch {
  SearchNutritionResultListService();
  @override
  Future<List<SearchNutritionResultItem>> fetch(String keyword) async {
    //
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.TEMP_TOKEN;
      return request;
    });
    var resp = await get("/search/nutrition/$keyword");
    if (resp.statusCode == 200) {
      return searchNutritionResultBodyFromJson(resp.bodyString).data;
    }
    return [];
  }
}
