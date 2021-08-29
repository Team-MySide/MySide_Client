import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_side_client/models/textFieldModel.dart';

class SetPersonalInfoController extends GetxController {
  int gender = 0;
  TextFieldModel ageTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '00',
    isPswd: false,
    errorMsg: '',
  );
  TextFieldModel heightTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '00',
    isPswd: false,
    errorMsg: '',
  );
  TextFieldModel weightTextField = new TextFieldModel(
    tec: TextEditingController(),
    fn: FocusNode(),
    hintText: '00',
    isPswd: false,
    errorMsg: '',
  );

  bool dontKnow = false;
  int validateNm = 0;

  @override
  void onInit() {
    ageTextField.tec.addListener(onListenAge);
    heightTextField.tec.addListener(onListenHeight);
    weightTextField.tec.addListener(onListenWeight);
    super.onInit();
  }

  @override
  void onClose() {
    ageTextField.tec.removeListener(onListenAge);
    heightTextField.tec.removeListener(onListenHeight);
    weightTextField.tec.removeListener(onListenWeight);
    super.onClose();
  }

  void setGender(int index) {
    gender = index;
    update();
  }

  void onListenAge() {
    ageTextField.onListenTextFieldType1();
    update();
  }

  void onListenHeight() {
    heightTextField.onListenTextFieldType1();
    update();
  }

  void onListenWeight() {
    weightTextField.onListenTextFieldType1();
    update();
  }

  void setValidateNum() {
    if (gender > 0 && ageTextField.tec.text.isNotEmpty) {
      if (dontKnow) {
        validateNm = 1;
      } else {
        if (weightTextField.tec.text.isNotEmpty &&
            heightTextField.tec.text.isNotEmpty) {
          validateNm = 2;
        } else {
          validateNm = 0;
        }
      }
    } else {
      validateNm = 0;
    }
    update();
  }

  bool isActive() {
    return gender > 0 &&
        ageTextField.tec.text.isNotEmpty &&
        (dontKnow ||
            (heightTextField.tec.text.isNotEmpty &&
                weightTextField.tec.text.isNotEmpty));
  }

  bool validateInfos() {
    if (validateNm == 1) {
      ageTextField.validateNumber();
    }
    if (validateNm == 2) {
      ageTextField.validateNumber();
      heightTextField.validateNumber();
      weightTextField.validateNumber();
    }
    update();
    if (!ageTextField.errorOcur &&
        !heightTextField.errorOcur &&
        !weightTextField.errorOcur &&
        validateNm > 0) {
      return true;
    } else {
      return false;
    }
  }

  void checkClicked() {
    dontKnow = !dontKnow;
    update();
  }
}
