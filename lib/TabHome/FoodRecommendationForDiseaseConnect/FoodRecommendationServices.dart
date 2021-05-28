// import 'package:http/http.dart' as http;

import 'package:my_side_client/common/MySideConnect.dart';

import '../../Constants.dart';
import 'FoodRecommendationForDisease.dart';

abstract class IFetch {
  Future<List<Datum>> fetch();
}

class FoodRecommendationForDiseaseService extends MySideConnect
    implements IFetch {
  @override
  Future<List<Datum>> fetch() async {
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = Constants.temp_token;
      return request;
    });
    var resp = await get("/main/cancer/recommendation");

    if (resp.statusCode == 200) {
      FoodRecommendForDisease f =
          foodRecommendForDiseaseFromJson(resp.bodyString);

      return f.data;
    }
    return null;
  }
}
