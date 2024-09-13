import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/ui/layouts/main/widgets/custom_buttom.dart';
import 'package:wandabook/app/ui/layouts/main/widgets/custom_text_field.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/login_controller.dart';
import '../../layouts/main/widgets/default_loading.dart';

class LoginPage extends GetView<LoginController> {
      const LoginPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  MainLayout(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 100, right: 10),
                child: Obx(() => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/image/logo.png',
                        height: 80.h,
                      ),
                      Text(
                        'Login'.tr,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20.h),
                      if (controller.errorMessage.isNotEmpty)
                        Text(
                          controller.errorMessage.value,
                          style: const TextStyle(color: Colors.red),
                        ),
                      CustomTextField(
                          icon: Icons.email,
                          label: 'Email'.tr,
                          hintText: 'Email'.tr,
                          type: TextInputType.emailAddress,
                          controller: controller.emailController),
                      CustomTextField(
                          icon: Icons.lock,
                          label: 'Password'.tr,
                          hintText: 'Password'.tr,
                          obscureText: true,
                          required: true,
                          controller: controller.passwordController),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Implement forgot password logic
                            },
                            child:  Text('Forgot password?'.tr),
                          ),
                        ],
                      ),
                      CustomButton(
                        onPressed: (){
                          controller.signInWithEmailAndPassword();
                        },
                        titleText: "Sign in".tr,
                        buttonColor: Colors.deepPurpleAccent,
                      ),
                    ],
                  ),
                )),
              ),
            ),
          ),
          Obx(() {
            if (controller.isLoading.isTrue) {
              return const DefaultLoading();
            } else {
              return const Text('');
            }
          })
        ],
      ),
      );
  }
}
