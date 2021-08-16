import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

import '../../Constants.dart';
import 'SearchPopularKeywordBody.dart';

abstract class IFetch {
  Future<List<String>> fetch();
}

class SearchPopuylarKeywordService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<List<String>> fetch() async {
    //
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.TEMP_TOKEN;
      return request;
    });
    var resp = await get("/search/popular");
    if (resp.statusCode == 200) {
      return searchPopularKeywordFromJson(resp.bodyString).data;
    }
    return [];
  }
}
