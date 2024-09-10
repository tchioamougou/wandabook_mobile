import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../layouts/main/main_layout.dart';

import '../../../controllers/theme_controller.dart';

class ThemePage extends GetView<ThemeController> {
  const ThemePage();
  @override
  Widget build(BuildContext context) {
    return MainLayout(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Theme Settings'),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        body: ListView(
          children: [
            ListTile(
                title: Text('Light'.tr),
                onTap: () {
                  controller.changeTheme(ThemeMode.light);
                },
                leading: const Icon(Icons.wb_sunny_outlined),
                trailing: Obx(
                        () => controller.themeMode.value == ThemeMode.light
                        ? const Icon(Icons.check)
                        : const Text('') // Or any other widget for the 'false' condition
                )),
            ListTile(
                title: Text('Dark'.tr),
                onTap: () {
                  controller.changeTheme(ThemeMode.dark);
                },
                leading: const Icon(Icons.nightlight),
                trailing: Obx(() => controller.themeMode.value == ThemeMode.dark
                    ? const Icon(Icons.check)
                    : const Text('') // Or any other widget for the 'false' condition
                )),
            ListTile(
                title: Text('Automatic'.tr),
                onTap: () {
                  controller.changeTheme(ThemeMode.system);
                },
                trailing: Obx(
                        () => controller.themeMode.value == ThemeMode.system
                        ? const Icon(Icons.check)
                        : const Text('') // Or any other widget for the 'false' condition
                ),
                leading: const Icon(Icons.sunny_snowing)),
          ],
        ),
      ),
    );
  }
}
