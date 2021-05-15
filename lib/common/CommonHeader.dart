import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CommonAppbar(this.title, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(title),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Color(0xFF666666)),
            onPressed: () => Get.back()));
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
