import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> httpfindEmail(String name, String phone) async {
  final response = await http.get(
    Uri.http('3.39.126.13:3000', '/auth/find/id/$name/$phone'),
    headers: {"Accept": "applications.json"},
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    if (jsondata['success']) {
      return jsondata['data']['email']['email'];
    } else {
      return '';
    }
  }
  return '';
}

Future<bool> httpfindPswd(String email, String name) async {
  final response = await http.get(
    Uri.http('3.39.126.13:3000', '/auth/password/$email/$name'),
    headers: {"Accept": "applications.json"},
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    return jsondata['success'];
  }
  return false;
}

Future<int> httpIsExistEmail(String email) async {
  final response = await http.get(
    Uri.http('3.39.126.13:3000', '/auth/duplicated/email/$email'),
    headers: {"Accept": "applications.json"},
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    return jsondata["data"];
  } else {
    return 0;
  }
}

Future<int> httpIsExistNickname(String nickname) async {
  final response = await http.get(
    Uri.http('3.39.126.13:3000', '/auth/duplicated/nickname/$nickname'),
    headers: {"Accept": "applications.json"},
  );
  if (response.statusCode == 200) {
    var jsondata = json.decode(response.body);
    return jsondata["data"];
  } else {
    return 0;
  }
}
