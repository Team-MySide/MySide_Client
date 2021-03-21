import 'package:flutter/material.dart';

class DiseaseRankingContainer extends StatefulWidget {
  const DiseaseRankingContainer({Key key}) : super(key: key);

  @override
  _DiseaseRankingContainerState createState() =>
      _DiseaseRankingContainerState();
}

class _DiseaseRankingContainerState extends State<DiseaseRankingContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 196,
        child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return DiseaseRankingTile();
            }));
  }
}

class DiseaseRankingTile extends StatelessWidget {
  const DiseaseRankingTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Stack(
        children: [
          Padding(child: Icon(Icons.one_k), padding: EdgeInsets.only(left: 20)),
          Container(
              width: 142,
              height: 196,
              child: Image.asset("images/iconlogo.png"))
        ],
      ),
      Container(
        width: 142,
        height: 196,
        child: Column(
          children: [
            Text("견과류를 이용한 고칼로리 항암 음식 '잣땅콩죽'"),
            Padding(padding: EdgeInsets.all(10), child: Text("#위암, #단백질, #지방")),
            Expanded(
                child: Align(
                    alignment: Alignment.bottomLeft, child: Text("위암 비타민E")))
          ],
        ),
      )
    ]);
  }
}
