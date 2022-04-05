import 'package:flutter/material.dart';
import 'package:my_side_client/wigets/textwidget/requiredText.dart';

class BuildInfoInputField extends StatelessWidget {
  final double scrHeight;
  final String title;
  final Widget widgetForBuild;
  final bool isRequired;
  final bool isTextField;

  BuildInfoInputField({
    this.scrHeight,
    this.title,
    this.widgetForBuild,
    this.isRequired,
    this.isTextField,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RequiredTextWidget(
          mainText: title,
          isRequired: isRequired,
        ),
        SizedBox(
          height: 0.0105 * scrHeight,
        ),
        widgetForBuild,
        SizedBox(
          height: isTextField ? 0.01 * scrHeight : 0.03 * scrHeight,
        ),
      ],
    );
  }
}
