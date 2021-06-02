import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

import 'SearchDetailFoodDetailnfoBody.dart';

abstract class IFetch {
  Future<SearchDetailFoodDetailItem> fetch(String food);
}

class SearchDetailService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<SearchDetailFoodDetailItem> fetch(String food) async {
    //
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.temp_token;
      return request;
    });
    var resp = await get("/search/info/detail/$food");
    if (resp.statusCode == 200) {
      return searchDetailFoodDetailBodyFromJson(resp.bodyString).data;
    }
    return SearchDetailFoodDetailItem();
  }
}
