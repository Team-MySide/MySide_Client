import 'package:flutter/material.dart';

class RichTextWithoutQuotes extends StatelessWidget {
  final String firstText;
  final String secondText;
  RichTextWithoutQuotes({
    this.firstText,
    this.secondText,
  });
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: TextStyle(
          color: Color(0xFF111111),
          fontSize: 22.0,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(
            text: secondText,
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 22.0,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
