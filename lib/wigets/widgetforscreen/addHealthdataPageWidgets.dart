import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildDateSelector(double scrHeight, VoidCallback dateSelector,
    String dateText, int newOrEdit) {
  return InkWell(
    onTap: newOrEdit == 1 ? dateSelector : () {},
    child: Container(
      padding: EdgeInsets.symmetric(
          horizontal: 0.0211 * scrHeight, vertical: 0.0171 * scrHeight),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFDDDDDD),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        children: [
          Text(
            dateText,
            style: TextStyle(
              color: Color(0xFFAAAAAA),
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
          Spacer(),
          SvgPicture.asset('assets/calendar.svg'),
        ],
      ),
    ),
  );
}
