import 'package:my_side_client/common/MySideConnect.dart';

import '../../Constants.dart';
import 'SearchNutritionFactsBody.dart';

abstract class IFetch {
  Future<SearchNutritionFactsItem> fetch(String food);
}

class SearchIngredientService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<SearchNutritionFactsItem> fetch(String food) async {
    //
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = Constants.temp_token;
      return request;
    });
    var resp = await get("/search/info/Configuration/$food");
    if (resp.statusCode == 200) {
      return searchNutritionFactsBodyFromJson(resp.bodyString).data;
    }
    return SearchNutritionFactsItem();
  }
}
