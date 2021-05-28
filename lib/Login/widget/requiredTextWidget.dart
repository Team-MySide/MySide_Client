import 'package:flutter/material.dart';

class RequiredTextWidget extends StatelessWidget {
  final String mainText;
  RequiredTextWidget({
    @required this.mainText,
  });
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: mainText,
        style: TextStyle(
          color: Color(0xFF666666),
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: '*',
            style: TextStyle(
              color: Color(0xFFEE1100),
            ),
          ),
        ],
      ),
    );
  }
}
