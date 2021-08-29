import 'package:flutter/material.dart';
import 'package:my_side_client/models/textFieldModel.dart';

class MemoTextField extends StatelessWidget {
  final double scrHeight;
  final TextFieldModel textFieldModel;
  final int maxLines;
  final int maxLength;

  MemoTextField({
    @required this.scrHeight,
    @required this.textFieldModel,
    this.maxLines,
    this.maxLength,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 0.0197 * scrHeight),
          decoration: BoxDecoration(
            border: Border.all(
              color: textFieldModel.fn.hasFocus
                  ? Color(0xFF3BD7E2)
                  : Color(0xFFDDDDDD),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: TextField(
            maxLines: maxLines ?? 3,
            maxLength: maxLength ?? null,
            controller: textFieldModel.tec,
            focusNode: textFieldModel.fn,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: textFieldModel.hintText,
              hintStyle: TextStyle(
                color: Color(0xFFAAAAAA),
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 0.0105 * scrHeight,
        ),
        Text(
          textFieldModel.errorMsg,
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12,
            color: textFieldModel.fn.hasFocus
                ? Color(0xFF3BD7E2)
                : Color(0xFFAAAAAA),
          ),
        ),
      ],
    );
  }
}
