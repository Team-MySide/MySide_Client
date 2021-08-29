import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/models/textFieldModel.dart';

class ButtonTextField extends StatelessWidget {
  final double scrHeight;
  final TextFieldModel textFieldModel;
  final String buttonText;
  final VoidCallback valFunc;

  ButtonTextField({
    @required this.scrHeight,
    @required this.textFieldModel,
    @required this.buttonText,
    @required this.valFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
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
            ),
            SizedBox(
              width: 0.0105 * scrHeight,
            ),
            InkWell(
              onTap: valFunc,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xFF3BD7E2),
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.0246 * scrHeight,
                    vertical: 0.0185 * scrHeight,
                  ),
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: Color(0xFF3BD7E2),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
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
