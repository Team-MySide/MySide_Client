import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onTap;
  SkipButton({@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
        child: Text(
          '건너뛰기',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
