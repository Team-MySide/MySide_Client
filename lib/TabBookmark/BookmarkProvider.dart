import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';

import '../Constants.dart';

class BookmarkProvider extends GetConnect {
  Future<Response> getBookmark(int id) async => get(Constants.BASE_URL);
}
