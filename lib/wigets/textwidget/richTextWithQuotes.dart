import 'package:flutter/material.dart';

class RichTextWithQuotes extends StatelessWidget {
  final String firstText;
  final String secondText;
  RichTextWithQuotes({
    this.firstText,
    this.secondText,
  });
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: '"',
        style: TextStyle(
          color: Color(0xFF111111),
          fontSize: 22.0,
          fontWeight: FontWeight.w400,
        ),
        children: [
          TextSpan(
            text: firstText,
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 22.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextSpan(
            text: secondText,
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 22.0,
              fontWeight: FontWeight.w300,
            ),
          ),
          TextSpan(
            text: '"',
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 22.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
