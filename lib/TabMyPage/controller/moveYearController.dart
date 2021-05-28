import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MoveYearController extends GetxController {
  int curYear = DateTime.now().year;
  int showYear = DateTime.now().year;
  SvgPicture rightArrow = SvgPicture.asset('assets/arrowrightend.svg');

  rightMoveYear() {
    if (curYear == showYear + 1) {
      rightArrow = SvgPicture.asset('assets/arrowrightend.svg');
      showYear++;
    } else {
      if (curYear == showYear) {
        showYear = showYear;
      } else {
        showYear++;
      }
    }
    update();
  }

  leftMoveYear() {
    if (curYear == showYear) {
      rightArrow = SvgPicture.asset('assets/arrowright.svg');
    }
    showYear--;
    update();
  }
}
