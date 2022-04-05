import 'package:flutter/material.dart';

class SmallRoundButton extends StatelessWidget {
  final double scrHeight;
  final String buttonText;
  final VoidCallback onTap;
  final double buttonWidth;

  SmallRoundButton({
    this.scrHeight,
    this.buttonText,
    this.onTap,
    this.buttonWidth,
  });
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.0105 * scrHeight,
            vertical: 0.0053 * scrHeight,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFDDDDDD),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              buttonText,
              style: TextStyle(
                color: Color(0xFFAAAAAA),
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
