import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:my_side_client/models/textFieldModel.dart';
import 'package:my_side_client/wigets/buttonwidget/selectableRoundButton.dart';

class CancerAutoCompleteWidget extends StatelessWidget {
  final double scrHeight;
  final TextFieldModel textFieldModel;
  final int cancerNum;
  final Function clicked;
  final Function getSuggestion;

  CancerAutoCompleteWidget({
    @required this.scrHeight,
    @required this.textFieldModel,
    @required this.cancerNum,
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
              height: 0.0632 * scrHeight,
              decoration: BoxDecoration(
                border: Border.all(
                  color: textFieldModel.errorOcur
                      ? Color(0xFFEE1100)
                      : textFieldModel.fn.hasFocus
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
                  height: 0.0632 * scrHeight,
                  width: 2.3 * 0.0632 * scrHeight,
                  child: SelectableRoundButton(
                    buttonText: '기타',
                    isSelected: textFieldModel.fn.hasFocus || cancerNum == 7,
                    onTap: clicked,
                  ),
                ),
                SizedBox(
                  width: 0.0105 * scrHeight,
                ),
                Expanded(
                  child: TypeAheadField<String>(
                    hideSuggestionsOnKeyboardHide: false,
                    suggestionsCallback: getSuggestion,
                    textFieldConfiguration: TextFieldConfiguration(
                      controller: textFieldModel.tec,
                      focusNode: textFieldModel.fn,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: textFieldModel.hintText,
                        hintStyle: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xFFAAAAAA),
                        ),
                      ),
                    ),
                    itemBuilder: (context, String suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                      );
                    },
                    noItemsFoundBuilder: (context) => Container(
                      height: 30,
                      child: Text(
                        '결과가 없습니다.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    onSuggestionSelected: (String suggestion) {
                      textFieldModel.tec.text = suggestion;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 0.0105 * scrHeight,
        ),
        Container(
          width: double.infinity,
          child: Text(
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
        ),
      ],
    );
  }
}
