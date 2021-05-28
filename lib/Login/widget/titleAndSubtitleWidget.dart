import 'package:flutter/material.dart';

class TitleAndSubtitleWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final double scrHeight;

  TitleAndSubtitleWidget({
    @required this.title,
    @required this.subTitle,
    @required this.scrHeight,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Text(
            title,
            style: TextStyle(
              color: Color(0xFF111111),
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: 0.0099 * scrHeight,
        ),
        Container(
          width: double.infinity,
          child: Text(
            subTitle,
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
