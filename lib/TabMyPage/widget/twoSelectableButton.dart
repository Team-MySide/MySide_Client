import 'package:flutter/material.dart';
import 'package:my_side_client/TabMyPage/widget/selectableButton.dart';

class TwoSelectableButton extends StatelessWidget {
  final String mainText;
  final String firstButtonText;
  final String secondButtonText;
  final double scrHeight;
  final VoidCallback firstButtonClicked;
  final VoidCallback secondButtonClicked;
  final bool isFirstSelected;
  final bool isSecondSelected;

  TwoSelectableButton({
    @required this.mainText,
    @required this.firstButtonText,
    @required this.secondButtonText,
    @required this.scrHeight,
    @required this.firstButtonClicked,
    @required this.secondButtonClicked,
    @required this.isFirstSelected,
    @required this.isSecondSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: mainText,
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
                TextSpan(
                  text: '*',
                  style: TextStyle(
                    color: Color(0xFFEE1100),
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 0.0099 * scrHeight,
        ),
        Row(
          children: [
            Expanded(
              child: SelectableButton(
                buttonText: firstButtonText,
                isSelected: isFirstSelected,
                scrHeight: scrHeight,
                clickedFunc: firstButtonClicked,
              ),
            ),
            SizedBox(
              width: 0.0185 * scrHeight,
            ),
            Expanded(
              child: SelectableButton(
                buttonText: secondButtonText,
                isSelected: isSecondSelected,
                scrHeight: scrHeight,
                clickedFunc: secondButtonClicked,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
