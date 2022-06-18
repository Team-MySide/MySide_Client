import 'package:flutter/material.dart';
import 'package:my_side_client/wigets/buttonwidget/longRoundButton.dart';

class SingleButtonDialog extends StatelessWidget {
  final Widget widgetBetween;
  final double dialogHeight;
  final VoidCallback routeFunc;
  final CrossAxisAlignment crossAxisAlignment;

  SingleButtonDialog({
    this.widgetBetween,
    this.dialogHeight,
    this.routeFunc,
    this.crossAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    double scrWidth = MediaQuery.of(context).size.width;
    return Dialog(
      child: Container(
        width: scrWidth * 0.9147,
        height: dialogHeight,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
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
