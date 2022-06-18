import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

import '../../Constants.dart';
import 'SearchDetailNutritionFactsBody.dart';

abstract class IFetch {
  Future<SearchDetailNutritionFactsItem> fetch(String food);
}

class SearchDetailNutritionService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<SearchDetailNutritionFactsItem> fetch(String food) async {
    //
    httpClient.baseUrl = "http://3.39.126.13:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.token;
      return request;
    });
    var resp = await get("/search/info/Configuration/$food");
    if (resp.statusCode == 200) {
      return searchDetailNutritionFactsBodyFromJson(resp.bodyString).data;
    }
    return SearchDetailNutritionFactsItem();
  }
}
