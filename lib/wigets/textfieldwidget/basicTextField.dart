import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/models/textFieldModel.dart';

class BasicTextField extends StatelessWidget {
  final double scrHeight;
  final TextFieldModel textFieldModel;

  BasicTextField({this.scrHeight, this.textFieldModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: textFieldModel.errorOcur
                  ? Color(0xFFEE1100)
                  : textFieldModel.fn.hasFocus
                      ? Color(0xFF3BD7E2)
                      : Color(0xFFDDDDDD),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.0197 * scrHeight,
            ),
            child: TextField(
              controller: textFieldModel.tec,
              focusNode: textFieldModel.fn,
              obscureText: textFieldModel.isPswd,
              decoration: InputDecoration(
                hintText: textFieldModel.hintText,
                hintStyle: TextStyle(
                  color: Color(0xFFAAAAAA),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                border: InputBorder.none,
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
        ),
        SizedBox(
          height: 0.0105 * scrHeight,
        ),
        Text(
          textFieldModel.errorMsg,
          style: TextStyle(
            color: textFieldModel.errorOcur
                ? Color(0xFFEE1100)
                : textFieldModel.fn.hasFocus
                    ? Color(0xFF3BD7E2)
                    : Color(0xFFDDDDDD),
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
