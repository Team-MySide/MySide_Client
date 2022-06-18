import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'SearchDetailReference.dart';

abstract class IFetch {
  Future<List<SearchDetailReferenceItem>> fetch(String food);
}

class SearchDetailReferenceService extends MySideConnect implements IFetch {
  @override
  Future<List<SearchDetailReferenceItem>> fetch(String food) async {
    httpClient.baseUrl = "http://3.39.126.13:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.token;
      return request;
    });
    var resp = await get("/search/info/source/stats/$food");
    if (resp.statusCode == 200) {
      return searchDetailReferenceFromJson(resp.bodyString).data;
      // var json = {
      //   "status": 200,
      //   "success": true,
      //   "message": "음식 출처 목록 조회 성공",
      //   "data": [
      //     {
      //       "cancerNm": "간암",
      //       "flagList": [
      //         {"code": 1, "count": 1},
      //         {"code": 2, "count": 1},
      //         {"code": 3, "count": 0}
      //       ]
      //     },
      //     {
      //       "cancerNm": "폐암",
      //       "flagList": [
      //         {"code": 1, "count": 1},
      //         {"code": 2, "count": 0},
      //         {"code": 3, "count": 0}
      //       ]
      //     }
      //   ]
      // };
      // return searchDetailReferenceFromJson(json.toString()).data;
    }
    return null;
  }
}
