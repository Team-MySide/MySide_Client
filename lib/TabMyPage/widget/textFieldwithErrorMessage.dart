import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TextWidgetWithErrorMessage extends StatelessWidget {
  final double scrHeight;
  final bool errorOccur;
  final bool canClear;
  final FocusNode focusNode;
  final TextEditingController textEC;
  final VoidCallback changeErrorFunc;
  final VoidCallback changeClearFunc;
  final bool isPswd;
  final String hintText;
  final String errorMsg;
  final Color deactiveColor;
  final Color activeColor;
  final Color errorColor;

  TextWidgetWithErrorMessage({
    @required this.scrHeight,
    @required this.errorOccur,
    @required this.canClear,
    @required this.focusNode,
    @required this.textEC,
    @required this.changeErrorFunc,
    @required this.changeClearFunc,
    @required this.isPswd,
    @required this.hintText,
    @required this.errorMsg,
    @required this.deactiveColor,
    @required this.activeColor,
    @required this.errorColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 0.05911 * scrHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: errorOccur
                  ? errorColor
                  : focusNode.hasFocus
                      ? Color(0xFF3BD7E2)
                      : Color(0xFFDDDDDD),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 0.0172 * scrHeight,
            ),
            child: TextField(
              onChanged: (text) {
                if (text == '') {
                  changeErrorFunc();
                }
                if (errorOccur && !canClear) {
                  changeClearFunc();
                }
              },
              focusNode: focusNode,
              controller: textEC,
              obscureText: isPswd ? true : false,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xFFAAAAAA),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                border: InputBorder.none,
                suffixIcon: textEC.text.isEmpty
                    ? Container(
                        width: 0,
                      )
                    : errorOccur && !canClear
                        ? Icon(Icons.error)
                        : IconButton(
                            icon: SvgPicture.asset('assets/x.svg'),
                            onPressed: () {
                              textEC.text = '';
                              changeErrorFunc();
                            },
                          ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 0.0099 * scrHeight,
        ),
        Container(
          child: Row(
            children: [
              Text(
                errorMsg,
                style: TextStyle(
                  color: errorOccur
                      ? errorColor
                      : focusNode.hasFocus
                          ? activeColor
                          : deactiveColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
