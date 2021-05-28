import 'package:flutter/material.dart';

class SmallRoundButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final double buttonWidth;

  SmallRoundButton({
    @required this.buttonText,
    @required this.onTap,
    this.buttonWidth,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: buttonWidth ?? 40,
        height: 24,
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
    );
  }
}
