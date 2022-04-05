import 'package:flutter/material.dart';

class SecondStagePageNumber extends StatelessWidget {
  final int pageNum;
  final double scrHeight;
  SecondStagePageNumber({
    this.pageNum,
    this.scrHeight,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF31B6F7),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 0.0296 * scrHeight,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 0.026 * scrHeight,
            width: 0.026 * scrHeight,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              color: pageNum == 1
                  ? Colors.white
                  : Color.fromRGBO(255, 255, 255, 0),
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: pageNum == 1 ? Color(0xFF31B6F7) : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 0.015 * scrHeight,
            child: Divider(
              color: Colors.white,
              thickness: 1.5,
            ),
          ),
          Container(
            height: 0.026 * scrHeight,
            width: 0.026 * scrHeight,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
              ),
              color: pageNum == 2
                  ? Colors.white
                  : Color.fromRGBO(255, 255, 255, 0),
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '2',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: pageNum == 2 ? Color(0xFF31B6F7) : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
