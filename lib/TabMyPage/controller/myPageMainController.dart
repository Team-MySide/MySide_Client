import 'package:get/get.dart';
import 'package:my_side_client/TabMyPage/model/UserInfo.dart';
import 'package:http/http.dart' as http;

import 'package:my_side_client/common/UserProfile.dart';

class MyPageMainController extends GetxController {
  UserData userData = UserData();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getUserInfo();
  }

  void getUserInfo() async {
    final response = await http.get(
      Uri.http('54.180.67.217:3000', '/mypage'),
      headers: {"Accept": "applications.json", "token": UserProfile.token},
    );
    if (response.statusCode == 200) {
      userData = userInfoFromJson(response.body).data;
    }
  }
}
