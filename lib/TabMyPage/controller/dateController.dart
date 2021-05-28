import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateController extends GetxController {
  DateTime date = DateTime.now();

  selecteDate(BuildContext context) async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    date = newDate;
    update();
  }
}
