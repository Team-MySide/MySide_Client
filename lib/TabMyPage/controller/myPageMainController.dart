import 'package:get/get.dart';
import 'package:my_side_client/TabMyPage/model/HealthDataListModel.dart';
import 'package:my_side_client/TabMyPage/model/UserInfo.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_side_client/common/UserProfile.dart';

class MyPageMainController extends GetxController {
  UserData userData = UserData();
  List<HealthData> healthdataList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    //getHealthDataList();
  }

  void getHealthDataList() async {
    final response = await http.get(
      Uri.http('54.180.67.217:3000', '/mypage/health'),
      headers: {"Accept": "applications.json", "token": UserProfile.token},
    );
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      if (jsondata['success'] == true) {
        healthdataList = healthDataListFromJson(response.body).data;
      } else {
        healthdataList = [];
      }
    }
    update();
  }

  void deleteData(int index) async {
    final response = await http.delete(
      Uri.http(
          '54.180.67.217:3000', '/mypage/health/delete/${index.toString()}'),
      headers: {"Accept": "applications.json", "token": UserProfile.token},
    );
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
    }
    await getHealthDataList();
    update();
  }
}
