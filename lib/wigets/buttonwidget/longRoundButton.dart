import 'package:flutter/material.dart';

class LongRoundButton extends StatelessWidget {
  final String buttonText;
  final double scrHeight;
  final bool activated;
  final VoidCallback validateFunc;
  final Color buttonColor;

  LongRoundButton({
    @required this.buttonText,
    @required this.scrHeight,
    @required this.activated,
    @required this.validateFunc,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: activated ? validateFunc : () {},
      child: Container(
        height: 0.0616 * scrHeight,
        decoration: BoxDecoration(
          color:
              activated ? buttonColor ?? Color(0xFF3BD7E2) : Color(0xFFE5E5E5),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
