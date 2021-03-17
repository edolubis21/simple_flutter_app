import 'package:get/get.dart';

mixin validates {
  String validateEmail(String value) {
    if (value.isEmpty) {
      return "Field ini wajib diisi";
    }
    if (!value.isEmail) {
      return "Email yang anda masukkan tidak valid";
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) {
      return "Field ini wajib diisi";
    }
    return null;
  }
}
