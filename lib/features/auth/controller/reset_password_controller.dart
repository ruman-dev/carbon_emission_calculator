import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPasswordController extends GetxController {
  var isNewPassHide = true.obs;
  var isConfirmPassHide = true.obs;
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  void toggleNewPassVisibility() {
    isNewPassHide.value = !isNewPassHide.value;
  }

  void toggleConfirmPassVisibility() {
    isConfirmPassHide.value = !isConfirmPassHide.value;
  }

  @override
  void dispose() {
    newPassController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }
}
