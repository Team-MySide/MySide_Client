import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BuildSettingTile extends StatelessWidget {
  final String svgPath;
  final String tileText;
  final double scrHeight;
  final VoidCallback onTap;

  BuildSettingTile({
    @required this.svgPath,
    @required this.tileText,
    @required this.scrHeight,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 0.0616 * scrHeight,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 0.0197 * scrHeight,
              ),
              child: Row(
                children: [
                  SvgPicture.asset(svgPath),
                  Spacer(),
                  Container(
                    width: 0.38 * scrHeight,
                    child: Text(
                      tileText,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF111111),
                      ),
                    ),
                  ),
                  Spacer(),
                  SvgPicture.asset('assets/arrowright.svg'),
                ],
              ),
            ),
          ),
        ),
        Divider(
          thickness: 1,
          color: Color(0xFFDDDDDD),
        ),
      ],
    );
  }
}
