import 'package:flutter/material.dart';

Widget buildProfileInfoTile(double scrHeight, String title, Widget tailWidget) {
  return Column(
    children: [
      Divider(
        thickness: 1.5,
      ),
      Container(
        padding: EdgeInsets.symmetric(
          vertical: 0.0211 * scrHeight,
          horizontal: 0.0211 * scrHeight,
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Color(0xFF111111),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            tailWidget,
          ],
        ),
      ),
    ],
  );
}
