import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/models/textFieldModel.dart';

class MemoTextField extends StatelessWidget {
  final double scrHeight;
  final TextFieldModel textFieldModel;
  final int maxLines;
  final int maxLength;
  final bool belowTextExist;

  MemoTextField({
    this.scrHeight,
    this.textFieldModel,
    this.maxLines,
    this.maxLength,
    this.belowTextExist,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 11),
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
              suffixIcon: textFieldModel.tec.text.isEmpty
                  ? Container(
                      width: 0,
                    )
                  : textFieldModel.errorOcur && !textFieldModel.canClear
                      ? Icon(Icons.error)
                      : IconButton(
                          onPressed: () {
                            textFieldModel.tec.text = '';
                          },
                          icon: SvgPicture.asset('assets/x.svg'),
                        ),
            ),
          ),
        ),
        // belowTextExist
        //     ?
        Column(
          children: [
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
        )
        // :
        //  SizedBox(
        //     height: 0,
        //   ),
      ],
    );
  }
}
