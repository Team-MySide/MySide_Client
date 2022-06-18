import 'package:get/get_connect/connect.dart';
import 'dart:convert';

class FindPswdService extends GetConnect {
  Future<bool> getPswd(String name, String email) async {
    httpClient.baseUrl = "http://3.39.126.13:3000";
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      return request;
    });

    var resp = await get('/auth/password/$email/$name');
    print(resp.statusCode);
    if (resp.statusCode == 200) {
      var jsondata = json.decode(resp.bodyString);
      print(jsondata);
      return jsondata['success'];
    } else {
      return false;
    }
  }
}
