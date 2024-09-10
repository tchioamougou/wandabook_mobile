
import 'package:get/get.dart';
import 'package:wandabook/app/data/services/bookService.dart';
import '../controllers/init_controller.dart';


class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookService());
    Get.lazyPut<InitController>(() => InitController());
        // Get.put<InitController>(InitController());
  }
}