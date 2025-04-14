import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SendOtpController extends GetxController {
  var isLoading = false.obs;
  final TextEditingController emailController = TextEditingController();

  Future<String?> resetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return 'Success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found with that email.';
      } else if (e.code == 'invalid-email') {
        return 'Invalid email address.';
      } else {
        return e.message;
      }
    } catch (e) {
      return e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
