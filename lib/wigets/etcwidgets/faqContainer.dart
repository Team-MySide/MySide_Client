import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FAQContainer extends StatelessWidget {
  final double scrHeight;
  final String headTitle;
  final String question;
  final String answer;
  final bool selected;
  final VoidCallback toggleFunc;

  FAQContainer({
    this.scrHeight,
    this.headTitle,
    this.question,
    this.answer,
    this.selected,
    this.toggleFunc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: toggleFunc,
          child: Container(
            color: selected ? Color(0xFF3BD7E2) : Color(0xFFF4F4F4),
            padding: EdgeInsets.all(
              0.0211 * scrHeight,
            ),
            child: Row(
              children: [
                Container(
                  width: scrHeight * 0.08,
                  padding: EdgeInsets.symmetric(
                    vertical: 0.01 * scrHeight,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      headTitle,
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Container(
                  width: 0.2943 * scrHeight,
                  child: Text(
                    question,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: selected ? Colors.white : Color(0xFF111111),
                    ),
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                selected
                    ? SvgPicture.asset('assets/arrowup.svg')
                    : SvgPicture.asset('assets/arrowdown.svg'),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 0.0052 * scrHeight,
        ),
        selected
            ? Container(
                padding: EdgeInsets.all(
                  0.0211 * scrHeight,
                ),
                child: Text(
                  answer,
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              )
            : SizedBox(
                height: 0,
              ),
      ],
    );
  }
}
