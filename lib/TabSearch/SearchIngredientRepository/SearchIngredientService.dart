import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

import '../../Constants.dart';
import 'SearchIngredientItem.dart';

abstract class IFetch {
  Future<List<String>> fetch();
  Future<List<String>> fetchNutritionList();
}

class SearchIngredientService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<List<String>> fetchNutritionList() async {
    //
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.TEMP_TOKEN;
      return request;
    });
    var resp = await get("/common/auto/nutrition");
    if (resp.statusCode == 200) {
      return searchIngredientFromJson(resp.bodyString).data;
    }
    return [];
  }

  @override
  Future<List<String>> fetch() async {
    // httpClient.baseUrl = "http://54.180.67.217:3000";

    // //모든 헤더에 붙인다.
    // httpClient.addRequestModifier((request) {
    //   request.headers['Content-Type'] = 'application/json';
    //   request.headers['token'] =

    //   return request;
    // });
    // var resp = await get("/home/rank");

    // if (resp.statusCode == 200) {
    //   var jsonString = resp.body;
    //   FoodRanking f = foodRankingFromJson(resp.bodyString);

    //   return f.data;
    // }
    return null;
  }
}
