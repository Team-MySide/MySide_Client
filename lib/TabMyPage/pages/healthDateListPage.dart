import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_side_client/TabMyPage/controller/monthSelectController.dart';
import 'package:my_side_client/TabMyPage/controller/moveYearController.dart';
import 'package:my_side_client/TabMyPage/widget/dataListWidget.dart';

class HealthDateListPage extends StatelessWidget {
  final moveYearController = Get.put(MoveYearController());
  final monthSelectController = Get.put(MonthSelectController());
  final List<String> monthList = [
    '1월',
    '2월',
    '3월',
    '4월',
    '5월',
    '6월',
    '7월',
    '8월',
    '9월',
    '10월',
    '11월',
    '12월'
  ];

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '건강 데이터 목록',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF111111),
          ),
        ),
        actions: [
          IconButton(
              icon: SvgPicture.asset('assets/Setting.svg'), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 0.0394 * scrHeight,
            ),
            Center(
              child: Container(
                height: 0.0493 * scrHeight,
                width: 0.2746 * scrHeight,
                decoration: BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/arrowleft.svg',
                      ),
                      onPressed: () {
                        moveYearController.leftMoveYear();
                      },
                    ),
                    GetBuilder<MoveYearController>(
                        builder: (moveYearController) {
                      return Text(
                        moveYearController.showYear.toString(),
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF111111),
                            fontFamily: 'Metropolis'),
                      );
                    }),
                    IconButton(
                      icon: GetBuilder<MoveYearController>(
                        builder: (moveYearController) {
                          return moveYearController.rightArrow;
                        },
                      ),
                      onPressed: () {
                        moveYearController.rightMoveYear();
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 0.0394 * scrHeight,
            ),
            GetBuilder<MonthSelectController>(
              builder: (monthSelectController) {
                return Container(
                  height: 0.08 * scrHeight,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: monthList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 0.0419 * scrHeight,
                        width: 0.0788 * scrHeight,
                        child: Column(
                          children: [
                            TextButton(
                              child: Text(
                                monthList[index],
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: monthSelectController.month == index
                                      ? Color(0xFF3BD7E2)
                                      : Color(0xFFAAAAAA),
                                ),
                              ),
                              onPressed: () {
                                monthSelectController.selectMonth(index);
                              },
                            ),
                            SizedBox(height: 0.005 * scrHeight),
                            Container(
                              color: monthSelectController.month == index
                                  ? Color(0xFF3BD7E2)
                                  : Color(0xFFDDDDDD),
                              height:
                                  monthSelectController.month == index ? 3 : 1,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            DataListWidget(
              dataNum: 2,
              scrHeight: scrHeight,
              isMain: false,
            ),
          ],
        ),
      ),
    );
  }
}
