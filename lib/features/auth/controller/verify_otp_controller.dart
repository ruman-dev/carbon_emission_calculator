import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyOtpController extends GetxController {
  final otpPinController = TextEditingController();

  @override
  void dispose() {
    otpPinController.dispose();
    super.dispose();
  }
}
