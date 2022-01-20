import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/models/textFieldModel.dart';

class RecipeRegisterController extends GetxController {
  int recipeType = 0;
  int starRating = 0;
  int foodAmount = 0;
  Duration tmpDuration = Duration(hours: 0, minutes: 0);
  int hours = 0;
  int minutes = 0;

  TextFieldModel recipeNameTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '레시피를 간단하게 한줄로 설명해주세요.',
    isPswd: false,
    errorMsg: '',
  );

  TextFieldModel recipeDetailTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText:
        '1. 언제 음식인가요? \n2. 언제 먹으면 좋은지 설명해주세요. \n3. 같이 먹으면 좋은 음식과 식단이 있다면 알려주세요.',
    isPswd: false,
    errorMsg: '',
  );

  @override
  void onInit() {
    recipeNameTextField.tec.addListener(onListenRecipeName);
    recipeDetailTextField.tec.addListener(onListenRecipeDetail);
    super.onInit();
  }

  @override
  void onClose() {
    recipeNameTextField.tec.removeListener(onListenRecipeName);
    recipeDetailTextField.tec.removeListener(onListenRecipeDetail);
    super.onClose();
  }

  void onListenRecipeName() {
    recipeNameTextField.onListenTextFieldType2();
    update();
  }

  void onListenRecipeDetail() {
    recipeDetailTextField.onListenTextFieldType2();
    update();
  }

  void setRecipeType(int index) {
    recipeType = index;
    update();
  }

  void setStarRating(int index) {
    starRating = index;
    update();
  }

  void setFoodAmount(int index) {
    foodAmount = index;
    update();
  }

  void setTmpDuration(Duration duration) {
    tmpDuration = duration;
    update();
  }

  void setHoursAndMinutes() {
    print(tmpDuration);
    hours = tmpDuration.inHours;
    minutes = tmpDuration.inMinutes - hours * 60;
    update();
  }

  Duration setInitDuration() {
    return Duration(hours: hours, minutes: minutes);
  }

  bool checkActive() {
    return recipeNameTextField.tec.text.isNotEmpty &&
        recipeType > 0 &&
        starRating > 0 &&
        (hours > 0 || minutes > 0);
  }
}