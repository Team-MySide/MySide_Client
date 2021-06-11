import 'package:my_side_client/common/MySideConnect.dart';
import 'package:my_side_client/common/UserProfile.dart';

abstract class IFetch {
  Future<bool> requestChangeStatus(String food, int status);
}

class RequestZzimStatusChangeService extends MySideConnect implements IFetch {
  // static var client = http.Client();

  @override
  Future<bool> requestChangeStatus(String food, int status) async {
    //
    httpClient.baseUrl = "http://54.180.67.217:3000";

    //모든 헤더에 붙인다.
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      request.headers['token'] = UserProfile.temp_token;
      return request;
    });
    dynamic body = {"food": "$food", "status": status};
    var resp = await post("wish", body);

    if (resp.statusCode == 200) {
      return status == 1 ? true : false;
    }
    return false;
  }
}
