import 'dart:collection';

import 'package:get/state_manager.dart';

import 'NutritionDetailService.dart';

//https://www.google.com/search?q=flutter+rest+api+getx&oq=flutter+rest+api+getx+&aqs=chrome..69i57j0i22i30j69i60.3887j1j4&sourceid=chrome&ie=UTF-8#kpvalbx=_p8WfYPrMFdWB-Qbxsr2ADQ18
class NutritionDetailController extends GetxController {
  Map<String, double> map = Map<String, double>().obs;
  var isLoading = true.obs;
  final String category;
  final String state;
  double energy = 0.0;
  NutritionDetailController(this.category, this.state);
  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  void fetch() async {
    isLoading(true);
    try {
      Map<String, double> products = await NutritionDetailListService()
          .fetchNutritionList(category, state);

      if (products != null) {
        map = manipulate(products);
        // lst.value = ['당근', '당당근', '당당당근', '사과', '사사과', '사사사과'];
      }
    } finally {
      isLoading(false);
    }
  }

  Map<String, double> manipulate(Map<String, double> origin) {
    SplayTreeMap<String, double> ret = SplayTreeMap<String, double>();
    origin.removeWhere((key, value) {
      return (value ?? 0.0) == 0.0;
    });
    origin.forEach((key, value) {
      if (key != "energy") {
        ret[key.replaceAll("_", " ")] = value;
      } else {
        energy = origin[key];
      }
    });

    return ret;
  }
}
