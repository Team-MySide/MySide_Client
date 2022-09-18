import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/models/textFieldModel.dart';

class HalfWidthTextField extends StatelessWidget {
  final double scrHeight;
  final TextFieldModel textFieldModel;
  final String tailText;
  TextInputType textInputType;

  HalfWidthTextField(
      {this.scrHeight,
      this.textFieldModel,
      this.tailText,
      this.textInputType = TextInputType.text});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 0.19 * scrHeight,
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
                  keyboardType: textInputType,
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
              width: 0.0105 * scrHeight,
            ),
            Text(
              tailText,
              style: TextStyle(
                color: Color(0xFF111111),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
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
