import 'package:flutter/material.dart';

import 'longRoundButton.dart';

class SelectBetweenTwo extends StatelessWidget {
  final double scrHeight;
  final String firstText;
  final String secondText;
  final bool firstSelected;
  final bool secondSelected;
  final VoidCallback firstClicked;
  final VoidCallback secondClicked;

  SelectBetweenTwo({
    @required this.scrHeight,
    @required this.firstText,
    @required this.secondText,
    @required this.firstSelected,
    @required this.secondSelected,
    @required this.firstClicked,
    @required this.secondClicked,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: LongRoundButton(
            buttonText: firstText,
            scrHeight: scrHeight,
            activated: firstSelected,
            validateFunc: firstClicked,
            deactivatedTextColor: Color(0xFF666666),
          ),
        ),
        SizedBox(
          width: 0.0197 * scrHeight,
        ),
        Expanded(
          child: LongRoundButton(
            buttonText: secondText,
            scrHeight: scrHeight,
            activated: secondSelected,
            validateFunc: secondClicked,
            deactivatedTextColor: Color(0xFF666666),
          ),
        ),
      ],
    );
  }
}
