import 'package:get/get_connect/connect.dart';
import 'dart:convert';

class FindEmailService extends GetConnect {
  Future<String> getEmail(String name, String phone) async {
    httpClient.baseUrl = "http://54.180.67.217:3000";
    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = 'application/json';
      return request;
    });

    var resp = await get('/auth/find/id/$name/$phone');
    if (resp.statusCode == 200) {
      var jsondata = json.decode(resp.bodyString);
      if (jsondata['success']) {
        return jsondata['data']['email']['email'];
      } else {
        return '';
      }
    }
    return '';
  }
}
