import 'package:flutter/material.dart';

class SecondStageTextStyle extends StatelessWidget {
  final String title;
  SecondStageTextStyle({
    @required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text(
        title,
        style: TextStyle(
          color: Color(0xFF111111),
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
