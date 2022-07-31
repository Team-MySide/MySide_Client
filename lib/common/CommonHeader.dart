import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  Color backgroundColor;
  List<Widget> actions;
  CommonAppbar(this.title, {this.backgroundColor, this.actions, Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title,
            style: TextStyle(
                fontSize: 16,
                color: backgroundColor == null
                    ? Color(0xFF111111)
                    : Colors.white)),
        backgroundColor: backgroundColor ?? Colors.white,
        elevation: 0,
        centerTitle: true,
        actions: actions,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF666666)),
            onPressed: () => Get.back()));
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
