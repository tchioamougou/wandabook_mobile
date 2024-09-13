import 'package:firebase_core/firebase_core.dart';
import 'package:wandabook/app/controllers/book_detail_controller.dart';
import 'package:wandabook/app/controllers/bucket_controller.dart';
import 'package:wandabook/app/controllers/init_controller.dart';
import 'package:wandabook/app/controllers/profile_controller.dart';
import 'package:wandabook/app/controllers/search_controller.dart';
import 'package:wandabook/firebase_options.dart';
import 'package:wandabook/global.dart';

import '../../controllers/navigation_controller.dart';
import '../../controllers/main_controller.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class DependecyInjection {
  static Future<void> init() async {
    await GetStorage.init();
    // firebase init
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Global.init();
    Get.put<InitController>(InitController());
    Get.put<SearchPageController>(SearchPageController());
    Get.put<NavigationController>(NavigationController());
    Get.put<BucketController>(BucketController());
    Get.put<BookDetailController>(BookDetailController());
    Get.put<MainController>(MainController());
    Get.put<ProfileController>(ProfileController());
  }
}
