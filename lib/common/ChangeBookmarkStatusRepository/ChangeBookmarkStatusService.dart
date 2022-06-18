import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

abstract class IFetch {
  Future<bool> requestBookmarkChangeStatus(String food, int status);
  Future<bool> requestLikeChangeStatus(String food, int status);
}

class ChangeBookmarkStatusService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<bool> requestBookmarkChangeStatus(String food, int status) async {
    //
    httpClient.baseUrl = "http://3.39.126.13:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.token;

      return request;
    });
    dynamic body = {"food": "$food", "status": status};
    var resp = await put("/wish", body);

    if (resp.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> requestLikeChangeStatus(String food, int status) async {
    //
    httpClient.baseUrl = "http://3.39.126.13:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.token;

      return request;
    });
    dynamic body = {"food": "$food", "status": status};
    var resp = await put("/like", body);

    if (resp.statusCode == 200) {
      return true;
    }
    return false;
  }
}
