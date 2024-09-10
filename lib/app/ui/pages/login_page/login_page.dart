import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/login_controller.dart';

class LoginPage extends GetView<LoginController> {
      const LoginPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MainLayout(
        child: Text('Login'),
      );
  }
}
