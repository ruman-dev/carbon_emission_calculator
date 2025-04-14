import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/app_colors/app_colors.dart';

class NotificationService {
  static void notificationMessage(String title, String subtitle, [Color? color]) {
    Get.snackbar(title, subtitle, colorText: Colors.white, backgroundColor: color ?? AppColors.primaryColor);
  }
}
