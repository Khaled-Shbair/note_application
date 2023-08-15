import 'package:get/get.dart';

mixin Helper {
  void showSnackBar(String message) {
    Get.snackbar('', message);
  }
}
