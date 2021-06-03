import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabMyPage/model/HealthDataListModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:my_side_client/common/UserProfile.dart';

class HealthDataListController extends GetxController {
  int curYear = DateTime.now().year;
  int showYear = DateTime.now().year;
  SvgPicture rightArrow = SvgPicture.asset('assets/arrowrightend.svg');
  int month = DateTime.now().month - 1;
  List<HealthData> curMonthHealthData = [];

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
    // TODO: implement onInit
    super.onInit();
    getMonthYearDatList();
  }

  void getMonthYearDatList() async {
    final response = await http.get(
      Uri.http('54.180.67.217:3000',
          '/mypage/health/${showYear.toString()}-${monthList[month]}'),
      headers: {"Accept": "applications.json", "token": UserProfile.token},
    );
    if (response.statusCode == 200) {
      var jsondata = json.decode(response.body);
      if (jsondata['success'] == true) {
        curMonthHealthData = healthDataListFromJson(response.body).data;
      } else {
        curMonthHealthData = [];
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
    await getMonthYearDatList();
    update();
  }

  rightMoveYear() async {
    if (curYear == showYear + 1) {
      rightArrow = SvgPicture.asset('assets/arrowrightend.svg');
      showYear++;
    } else {
      if (curYear == showYear) {
        showYear = showYear;
      } else {
        showYear++;
      }
    }
    await getMonthYearDatList();
    update();
  }

  leftMoveYear() async {
    if (curYear == showYear) {
      rightArrow = SvgPicture.asset('assets/arrowright.svg');
    }
    showYear--;
    await getMonthYearDatList();
    update();
  }

  selectMonth(int index) async {
    month = index;
    await getMonthYearDatList();
    update();
  }
}
