import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/TabMyPage/widget/smallRoundButton.dart';

import 'modifyRoundButton.dart';

class HealthDataContainer extends StatelessWidget {
  final String dateText;
  final String cancerNm;
  final String stageNm;
  final String statusNm;
  final String diseaseNm;
  final int height;
  final int weight;
  final String memoText;
  final int modifiedNum;
  final double scrHeight;
  final VoidCallback onDelete;
  final VoidCallback onUpdated;

  HealthDataContainer({
    @required this.dateText,
    @required this.cancerNm,
    @required this.stageNm,
    @required this.statusNm,
    @required this.diseaseNm,
    @required this.height,
    @required this.weight,
    @required this.memoText,
    @required this.modifiedNum,
    @required this.scrHeight,
    @required this.onDelete,
    @required this.onUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        child: IntrinsicHeight(
          child: Row(
            children: [
              Column(
                children: [
                  SvgPicture.asset(
                    'assets/time.svg',
                  ),
                  Expanded(
                    child: Container(
                      width: 1,
                      color: Color(0xFFDDDDDD),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 0.0123 * scrHeight,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        dateText,
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontFamily: 'Metropolis',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 0.1724 * scrHeight,
                      ),
                      SmallRoundButton(
                        buttonText: '삭제',
                        onTap: onDelete,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SmallRoundButton(
                        buttonText: '편집',
                        onTap: onUpdated,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.0111 * scrHeight,
                  ),
                  Container(
                    width: 0.38 * scrHeight,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 0.0357 * scrHeight,
                        vertical: 0.0296 * scrHeight,
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ModifyRoundButton(
                                  buttonText: cancerNm,
                                  modified: modifiedNum == 0,
                                  scrHeight: scrHeight,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                ModifyRoundButton(
                                  buttonText: stageNm,
                                  modified: modifiedNum == 1,
                                  scrHeight: scrHeight,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                ModifyRoundButton(
                                  buttonText: statusNm,
                                  modified: modifiedNum == 2,
                                  scrHeight: scrHeight,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                ModifyRoundButton(
                                  buttonText: diseaseNm,
                                  modified: modifiedNum == 3,
                                  scrHeight: scrHeight,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                ModifyRoundButton(
                                  buttonText: '${weight.toString()}kg',
                                  modified: modifiedNum == 4,
                                  scrHeight: scrHeight,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                ModifyRoundButton(
                                  buttonText: '${height.toString()}cm',
                                  modified: modifiedNum == 5,
                                  scrHeight: scrHeight,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              memoText,
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
