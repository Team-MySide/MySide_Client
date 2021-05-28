import 'package:flutter/material.dart';

class LongRoundButton extends StatelessWidget {
  final String buttonText;
  final double scrHeight;
  final bool activated;
  final VoidCallback validateFunc;
  final Color deactivatedTextColor;

  LongRoundButton({
    @required this.buttonText,
    @required this.scrHeight,
    @required this.activated,
    @required this.validateFunc,
    this.deactivatedTextColor,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: validateFunc,
      child: Container(
        height: 0.0616 * scrHeight,
        //width: double.infinity,
        decoration: BoxDecoration(
          color: activated ? Color(0xFF3BD7E2) : Color(0xFFE5E5E5),
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: TextStyle(
              color: activated
                  ? Colors.white
                  : deactivatedTextColor ?? Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
