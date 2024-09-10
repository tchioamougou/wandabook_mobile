import 'package:wandabook/app/controllers/book_detail_controller.dart';
import 'package:wandabook/app/controllers/bucket_controller.dart';
import 'package:wandabook/app/controllers/init_controller.dart';
import 'package:wandabook/app/controllers/search_controller.dart';

import '../../controllers/navigation_controller.dart';
import '../../controllers/main_controller.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DependecyInjection {
  static Future<void> init() async {
    await GetStorage.init();
    Get.put<InitController>(InitController());
    Get.put<SearchPageController>(SearchPageController());
    Get.put<NavigationController>(NavigationController());
    Get.put<BucketController>(BucketController());
    Get.put<BookDetailController>(BookDetailController());
    Get.put<MainController>(MainController());
  }
}
