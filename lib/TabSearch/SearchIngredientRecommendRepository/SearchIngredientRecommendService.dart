import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

import '../../Constants.dart';
import 'SearchIngredientItem.dart';

abstract class IFetch {
  Future<List<String>> fetch();
}

class SearchIngredientRecommendService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<List<String>> fetch() async {
    //
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.token;
      return request;
    });
    var resp = await get("/search/suggest/keyword");
    if (resp.statusCode == 200) {
      return searchIngredientRecommendFromJson(resp.bodyString).data;
    }
    return [];
  }
}
