import 'package:flutter/material.dart';

class SelectableRoundButton extends StatelessWidget {
  final String buttonText;
  final bool isSelected;
  final VoidCallback onTap;

  SelectableRoundButton({
    @required this.buttonText,
    @required this.isSelected,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF3BD7E2) : Color(0xFFF4F4F4),
        borderRadius: BorderRadius.all(
          Radius.circular(25),
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: isSelected ? Colors.white : Color(0xFF666666),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
