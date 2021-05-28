import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/TabMyPage/widget/selectableButton.dart';

class CancerInput extends StatelessWidget {
  final double scrHeight;
  final String buttonText;
  final TextEditingController tec;
  final FocusNode focus;
  final VoidCallback buttonClicked;
  final bool errorOccur;
  final bool canClear;
  final VoidCallback clearClicked;
  final VoidCallback clearChange;
  CancerInput({
    @required this.scrHeight,
    @required this.buttonText,
    @required this.tec,
    @required this.focus,
    @required this.buttonClicked,
    @required this.errorOccur,
    @required this.canClear,
    @required this.clearClicked,
    @required this.clearChange,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 0.063 * scrHeight,
          decoration: BoxDecoration(
            border: Border.all(
              color: errorOccur
                  ? Color(0xFFEE1100)
                  : focus.hasFocus
                      ? Color(0xFF3BD7E2)
                      : Color(0xFFDDDDDD),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              width: 0.146 * scrHeight,
              child: SelectableButton(
                buttonText: buttonText,
                isSelected: focus.hasFocus || tec.text.isNotEmpty,
                scrHeight: scrHeight,
                clickedFunc: buttonClicked,
              ),
            ),
            SizedBox(
              width: 0.0099 * scrHeight,
            ),
            Expanded(
              child: TextField(
                controller: tec,
                focusNode: focus,
                onChanged: (text) {
                  if (text == '') {
                    clearClicked();
                    clearChange();
                  }
                  if (errorOccur && !canClear) {
                    clearChange();
                  }
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '암 종류를 입력해주세요.',
                  hintStyle: TextStyle(
                    color: Color(0xFFAAAAAA),
                    fontWeight: FontWeight.w300,
                    fontSize: 16,
                  ),
                  suffixIcon: tec.text.isEmpty
                      ? Container(
                          width: 0,
                        )
                      : errorOccur && !canClear
                          ? Icon(Icons.error)
                          : IconButton(
                              icon: SvgPicture.asset('assets/x.svg'),
                              onPressed: () {
                                tec.text = '';
                                clearClicked();
                              },
                            ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
