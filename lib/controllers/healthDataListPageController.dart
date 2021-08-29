import 'package:get/get.dart';
import 'package:my_side_client/common/UserProfile.dart';
import 'package:my_side_client/models/healthDataListModel.dart';
import 'package:my_side_client/services/mypageService/myPageService.dart';

class HealthDataListPageController extends GetxController {
  int curYear = DateTime.now().year;
  int showYear = DateTime.now().year;
  int month = DateTime.now().month - 1;
  String rightArrow = 'assets/arrowrightend.svg';
  List<HealthData> monthHealthDataList = [];

  final List<String> monthList = [
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12'
  ];
  @override
  void onInit() async {
    await getMonthDataList();
    super.onInit();
  }

  void getMonthDataList() async {
    monthHealthDataList = await readMonthYearDatList(
        showYear.toString(), monthList[month], UserProfile.token);
    update();
  }

  void deleteFromHealthDataList(int index) async {
    await deleteData(index, UserProfile.token);
    await getMonthDataList();
    update();
  }

  void rightMoveYear() async {
    if (curYear == showYear + 1) {
      rightArrow = 'assets/arrowrightend.svg';
      showYear++;
    } else {
      if (curYear == showYear) {
        showYear = showYear;
      } else {
        showYear++;
      }
    }
    await getMonthDataList();
    update();
  }

  void leftMoveYear() async {
    if (curYear == showYear) {
      rightArrow = 'assets/arrowright.svg';
    }
    showYear--;
    await getMonthDataList();
    update();
  }

  void selectMonth(int index) async {
    month = index;
    await getMonthDataList();
    update();
  }
}
