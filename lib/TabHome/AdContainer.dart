import 'package:flutter/material.dart';

class AdContainer extends StatelessWidget {
  List<Map> items = [
    {
      "title": "한국의 6대암에 대해 알아보세요!",
      "content": "암 정보를 확인하실 수 있습니다",
      "path": "images/food1.png"
    }
  ];
  AdContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      return AdTile(items[index]);
    });
  }
}

class AdTile extends StatelessWidget {
  final Map item;
  const AdTile(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // child: child,
        );
  }
}
