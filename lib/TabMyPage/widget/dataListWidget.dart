import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/Login/widget/dialogWidget/textButtonDialog.dart';
import 'package:my_side_client/TabMyPage/model/HealthDataListModel.dart';

import 'healthDataContainer.dart';

class DataListWidget extends StatelessWidget {
  final double scrHeight;
  final bool isMain;
  final VoidCallback onTap;
  final List<HealthData> healthDataList;
  final Function deleteFunc;
  final Function callMainDataList;

  DataListWidget({
    @required this.scrHeight,
    @required this.isMain,
    @required this.onTap,
    @required this.healthDataList,
    @required this.deleteFunc,
    this.callMainDataList,
  });

  @override
  Widget build(BuildContext context) {
    return healthDataList.length < 1
        ? Column(
            children: [
              SizedBox(
                height: 0.1933 * scrHeight,
              ),
              InkWell(
                child: Image.asset(
                  'assets/plus.png',
                  height: 62,
                  width: 62,
                ),
                onTap: onTap,
              ),
              SizedBox(
                height: 0.0493 * scrHeight,
              ),
              Text(
                '어떤 변화가 있었나요?',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 22,
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
                        fontSize: 22,
                      ),
                    ),
                    TextSpan(
                      text: ' 기록',
                      style: TextStyle(
                        color: Color(0xFF3BD7E2),
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    TextSpan(
                      text: '해보세요.',
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        : Column(
            children: [
              isMain
                  ? SizedBox(
                      height: 0.0246 * scrHeight,
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 0.0493 * scrHeight,
                        ),
                        InkWell(
                          child: Image.asset(
                            'assets/plus.png',
                            height: 0.0493 * scrHeight,
                            width: 0.0493 * scrHeight,
                          ),
                          onTap: onTap,
                        ),
                        SizedBox(
                          height: 0.0493 * scrHeight,
                        ),
                      ],
                    ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: healthDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return HealthDataContainer(
                    dateText: healthDataList[index].regiDate,
                    cancerNm: healthDataList[index].cancerNm,
                    stageNm: healthDataList[index].stageNm,
                    statusNm: healthDataList[index].progressNm,
                    diseaseNm: healthDataList[index].disease,
                    weight: healthDataList[index].weight,
                    height: healthDataList[index].height,
                    memoText: healthDataList[index].memo,
                    modifiedNum: 3,
                    scrHeight: scrHeight,
                    onDelete: () {
                      Get.dialog(
                        Dialog(
                          child: TextButtonDialog(
                            scrHeight: scrHeight,
                            dialogText: '삭제하시겠습니까?',
                            routeFunc: () async {
                              await deleteFunc(healthDataList[index].healthId);
                              if (callMainDataList != null) {
                                await callMainDataList();
                              }
                              Get.back();
                            },
                          ),
                        ),
                      );
                    },
                    onUpdated: () {},
                  );
                },
              ),
            ],
          );
  }
}
