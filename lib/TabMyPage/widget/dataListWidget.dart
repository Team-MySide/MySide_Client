import 'package:flutter/material.dart';

import 'healthDataContainer.dart';

class DataListWidget extends StatelessWidget {
  final int dataNum;
  final double scrHeight;
  final bool isMain;
  final VoidCallback onTap;

  DataListWidget({
    @required this.dataNum,
    @required this.scrHeight,
    @required this.isMain,
    @required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return dataNum < 1
        ? Column(
            children: [
              SizedBox(
                height: 0.1933 * scrHeight,
              ),
              InkWell(
                child: Image.asset(
                  'assets/plus.png',
                  height: 62,
                  width: 62,
                ),
                onTap: onTap,
              ),
              SizedBox(
                height: 0.0493 * scrHeight,
              ),
              Text(
                '어떤 변화가 있었나요?',
                style: TextStyle(
                  color: Color(0xFF111111),
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: '필요한 정보를',
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    TextSpan(
                      text: ' 기록',
                      style: TextStyle(
                        color: Color(0xFF3BD7E2),
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                    TextSpan(
                      text: '해보세요.',
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        : Column(
            children: [
              isMain
                  ? SizedBox(
                      height: 0.0246 * scrHeight,
                    )
                  : Column(
                      children: [
                        SizedBox(
                          height: 0.0493 * scrHeight,
                        ),
                        InkWell(
                          child: Image.asset(
                            'assets/plus.png',
                            height: 0.0493 * scrHeight,
                            width: 0.0493 * scrHeight,
                          ),
                          onTap: onTap,
                        ),
                        SizedBox(
                          height: 0.0493 * scrHeight,
                        ),
                      ],
                    ),
              HealthDataContainer(
                dateText: '21.06.14',
                cancerNm: '위암',
                stageNm: '3기',
                statusNm: '항암중',
                diseaseNm: '고혈압',
                weight: 76,
                height: 180,
                memoText:
                    '텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트',
                modifiedNum: 3,
                scrHeight: scrHeight,
              ),
              HealthDataContainer(
                dateText: '21.06.14',
                cancerNm: '위암',
                stageNm: '3기',
                statusNm: '항암중',
                diseaseNm: '고혈압',
                weight: 76,
                height: 180,
                memoText: '텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 ',
                modifiedNum: 3,
                scrHeight: scrHeight,
              ),
              HealthDataContainer(
                dateText: '21.06.14',
                cancerNm: '위암',
                stageNm: '3기',
                statusNm: '항암중',
                diseaseNm: '고혈압',
                weight: 76,
                height: 180,
                memoText: '텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트 텍스트',
                modifiedNum: 3,
                scrHeight: scrHeight,
              ),
            ],
          );
  }
}
