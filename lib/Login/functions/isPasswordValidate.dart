bool isPasswordValidate(String input) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,16}$';
  RegExp regExp = new RegExp(pattern);
  if (regExp.hasMatch(input)) {
    return true;
  } else {
    return false;
  }
}
