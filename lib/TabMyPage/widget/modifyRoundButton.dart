import 'package:flutter/material.dart';

class ModifyRoundButton extends StatelessWidget {
  final String buttonText;
  final bool modified;
  final double scrHeight;

  ModifyRoundButton({
    @required this.buttonText,
    @required this.modified,
    @required this.scrHeight,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: modified ? Color(0xFF3BD7E2) : Colors.white,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: 0.0197 * scrHeight, vertical: 0.0099 * scrHeight),
        child: Text(
          buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: modified ? Color(0xFF3BD7E2) : Color(0xFF666666),
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
