import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_side_client/TabRecipe/RecipeOutPop.dart';

class RegisterRecipeAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  RegisterRecipeAppBar({
    this.title,
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
      leading: IconButton(
          icon: SvgPicture.asset('assets/arrow.svg'),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return RecipeOutPoP();
                });
          }),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
