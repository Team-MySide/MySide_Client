import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyPageMainIconButton extends StatelessWidget {
  final double scrHeight;
  final String iconImageNm;
  final String iconText;
  final VoidCallback onTap;

  MyPageMainIconButton({
    @required this.scrHeight,
    @required this.iconImageNm,
    @required this.iconText,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFDDDDDD),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.0228 * scrHeight,
              vertical: 0.0203 * scrHeight,
            ),
            child: Column(
              children: [
                SvgPicture.asset(iconImageNm),
                SizedBox(
                  height: 0.0148 * scrHeight,
                ),
                Text(
                  iconText,
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
