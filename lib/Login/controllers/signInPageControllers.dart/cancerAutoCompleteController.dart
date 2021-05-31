import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CancerAutoCompleteController extends GetxController {
  List<dynamic> cancerList;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  void getData() async {
    final response = await http.get(
      Uri.http('54.180.67.217:3000', '/common/auto/cancer'),
      headers: {"Accept": "applications.json"},
    );
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      cancerList = jsondata['data'];
    }
  }

  List<String> getSuggestions(String query) {
    return cancerList
        .where((foodList) => foodList.contains(query))
        .toList()
        .cast<String>();
  }
}
