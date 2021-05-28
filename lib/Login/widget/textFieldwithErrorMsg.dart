import 'package:flutter/material.dart';

import 'myTextFieldWidget.dart';

class TextFieldwithErrorMsg extends StatelessWidget {
  final double scrHeight;
  final bool errorOcur;
  final bool canClear;
  final FocusNode fn;
  final TextEditingController tec;
  final String hintText;
  final String errorMsg;
  final bool isPswd;

  TextFieldwithErrorMsg({
    @required this.scrHeight,
    @required this.errorOcur,
    @required this.canClear,
    @required this.fn,
    @required this.tec,
    @required this.hintText,
    @required this.errorMsg,
    @required this.isPswd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextWidget(
          scrHeight: scrHeight,
          errorOcur: errorOcur,
          canClear: canClear,
          fn: fn,
          tec: tec,
          hintText: hintText,
          isPswd: isPswd,
        ),
        SizedBox(
          height: 0.0099 * scrHeight,
        ),
        Container(
          width: double.infinity,
          child: Text(
            errorMsg,
            style: TextStyle(
              color: errorOcur
                  ? Color(0xFFEE1100)
                  : fn.hasFocus
                      ? Color(0xFF3BD7E2)
                      : Color(0xFFDDDDDD),
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
