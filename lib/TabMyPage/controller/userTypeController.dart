import 'package:get/get.dart';

class UserTypeController extends GetxController {
  int userIndex = 0;
  List<String> userType = ['환우', '보호자'];
  String curGender;

  selectUserType(int ind) {
    curGender = userType[ind - 1];
    userIndex = ind;
    update();
  }
}
