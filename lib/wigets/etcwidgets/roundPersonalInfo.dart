import 'package:flutter/material.dart';

class RoundPersonalInfo extends StatelessWidget {
  final String buttonText;
  final double scrHeight;

  RoundPersonalInfo({
    @required this.buttonText,
    @required this.scrHeight,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0211 * scrHeight, vertical: 0.0105 * scrHeight),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
