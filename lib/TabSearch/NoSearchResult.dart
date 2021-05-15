import 'package:flutter/material.dart';

class NoSearchResult extends StatelessWidget {
  NoSearchResult({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text('앗...😓'),
          Text('검색 결과가 없어요!'),
          SizedBox(
            height: 16,
          ),
          Text(content),
          SizedBox(height: 40),
          GestureDetector(child: Text('문의하러 가기'), onTap: () {}),
        ],
      ),
    );
  }

  String content = '정확한 명칭을 검색했는데 안나온다구요?\n검색한 음식 또는 성분이 궁금하다면이웃집닥터에게 문의해주세요.';
}
