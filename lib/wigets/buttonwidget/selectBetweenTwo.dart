import 'package:flutter/material.dart';
import 'package:my_side_client/wigets/buttonwidget/selectableRoundButton.dart';

class SelectBetweenTwo extends StatelessWidget {
  final double scrHeight;
  final int ind;
  final Function selectFunc;
  final String firstOption;
  final String secondOption;

  SelectBetweenTwo({
    this.scrHeight,
    this.ind,
    this.selectFunc,
    this.firstOption,
    this.secondOption,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 0.0632 * scrHeight,
            child: SelectableRoundButton(
              buttonText: firstOption,
              isSelected: ind == 1,
              onTap: () {
                selectFunc(1);
              },
            ),
          ),
        ),
        SizedBox(
          width: 0.0198 * scrHeight,
        ),
        Expanded(
          child: Container(
            height: 0.0632 * scrHeight,
            child: SelectableRoundButton(
              buttonText: secondOption,
              isSelected: ind == 2,
              onTap: () {
                selectFunc(2);
              },
            ),
          ),
        ),
      ],
    );
  }
}
