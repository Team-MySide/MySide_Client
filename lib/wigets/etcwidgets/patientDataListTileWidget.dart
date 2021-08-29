import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/models/healthDataListModel.dart';
import 'package:my_side_client/wigets/buttonwidget/smallRoundButton.dart';
import 'package:my_side_client/wigets/etcwidgets/roundPersonalInfo.dart';

class PatientDataListTileWidget extends StatelessWidget {
  final double scrHeight;
  final HealthData healthData;
  final VoidCallback onDelete;
  final VoidCallback onUpdated;

  PatientDataListTileWidget({
    @required this.scrHeight,
    @required this.healthData,
    @required this.onDelete,
    @required this.onUpdated,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
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
              ),
            ],
          ),
          SizedBox(
            width: 0.0211 * scrHeight,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      healthData.regiDate,
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontFamily: 'Metropolis',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    SmallRoundButton(
                      scrHeight: scrHeight,
                      buttonText: '삭제',
                      onTap: onDelete,
                    ),
                    SizedBox(
                      width: 0.0105 * scrHeight,
                    ),
                    SmallRoundButton(
                      scrHeight: scrHeight,
                      buttonText: '편집',
                      onTap: onUpdated,
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.0105 * scrHeight,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(0.0316 * scrHeight),
                  decoration: BoxDecoration(
                    color: Color(0xFFF4F4F4),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        runSpacing: 0.0105 * scrHeight,
                        children: [
                          RoundPersonalInfo(
                            buttonText: healthData.cancerNm,
                            scrHeight: scrHeight,
                          ),
                          SizedBox(
                            width: 0.0105 * scrHeight,
                          ),
                          RoundPersonalInfo(
                            buttonText: healthData.stageNm,
                            scrHeight: scrHeight,
                          ),
                          SizedBox(
                            width: 0.0105 * scrHeight,
                          ),
                          RoundPersonalInfo(
                            buttonText: healthData.progressNm,
                            scrHeight: scrHeight,
                          ),
                          SizedBox(
                            width: 0.0105 * scrHeight,
                          ),
                          RoundPersonalInfo(
                            buttonText: healthData.disease,
                            scrHeight: scrHeight,
                          ),
                          SizedBox(
                            width: 0.0105 * scrHeight,
                          ),
                          RoundPersonalInfo(
                            buttonText: '${healthData.weight}kg',
                            scrHeight: scrHeight,
                          ),
                          SizedBox(
                            width: 0.0105 * scrHeight,
                          ),
                          RoundPersonalInfo(
                            buttonText: '${healthData.height}cm',
                            scrHeight: scrHeight,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.0211 * scrHeight,
                      ),
                      Text(
                        healthData.memo,
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 0.0422 * scrHeight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
