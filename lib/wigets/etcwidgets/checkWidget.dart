import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckWidget extends StatelessWidget {
  final bool checked;
  final String checkText;
  final double scrHeight;
  final VoidCallback checkClicked;

  CheckWidget({
    @required this.checked,
    @required this.checkText,
    @required this.scrHeight,
    @required this.checkClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (checked)
          InkWell(
            onTap: checkClicked,
            child: SvgPicture.asset('assets/checkedoff.svg'),
          )
        else
          InkWell(
            onTap: checkClicked,
            child: SvgPicture.asset('assets/off.svg'),
          ),
        SizedBox(
          width: 0.0099 * scrHeight,
        ),
        Text(
          checkText,
          style: TextStyle(
            color: Color(0xFF666666),
            fontWeight: FontWeight.w300,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
