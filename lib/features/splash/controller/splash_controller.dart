import 'package:get/get.dart';

import '../../../core/routes/routes.dart';

class SplashController extends GetxController {
  Future<void> moveToOnboarding() async {
    await Future.delayed(const Duration(seconds: 3), () => Get.offAllNamed(Routes.signInScreen));
  }

  @override
  void onInit() {
    super.onInit();
    moveToOnboarding();
  }
}
