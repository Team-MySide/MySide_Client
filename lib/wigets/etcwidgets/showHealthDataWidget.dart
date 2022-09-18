import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/models/healthDataListModel.dart';
import 'package:my_side_client/wigets/dialogwidget/twoButtonDialog.dart';
import 'package:my_side_client/wigets/etcwidgets/patientDataListTileWidget.dart';

class ShowHealthdataWidget extends StatelessWidget {
  final double scrHeight;
  final bool isMain;
  final VoidCallback toAddHealthDataPage;
  final List<HealthData> healthDataList;
  final Function deleteFunc;
  final Function myPageListRefresh;
  final Function myPageUserInfoRefresh;
  final Function editFunc;
  final Function setOption;

  ShowHealthdataWidget({
    this.scrHeight,
    this.isMain,
    this.toAddHealthDataPage,
    this.healthDataList,
    this.deleteFunc,
    this.myPageListRefresh,
    this.myPageUserInfoRefresh,
    this.editFunc,
    this.setOption,
  });

  @override
  Widget build(BuildContext context) {
    return healthDataList.length < 1
        ? Center(
            // padding: EdgeInsets.fromLTRB(
            //   scrHeight * 0.0843,
            //   scrHeight * 0.2069,
            //   scrHeight * 0.0843,
            //   0,
            // ),
            child: Column(
              children: [
                SizedBox(height: 40),
                InkWell(
                  child: Image.asset(
                    'assets/plus.png',
                    height: 62,
                    width: 62,
                  ),
                  onTap: toAddHealthDataPage,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '어떤 변화가 있었나요?',
                  style: TextStyle(
                    color: Color(0xFF111111),
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: '필요한 정보를',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                      TextSpan(
                        text: ' 기록',
                        style: TextStyle(
                          color: Color(0xFF3BD7E2),
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                      TextSpan(
                        text: '해보세요',
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          )
        : Column(
            children: [
              isMain
                  ? SizedBox()
                  : Column(
                      children: [
                        SizedBox(
                          height: 0.0527 * scrHeight,
                        ),
                        InkWell(
                          child: Image.asset(
                            'assets/plus.png',
                            height: 0.0493 * scrHeight,
                            width: 0.0493 * scrHeight,
                          ),
                          onTap: toAddHealthDataPage,
                        ),
                        SizedBox(
                          height: 0.0527 * scrHeight,
                        ),
                      ],
                    ),
              ListView.builder(
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: healthDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return PatientDataListTileWidget(
                    scrHeight: scrHeight,
                    healthData: healthDataList[index],
                    onDelete: () {
                      Get.dialog(
                        TwoButtonDialog(
                          scrHeight: scrHeight,
                          dialogText: '헉.. 삭제하실 건가요?\n해당 데이터가 지워집니다.',
                          routeFunc: () async {
                            await deleteFunc(
                              healthDataList[index].healthId,
                            );
                            if (myPageListRefresh != null) {
                              await myPageListRefresh();
                              await myPageUserInfoRefresh();
                            }
                            Get.back();
                          },
                        ),
                      );
                    },
                    onUpdated: () async {
                      await editFunc(healthDataList[index].healthId);
                      setOption(2);
                      toAddHealthDataPage();
                    },
                  );
                },
              ),
            ],
          );
  }
}
