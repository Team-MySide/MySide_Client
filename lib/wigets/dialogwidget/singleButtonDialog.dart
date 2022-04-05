import 'package:flutter/material.dart';
import 'package:my_side_client/wigets/buttonwidget/longRoundButton.dart';

class SingleButtonDialog extends StatelessWidget {
  final Widget widgetBetween;
  final double dialogHeight;
  final VoidCallback routeFunc;

  SingleButtonDialog({
    this.widgetBetween,
    this.dialogHeight,
    this.routeFunc,
  });

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    double scrWidth = MediaQuery.of(context).size.width;
    return Dialog(
      child: Container(
        width: scrWidth * 0.9147,
        height: dialogHeight,
        padding: EdgeInsets.symmetric(
          horizontal: 0.064 * scrWidth,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          children: [
            Spacer(),
            widgetBetween,
            Spacer(),
            LongRoundButton(
              buttonText: '확인',
              scrHeight: scrHeight,
              activated: true,
              validateFunc: routeFunc,
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
