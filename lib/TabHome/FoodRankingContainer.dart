import 'package:flutter/material.dart';

class FoodRankingContainer extends StatelessWidget {
  const FoodRankingContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            height: 513,
            width: double.infinity,
            // constraints: BoxConstraints.expand(),
            child: Wrap(
              children: _getTop4FoodRankingList(),
            )));
  }

  _getTop4FoodRankingList() {
    return [FoodTile(), FoodTile(), FoodTile(), FoodTile()];
  }
}

class FoodTile extends StatelessWidget {
  const FoodTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163,
      height: 211,
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Icon(Icons.ac_unit)),
              Container(
                  width: 144,
                  height: 144,
                  child: Image.asset("./images/iconlogo.png"))
            ],
          ),
          Text("볶은땅콩"),
          Text("간암, 설포라판")
        ],
      ),
    );
  }
}
