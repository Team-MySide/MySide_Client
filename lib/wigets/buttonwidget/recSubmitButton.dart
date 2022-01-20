import 'package:flutter/material.dart';

class RecSubmitButton extends StatelessWidget {
  final String buttonText;
  final double buttonHeight;
  final bool activated;
  final VoidCallback validateFunc;
  final Color rectButtonColor;

  RecSubmitButton({
    @required this.buttonText,
    @required this.buttonHeight,
    @required this.activated,
    @required this.validateFunc,
    this.rectButtonColor,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: validateFunc,
      child: Container(
        height: buttonHeight,
        //width: double.infinity,
        decoration: BoxDecoration(
          color: activated
              ? rectButtonColor == null
                  ? Color(0xFF3BD7E2)
                  : rectButtonColor
              : Color(0xFFE5E5E5),
        ),
        child: Align(
          alignment: Alignment.center,
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
