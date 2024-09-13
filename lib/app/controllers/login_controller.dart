import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/data/services/user_model.dart';
import 'package:wandabook/app/data/services/user_service.dart';
import 'package:wandabook/app/routes/app_routes.dart';
import 'package:wandabook/app/ui/utils/constants.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final passwordConfirmController = TextEditingController().obs;
  final _auth = FirebaseAuth.instance;
  final RxString errorMessage = ''.obs;
  final Rx<UserCredential?> _user = Rx<UserCredential?>(null);
  final RxBool isLoading = false.obs;
  UserCredential? get user => _user.value;
  UserService userService = UserService.instance;
  // Authentication logic here (e.g., using Firebase)
  Future<void> signInWithEmailAndPassword() async {
    if (emailController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty) {
      isLoading.value = true;
      try {
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text,
        );
        _user.value = userCredential;
        userService.user = UserModel.fromUserCredential(userCredential);
        Get.offAllNamed(AppRoutes.HOME);
      } on FirebaseAuthException catch (e) {
        errorMessage.value = Constants.ERROR_OCCUR.tr;
        throw Exception(e.code);
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void> signUpWithEmailAndPassword() async {
    if (emailController.value.text.isNotEmpty &&
        passwordController.value.text.isNotEmpty &&
        passwordConfirmController.value.text.isNotEmpty) {
      if (passwordConfirmController.value.text ==
          passwordController.value.text) {
        isLoading.value = true;
        try {
          UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
            email: emailController.value.text,
            password: passwordConfirmController.value.text,
          );
          _user.value = userCredential;
          userService.user = UserModel.fromUserCredential(userCredential);
          Get.offAllNamed(AppRoutes.HOME);
        } on FirebaseAuthException catch (e) {
          errorMessage.value = Constants.ERROR_OCCUR.tr;
          throw Exception(e.code);
        } finally {
          isLoading.value = false;
        }
      } else {
        errorMessage.value = Constants.PASS_DONT_MATCH.tr;
      }
    }
  }
  Future<void> signInWithApple() async {
    // ...
  }
}
