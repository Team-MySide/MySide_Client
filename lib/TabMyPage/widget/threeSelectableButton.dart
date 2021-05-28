import 'package:flutter/material.dart';
import 'package:my_side_client/TabMyPage/widget/selectableButton.dart';

class ThreeSelectableButton extends StatelessWidget {
  final String firstButtonText;
  final String secondButtonText;
  final String thirdButtonText;
  final double scrHeight;
  final VoidCallback firstButtonClicked;
  final VoidCallback secondButtonClicked;
  final VoidCallback thirdButtonClicked;
  final bool isFirstSelected;
  final bool isSecondSelected;
  final bool isThirdSelected;

  ThreeSelectableButton({
    @required this.firstButtonText,
    @required this.secondButtonText,
    @required this.thirdButtonText,
    @required this.scrHeight,
    @required this.firstButtonClicked,
    @required this.secondButtonClicked,
    @required this.thirdButtonClicked,
    @required this.isFirstSelected,
    @required this.isSecondSelected,
    @required this.isThirdSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
        SizedBox(
          width: 0.0185 * scrHeight,
        ),
        Expanded(
          child: SelectableButton(
            buttonText: thirdButtonText,
            isSelected: isThirdSelected,
            scrHeight: scrHeight,
            clickedFunc: thirdButtonClicked,
          ),
        ),
      ],
    );
  }
}
