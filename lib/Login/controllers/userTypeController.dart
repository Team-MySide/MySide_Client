import 'package:get/get.dart';

class UserTypeController extends GetxController {
  int userType = 0;

  void setUserType(int type) {
    userType = type;
    update();
  }
}
