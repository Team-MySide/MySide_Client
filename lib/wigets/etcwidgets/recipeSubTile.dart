import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_side_client/models/recipeTileModel.dart';
import 'package:my_side_client/wigets/etcwidgets/starRating.dart';

class RecipeSubTile extends StatelessWidget {
  final RecipeTile recipeTile;
  RecipeSubTile({@required this.recipeTile});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          recipeTile.recipeName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        Column(
          children: [
            Row(
              children: [
                Image.asset(
                  recipeTile.usrProfileImg,
                  width: 32,
                  height: 32,
                ),
                SizedBox(width: 8),
                Text(
                  recipeTile.usrNickname,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 4),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 4,
            children: [
              Text(
                recipeTile.usrInfo[0],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF3BD7E2),
                ),
              ),
              Text(
                recipeTile.usrInfo[1],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF3BD7E2),
                ),
              ),
              Text(
                recipeTile.usrInfo[2],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF3BD7E2),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Row(
          children: [
            StarRating(
                rating: recipeTile.rate,
                spacing: 4,
                starSize: 12,
                starAlign: 2),
            SizedBox(width: 20),
            Container(height: 12, width: 1.5, color: Color(0xFFDDDDDD)),
            SizedBox(width: 20),
            SvgPicture.asset('assets/icons/time.svg'),
            SizedBox(width: 5),
            Text(
              recipeTile.minute.toString() + '분',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Color(0xFF666666),
              ),
            ),
          ],
        )
      ],
    );
  }
}
