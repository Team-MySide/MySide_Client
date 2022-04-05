import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TimerPickerWidget extends StatelessWidget {
  final Function setTmpDuration;
  final Function setTimeRequired;
  final Function setInitDuration;

  TimerPickerWidget({
    this.setTmpDuration,
    this.setTimeRequired,
    this.setInitDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 283,
        width: 278,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              color: Color(0xFF3BD7E2),
              child: Text(
                '시간을 선택하세요',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Expanded(
              child: buildTimerPicker(setTmpDuration, setInitDuration),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text(
                      '취소',
                      style: TextStyle(
                        color: Color(0xFF3BD7E2),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      Get.back();
                    },
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  InkWell(
                    child: Text(
                      '확인',
                      style: TextStyle(
                        color: Color(0xFF3BD7E2),
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onTap: () {
                      setTimeRequired();
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTimerPicker(Function setTmpDuration, Function setInitDuartion) =>
      SizedBox(
        child: CupertinoTimerPicker(
          initialTimerDuration: setInitDuartion(),
          mode: CupertinoTimerPickerMode.hm,
          onTimerDurationChanged: (duration) => {setTmpDuration(duration)},
        ),
      );
}
