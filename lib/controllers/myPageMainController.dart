import 'package:get/get.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'package:my_side_client/models/healthDataListModel.dart';
import 'package:my_side_client/models/userInfo.dart';
import 'package:my_side_client/services/mypageService/myPageService.dart';

class MyPageMainController extends GetxController {
  UserData userData = UserData();
  List<HealthData> totalHealthDataList = [];

  void getHealthDataList() async {
    totalHealthDataList = await readTotalHealthData(UserProfile.token);
    update();
  }

  void getUserInfo() async {
    userData = await getUserInfoService(UserProfile.token);
    update();
  }

  void deleteFromMypage(int index) async {
    await deleteData(index, UserProfile.token);
    await getHealthDataList();
    await getUserInfo();
    update();
  }
}
