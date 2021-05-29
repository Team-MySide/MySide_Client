import 'package:flutter/material.dart';

import 'myTextFieldWidget.dart';

class HalfWidthTextField extends StatelessWidget {
  final double scrHeight;
  final String tailText;
  final TextEditingController tec;
  final FocusNode fn;
  final bool canClear;
  final bool errorOcur;
  final String errorMsg;

  HalfWidthTextField({
    @required this.scrHeight,
    @required this.tailText,
    @required this.tec,
    @required this.fn,
    @required this.canClear,
    @required this.errorOcur,
    @required this.errorMsg,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: MyTextWidget(
                scrHeight: scrHeight,
                errorOcur: errorOcur,
                canClear: canClear,
                fn: fn,
                tec: tec,
                hintText: '00',
                isPswd: false,
              ),
            ),
            SizedBox(
              width: 0.0099 * scrHeight,
            ),
            Text(
              tailText,
              style: TextStyle(
                color: Color(0xFF111111),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 0.05 * scrHeight,
            ),
            Expanded(
              child: SizedBox(),
            ),
          ],
        ),
        SizedBox(
          height: 0.0099 * scrHeight,
        ),
        Container(
          width: double.infinity,
          child: Text(
            errorMsg,
            style: TextStyle(
              color: errorOcur ? Color(0xFFEE1100) : Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
