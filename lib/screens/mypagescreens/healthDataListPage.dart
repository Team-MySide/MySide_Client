import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/constantsList.dart';
import 'package:my_side_client/controllers/addHealthDataController.dart';
import 'package:my_side_client/controllers/healthDataListPageController.dart';
import 'package:my_side_client/controllers/myPageMainController.dart';
import 'package:my_side_client/wigets/etcwidgets/showHealthDataWidget.dart';
import 'package:my_side_client/wigets/widgetforscreen/healtDataListPageWidget.dart';

class HealthDataListPage extends StatelessWidget {
  final HealthDataListPageController healthDataListPageController =
      Get.put(HealthDataListPageController());
  final MyPageMainController myPageMainController =
      Get.put(MyPageMainController());
  final AddHealthDataController addHealthDataController =
      Get.put(AddHealthDataController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '건강 데이터 목록',
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/Setting.svg'),
            onPressed: () {},
          ),
        ],
      ),
      body: GetBuilder<HealthDataListPageController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 0.0422 * scrHeight,
                  ),
                  buildYearSelector(
                    scrHeight,
                    controller.showYear.toString(),
                    () async {
                      await controller.leftMoveYear();
                    },
                    () async {
                      await controller.rightMoveYear();
                    },
                    controller.rightArrow,
                  ),
                  SizedBox(
                    height: 0.0422 * scrHeight,
                  ),
                  buildMonthSelector(
                    scrHeight,
                    monthList,
                    controller.month,
                    controller.selectMonth,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 0.0211 * scrHeight),
                    child: ShowHealthdataWidget(
                      scrHeight: scrHeight,
                      isMain: false,
                      toAddHealthDataPage: () {
                        Get.toNamed('/addHealthData');
                      },
                      healthDataList: controller.monthHealthDataList,
                      deleteFunc: controller.deleteFromHealthDataList,
                      myPageListRefresh: myPageMainController.getHealthDataList,
                      myPageUserInfoRefresh: myPageMainController.getUserInfo,
                      editFunc: addHealthDataController.callEditUserInfo,
                      setOption: addHealthDataController.setOption,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
