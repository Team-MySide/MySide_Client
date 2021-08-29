import 'package:flutter/material.dart';

class RequiredTextWidget extends StatelessWidget {
  final String mainText;
  final bool isRequired;
  RequiredTextWidget({
    @required this.mainText,
    this.isRequired,
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
          isRequired
              ? TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: Color(0xFFEE1100),
                  ),
                )
              : TextSpan(text: ''),
        ],
      ),
    );
  }
}
