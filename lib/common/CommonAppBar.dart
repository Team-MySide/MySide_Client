import 'package:flutter/material.dart';

class CommonAppBarVer2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CommonAppBarVer2({
    @required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: Color(0xFF111111),
          fontSize: 16,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
