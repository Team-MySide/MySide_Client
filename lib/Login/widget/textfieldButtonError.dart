import 'package:flutter/material.dart';

import 'myTextFieldWidget.dart';

class TextfieldButtonError extends StatelessWidget {
  final double scrHeight;
  final bool errorText;
  final bool canClear;
  final FocusNode fn;
  final TextEditingController tec;
  final String hintText;
  final String buttonText;
  final String errorMsg;
  final VoidCallback getOPT;

  TextfieldButtonError({
    @required this.scrHeight,
    @required this.errorText,
    @required this.canClear,
    @required this.fn,
    @required this.tec,
    @required this.hintText,
    @required this.buttonText,
    @required this.errorMsg,
    @required this.getOPT,
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
                errorOcur: errorText,
                canClear: canClear,
                fn: fn,
                tec: tec,
                hintText: hintText,
                isPswd: false,
              ),
            ),
            SizedBox(
              width: 0.0099 * scrHeight,
            ),
            InkWell(
              onTap: getOPT,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF3BD7E2),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.0246 * scrHeight,
                    vertical: 0.0185 * scrHeight,
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: Color(0xFF3BD7E2),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
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
              color: errorText
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
