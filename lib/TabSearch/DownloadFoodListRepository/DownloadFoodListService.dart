import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

import '../../Constants.dart';
import 'DownloadFoodItem.dart';

abstract class IFetch {
  Future<List<String>> fetchFoodCategoryList();
}

class DownloadFoodListService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<List<String>> fetchFoodCategoryList() async {
    //
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.TEMP_TOKEN;
      return request;
    });
    var resp = await get("/common/auto/food");
    if (resp.statusCode == 200) {
      return downloadFoodListFromJson(resp.bodyString).data;
    }
    return [];
  }
}
