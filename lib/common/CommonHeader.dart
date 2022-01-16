import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  Color backgroundColor;
  CommonAppbar(this.title, {this.backgroundColor, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title,
            style: TextStyle(fontSize: 16, color: Color(0xFF111111))),
        backgroundColor: backgroundColor ?? Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF666666)),
            onPressed: () => Get.back()));
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
