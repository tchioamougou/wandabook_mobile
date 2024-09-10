
import 'package:get/get.dart';
import '../controllers/theme_controller.dart';


class ThemeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeController>(() => ThemeController());
        // Get.put<ThemeController>(ThemeController());
  }
}