import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../longRoundButton.dart';

class TwoButtonDialog extends StatelessWidget {
  final double scrHeight;
  final String dialogText;
  final VoidCallback routeFunc;

  TwoButtonDialog({
    @required this.scrHeight,
    @required this.dialogText,
    @required this.routeFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.0296 * scrHeight),
      height: 0.2562 * scrHeight,
      width: 0.4224 * scrHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            child: Text(
              dialogText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF111111),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Row(
            children: [
              Expanded(
                child: LongRoundButton(
                  buttonText: '아니요',
                  scrHeight: scrHeight,
                  activated: false,
                  validateFunc: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(
                width: 0.0197 * scrHeight,
              ),
              Expanded(
                child: LongRoundButton(
                  buttonText: '네',
                  scrHeight: scrHeight,
                  activated: true,
                  validateFunc: routeFunc,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
