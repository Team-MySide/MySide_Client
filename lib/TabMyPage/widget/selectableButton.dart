import 'package:flutter/material.dart';

class SelectableButton extends StatelessWidget {
  final String buttonText;
  final bool isSelected;
  final double scrHeight;
  final VoidCallback clickedFunc;

  SelectableButton({
    @required this.buttonText,
    @required this.isSelected,
    @required this.scrHeight,
    @required this.clickedFunc,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: clickedFunc,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 0.0185 * scrHeight,
        ),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF3BD7E2) : Color(0xFFF4F4F4),
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            buttonText,
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xFF555555),
            ),
          ),
        ),
      ),
    );
  }
}
