import 'package:flutter/material.dart';

import '../longRoundButton.dart';

class TextTextButtonDialog extends StatelessWidget {
  final double scrHeight;
  final String dialogText;
  final VoidCallback routeFunc;
  final VoidCallback textButtonFunc;

  TextTextButtonDialog({
    @required this.scrHeight,
    @required this.dialogText,
    @required this.routeFunc,
    @required this.textButtonFunc,
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
          //Spacer(),
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
          Spacer(),
          InkWell(
            onTap: textButtonFunc,
            child: Text(
              '회원가입하러 가기',
              style: TextStyle(
                color: Color(0xFF3BD7E2),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Spacer(),
          LongRoundButton(
            buttonText: '확인',
            scrHeight: scrHeight,
            activated: true,
            validateFunc: routeFunc,
          ),
        ],
      ),
    );
  }
}
