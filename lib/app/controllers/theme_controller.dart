import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/data/services/theme_service.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.light.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    themeMode.value = ThemeService.instance.themeMode;
  }

  void changeTheme(ThemeMode mode) {
    ThemeService.instance.themeMode=mode;
    themeMode.value = mode;
    //Get.changeThemeMode(mode);
    Get.back();
  }
}
