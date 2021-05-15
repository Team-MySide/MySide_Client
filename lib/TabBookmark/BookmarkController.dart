import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'BookmarkModel.dart';
import 'BookmarkProvider.dart';

class BookmarkController extends GetxController {
  var data = <BookmarkModel>[].obs;
  int id = 0;
  BookmarkController(this.id);
  @override
  void onInit() {
    _getBookmark();
    super.onInit();
  }

  List<dynamic> lst = [
    {
      "name": "땅콩",
      "path": "images/food4.png",
      "like": "123",
      "bookmark": "22",
      "tags": ["위암", "비타민e"]
    },
    {
      "name": "마늘",
      "path": "images/food1.png",
      "like": "23",
      "bookmark": "122",
      "tags": ["비타민1", "비타민e"]
    },
    {
      "name": "마늘",
      "path": "images/food1.png",
      "like": "23",
      "bookmark": "122",
      "tags": ["위암", "비타민e"]
    },
    {
      "name": "마늘",
      "path": "images/food1.png",
      "like": "23",
      "bookmark": "122",
      "tags": ["위암", "비타민e"]
    }
  ];

  void _getBookmark() async {
    // Future.delayed(
    //     Duration.zero,
    //     () => Get.dialog(Center(child: CircularProgressIndicator()),
    //         barrierDismissible: false));
    // var json = await BookmarkProvider().getBookmark(id) as List;
    // BookmarkModel model = BookmarkModel.fromJson(json.body);
    var json = lst;
    data.value = json.map((e) => BookmarkModel.fromJson(e)).toList();

    Get.back();
  }
}
