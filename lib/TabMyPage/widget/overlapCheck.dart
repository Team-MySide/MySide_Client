import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OverlapCheck extends StatelessWidget {
  final String headText;
  final String hintText;
  final String errorMsg;
  final Color errorColor;
  final Color focusedColor;
  final Color defocusedColor;
  final bool errorOccur;
  final bool canClear;
  final FocusNode focusNode;
  final TextEditingController textEC;
  final VoidCallback changeErrorFunc;
  final VoidCallback changeClearFunc;
  final VoidCallback checkOverlapFunc;

  OverlapCheck({
    @required this.headText,
    @required this.hintText,
    @required this.errorMsg,
    @required this.errorColor,
    @required this.focusedColor,
    @required this.defocusedColor,
    @required this.errorOccur,
    @required this.canClear,
    @required this.focusNode,
    @required this.textEC,
    @required this.changeErrorFunc,
    @required this.changeClearFunc,
    @required this.checkOverlapFunc,
  });

  @override
  Widget build(BuildContext context) {
    double scrHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: 0.0197 * scrHeight,
          ),
          child: Text(
            headText,
            style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(
          height: 0.0099 * scrHeight,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 0.0197 * scrHeight,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 0.05911 * scrHeight,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: errorOccur
                          ? errorColor
                          : focusNode.hasFocus
                              ? focusedColor
                              : defocusedColor,
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
                      controller: textEC,
                      focusNode: focusNode,
                      onChanged: (text) {
                        if (text == '') {
                          changeErrorFunc();
                        }
                        if (errorOccur && !canClear) {
                          changeClearFunc();
                        }
                      },
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
              ),
              SizedBox(
                width: 0.0099 * scrHeight,
              ),
              InkWell(
                onTap: checkOverlapFunc,
                child: Container(
                  height: 0.05911 * scrHeight,
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
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '중복확인',
                        style: TextStyle(
                          color: Color(0xFF3BD7E2),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 0.0099 * scrHeight,
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 0.0197 * scrHeight,
          ),
          child: Row(
            children: [
              Text(
                errorMsg,
                style: TextStyle(
                  color: errorOccur
                      ? errorColor
                      : focusNode.hasFocus
                          ? focusedColor
                          : Color(0xFFAAAAAA),
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
