import 'package:flutter/material.dart';
import 'package:my_side_client/wigets/buttonwidget/iconButtonWidget.dart';
import 'package:my_side_client/wigets/textwidget/whiteRoundTextWidget.dart';

Widget buildNameandNicknameRow(String name, String nickname) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    textBaseline: TextBaseline.alphabetic,
    crossAxisAlignment: CrossAxisAlignment.baseline,
    children: [
      Text(
        '$name님',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      Text(
        '($nickname 환우)',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
    ],
  );
}

Widget buildhashUserInfo(double scrHeight, String cancelNm, String stageNm,
    String progressNm, String diseaseNm) {
  return Wrap(
    runSpacing: 0.0105 * scrHeight,
    children: [
      WhiteRountTextWidget(textInside: '#$cancelNm'),
      SizedBox(
        width: 0.0105 * scrHeight,
      ),
      WhiteRountTextWidget(textInside: '#$stageNm'),
      SizedBox(
        width: 0.0105 * scrHeight,
      ),
      WhiteRountTextWidget(textInside: '#$progressNm'),
      SizedBox(
        width: 0.0105 * scrHeight,
      ),
      WhiteRountTextWidget(textInside: '#$diseaseNm'),
    ],
  );
}

Widget buildIconButtons(List<String> iconText, List<String> iconName,
    List<VoidCallback> onTapFuncs, double scrHeight) {
  return Row(
    children: [
      IconButtonWidget(
        scrHeight: scrHeight,
        iconImageNm: iconName[0],
        iconText: iconText[0],
        onTap: onTapFuncs[0],
      ),
      Spacer(),
      IconButtonWidget(
        scrHeight: scrHeight,
        iconImageNm: iconName[1],
        iconText: iconText[1],
        onTap: onTapFuncs[1],
      ),
      Spacer(),
      IconButtonWidget(
        scrHeight: scrHeight,
        iconImageNm: iconName[2],
        iconText: iconText[2],
        onTap: onTapFuncs[2],
      ),
    ],
  );
}
