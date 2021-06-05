import 'package:flutter/material.dart';

class NoSearchResult extends StatelessWidget {
  NoSearchResult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 193),
          Text('앗...😓',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          Text('검색 결과가 없어요!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 16,
          ),
          Text(content1,
              style: TextStyle(fontSize: 14, color: Color(0xFF666666))),
          Text(content2,
              style: TextStyle(fontSize: 14, color: Color(0xFF666666))),
          Text(content3,
              style: TextStyle(fontSize: 14, color: Color(0xFF666666))),
          SizedBox(height: 40),
          GestureDetector(child: Text('문의하러 가기'), onTap: () {}),
        ],
      ),
    );
  }

  final String content1 = '정확한 명칭을 검색했는데 안나온다구요?';
  final String content2 = "검색한 음식 또는 성분이 궁금하다면";
  final String content3 = '이웃집닥터에게 문의해주세요.';
}
