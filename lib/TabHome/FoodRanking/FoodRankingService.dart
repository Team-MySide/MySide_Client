import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'FoodRankingItem.dart';

abstract class IFetch {
  Future<List<FoodRankingItem>> fetch();
}

class FoodRankingService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<List<FoodRankingItem>> fetch() async {
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.TEMP_TOKEN;
      return request;
    });
    var resp = await get("/home/rank");

    if (resp.statusCode == 200) {
      FoodRanking f = foodRankingFromJson(resp.bodyString);

      return f.data;
    }
    return null;
  }
}
