import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SendOtpController extends GetxController {
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
