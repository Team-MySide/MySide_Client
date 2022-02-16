import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final double spacing;
  final double starSize;
  final int starAlign;
  StarRating(
      {@required this.rating,
      @required this.spacing,
      @required this.starSize,
      @required this.starAlign});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          starAlign == 1 ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        rating < 1
            ? SvgPicture.asset(
                'assets/icons/off.svg',
                height: starSize,
                width: starSize,
              )
            : SvgPicture.asset(
                'assets/icons/on.svg',
                height: starSize,
                width: starSize,
              ),
        SizedBox(
          width: spacing,
        ),
        rating < 2
            ? SvgPicture.asset(
                'assets/icons/off.svg',
                height: starSize,
                width: starSize,
              )
            : SvgPicture.asset(
                'assets/icons/on.svg',
                height: starSize,
                width: starSize,
              ),
        SizedBox(
          width: spacing,
        ),
        rating < 3
            ? SvgPicture.asset(
                'assets/icons/off.svg',
                height: starSize,
                width: starSize,
              )
            : SvgPicture.asset(
                'assets/icons/on.svg',
                height: starSize,
                width: starSize,
              ),
      ],
    );
  }
}
