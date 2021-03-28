import 'package:flutter/material.dart';

class AdContainer extends StatelessWidget {
  List<Map> items = [
    {
      "title": "한국의 6대암에 대해 알아보세요!",
      "content": "암 정보를 확인하실 수 있습니다",
      "path": "images/ad1.png"
    }
  ];
  AdContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 46),
        child: Container(
            height: 152,
            width: double.infinity,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return AdTile(items[index]);
                })));
  }
}

class AdTile extends StatelessWidget {
  final Map item;
  const AdTile(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      FittedBox(child: Image.asset(item['path'], fit: BoxFit.fitWidth)),
      Padding(
        padding: EdgeInsets.only(left: 24, top: 32),
        child: SizedBox(
          width: 128,
          height: 100,
          child: Column(
            children: [
              Text(item['title'],
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 18)),
              Text(item['content'],
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 12))
            ],
          ),
        ),
      ),
    ]);
  }
}
