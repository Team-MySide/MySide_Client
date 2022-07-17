import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

import 'NutritionDetailItem.dart';

abstract class IFetch {
  Future<Map<String, double>> fetchNutritionList(String category, String state);
}

class NutritionDetailListService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<Map<String, double>> fetchNutritionList(
      String category, String state) async {
    //
    httpClient.baseUrl = "http://3.39.126.13:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.token;
      return request;
    });
    var resp = await get("/search/info/nutrition/detail/$category/$state");
    if (resp.statusCode == 200) {
      return nutritionDetailFromJson(resp.bodyString).data;
    }
    return {};
  }
}
