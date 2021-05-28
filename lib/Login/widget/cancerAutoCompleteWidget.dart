import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class CancerAutoCompleteWidget extends StatelessWidget {
  final double scrHeight;
  final bool errorText;
  final FocusNode fn;
  final TextEditingController tec;
  final int cancerNum;
  final String errorMsg;
  final Function clicked;
  final Function getSuggestion;

  CancerAutoCompleteWidget({
    @required this.scrHeight,
    @required this.errorText,
    @required this.fn,
    @required this.tec,
    @required this.cancerNum,
    @required this.errorMsg,
    @required this.clicked,
    @required this.getSuggestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 0.067 * scrHeight,
              decoration: BoxDecoration(
                border: Border.all(
                  color: errorText
                      ? Color(0xFFEE1100)
                      : fn.hasFocus
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
                InkWell(
                  onTap: clicked,
                  child: Container(
                    width: 0.146 * scrHeight,
                    padding: EdgeInsets.symmetric(
                      vertical: 0.0185 * scrHeight,
                    ),
                    decoration: BoxDecoration(
                      color: fn.hasFocus || cancerNum == 7
                          ? Color(0xFF3BD7E2)
                          : Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '기타',
                        style: TextStyle(
                          color:
                              cancerNum == 7 ? Colors.white : Color(0xFF666666),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 0.0099 * scrHeight,
                ),
                Expanded(
                  child: TypeAheadField<String>(
                    hideSuggestionsOnKeyboardHide: false,
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: tec,
                      focusNode: fn,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '암 종류를 입력해주세요',
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFFAAAAAA),
                        ),
                      ),
                    ),
                    suggestionsCallback: getSuggestion,
                    itemBuilder: (context, String suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                      );
                    },
                    noItemsFoundBuilder: (context) => Container(
                      height: 30,
                      child: Text(
                        '음식이 없습니다.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    onSuggestionSelected: (String suggestion) {
                      tec.text = suggestion;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 0.0099 * scrHeight,
        ),
        Container(
          width: double.infinity,
          child: Text(
            errorMsg,
            style: TextStyle(
              color: errorText
                  ? Color(0xFFEE1100)
                  : fn.hasFocus
                      ? Color(0xFF3BD7E2)
                      : Color(0xFFDDDDDD),
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
