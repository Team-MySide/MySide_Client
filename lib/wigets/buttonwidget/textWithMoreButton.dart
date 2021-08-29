import 'package:flutter/material.dart';

class TextWithMoreButton extends StatelessWidget {
  final String titleText;
  final VoidCallback onTap;

  TextWithMoreButton({
    @required this.titleText,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titleText,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              child: Text(
                '더보기 +',
                style: TextStyle(
                  color: Color(0xFF666666),
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
