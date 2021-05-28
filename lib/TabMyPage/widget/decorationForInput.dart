import 'package:flutter/material.dart';

class DecorationForInput extends StatelessWidget {
  final Widget childWidget;
  final double scrHeight;
  final double vertPadding;
  final Color borderColor;

  DecorationForInput({
    @required this.childWidget,
    @required this.scrHeight,
    @required this.vertPadding,
    @required this.borderColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.0185 * scrHeight,
        vertical: vertPadding * scrHeight,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: childWidget,
    );
  }
}
