import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyTextWidget extends StatelessWidget {
  final double scrHeight;
  final bool errorOcur;
  final bool canClear;
  final FocusNode fn;
  final TextEditingController tec;
  final String hintText;
  final bool isPswd;

  MyTextWidget({
    @required this.scrHeight,
    @required this.errorOcur,
    @required this.canClear,
    @required this.fn,
    @required this.tec,
    @required this.hintText,
    @required this.isPswd,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 0.0197 * scrHeight,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: errorOcur
              ? Color(0xFFEE1100)
              : fn.hasFocus
                  ? Color(0xFF3BD7E2)
                  : Color(0xFFDDDDDD),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: TextField(
        controller: tec,
        focusNode: fn,
        obscureText: isPswd ? true : false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color(0xFFAAAAAA),
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
          border: InputBorder.none,
          suffixIcon: tec.text.isEmpty
              ? Container(
                  width: 0,
                )
              : errorOcur && !canClear
                  ? Icon(Icons.error)
                  : IconButton(
                      icon: SvgPicture.asset('assets/x.svg'),
                      onPressed: () {
                        tec.text = '';
                      },
                    ),
        ),
      ),
    );
  }
}
