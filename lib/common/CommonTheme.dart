import 'package:flutter/material.dart';

class CommonTheme {
  static ButtonStyle getSquarePrimaryButtonStyle({double w, double h}) {
    return ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        )),
        fixedSize: w != null && h != null
            ? MaterialStateProperty.all(Size(w, h))
            : null,
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        // backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3BD7E2)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Color(0xFFDDDDDD);
            }
            // if (states.contains(MaterialState.hovered))
            //   return Color(0xFF3BD7E2).withOpacity(0.04);
            if (states.contains(MaterialState.pressed))
              return Color(0xFF3BD7E2).withOpacity(0.9);
            return Color(0xFF3BD7E2); // Defer to the widget's default.
          },
        ));
  }

  static ButtonStyle getSquareGreyButtonStyle({double w, double h}) {
    return ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        )),
        fixedSize: w != null && h != null
            ? MaterialStateProperty.all(Size(w, h))
            : null,
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        // backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF3BD7E2)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Color(0xFFDDDDDD);
            }
            // if (states.contains(MaterialState.hovered))
            //   return Color(0xFF3BD7E2).withOpacity(0.04);
            if (states.contains(MaterialState.pressed))
              return Color(0xFF3BD7E2).withOpacity(0.9);
            return Color(0xFF666666); // Defer to the widget's default.
          },
        ));
  }

// 0xFF3BD7E2

}
