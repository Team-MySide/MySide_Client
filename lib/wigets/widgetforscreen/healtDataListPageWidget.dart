import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildYearSelector(double scrHeight, String curYear,
    VoidCallback onTapLeft, VoidCallback onTapRight, String rightArrow) {
  return Center(
    child: Container(
      width: scrHeight * 0.2938,
      padding: EdgeInsets.symmetric(
        horizontal: 0.0316 * scrHeight,
        vertical: 0.0105 * scrHeight,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: Row(
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTapLeft,
              child: SvgPicture.asset('assets/arrowleft.svg'),
            ),
          ),
          Spacer(),
          Text(
            curYear,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF111111),
              fontFamily: 'Metropolis',
            ),
          ),
          Spacer(),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTapRight,
              child: SvgPicture.asset(rightArrow),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildMonthSelector(double scrHeight, List<String> monthList,
    int curMonth, Function selectMonth) {
  return Container(
    height: 0.0448 * scrHeight,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: monthList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 0.0659 * scrHeight,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  selectMonth(index);
                },
                child: Text(
                  monthList[index],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: curMonth == index
                        ? Color(0xFF3BD7E2)
                        : Color(0xFFAAAAAA),
                  ),
                ),
              ),
              SizedBox(
                height: 0.0105 * scrHeight,
              ),
              Container(
                color: Color(0xFFDDDDDD),
                height: 1,
              ),
            ],
          ),
        );
      },
    ),
  );
}
