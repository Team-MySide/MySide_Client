import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/constantsList.dart';
import 'package:my_side_client/controllers/addHealthDataController.dart';
import 'package:my_side_client/controllers/myPageMainController.dart';
import 'package:my_side_client/wigets/buttonwidget/textWithMoreButton.dart';
import 'package:my_side_client/wigets/etcwidgets/showHealthDataWidget.dart';
import 'package:my_side_client/wigets/widgetforscreen/widgetForMyPageMain.dart';

class MyPageMain extends StatelessWidget {
  final MyPageMainController myPageMainController =
      Get.put(MyPageMainController());
  final AddHealthDataController addHealthDataController =
      Get.put(AddHealthDataController());
  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xFF3BD7E2),
      appBar: AppBar(
        backgroundColor: Color(0xFF3BD7E2),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/settings');
            },
            icon: Image.asset('assets/top.png'),
          )
        ],
      ),
      body: GetBuilder<MyPageMainController>(
        builder: (controller) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.0422 * scrHeight,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 0.0649 * scrHeight,
                          backgroundImage: AssetImage('assets/girl.jpg'),
                        ),
                        SizedBox(
                          height: 0.0211 * scrHeight,
                        ),
                        buildNameandNicknameRow(
                            '${controller.userData.nickname}',
                            '${controller.userData.name}'),
                        SizedBox(
                          height: 0.0211 * scrHeight,
                        ),
                        buildhashUserInfo(
                            scrHeight,
                            '${controller.userData.cancerNm}',
                            '${controller.userData.stageNm}',
                            '${controller.userData.progressNm}',
                            '${controller.userData.disease}'),
                        SizedBox(
                          height: 0.0527 * scrHeight,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.0211 * scrHeight,
                        vertical: 0.0422 * scrHeight,
                      ),
                      child: Column(
                        children: [
                          buildIconButtons(
                            myPageMainIconText,
                            myPageMainIconName,
                            [
                              () async {
                                await addHealthDataController.callCurUserInfo();
                                addHealthDataController.setOption(1);
                                Get.toNamed('/addHealthData');
                              },
                              () {
                                Get.toNamed('/ProfileChange');
                              },
                              () {}
                            ],
                            scrHeight,
                          ),
                          SizedBox(
                            height: 0.0632 * scrHeight,
                          ),
                          TextWithMoreButton(
                            titleText: '건강 데이터 목록',
                            onTap: () {
                              Get.toNamed('/healthDataList');
                            },
                          ),
                          SizedBox(
                            height: 0.0263 * scrHeight,
                          ),
                          ShowHealthdataWidget(
                            scrHeight: scrHeight,
                            isMain: true,
                            toAddHealthDataPage: () {
                              Get.toNamed('/addHealthData');
                            },
                            healthDataList: controller.totalHealthDataList,
                            deleteFunc: controller.deleteFromMypage,
                            editFunc: addHealthDataController.callEditUserInfo,
                            setOption: addHealthDataController.setOption,
                          ),
                        ],
                      ),
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
