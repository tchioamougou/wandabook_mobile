
import 'package:get/get.dart';
import '../controllers/bucket_controller.dart';


class BucketBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BucketController>(() => BucketController());
        // Get.put<BucketController>(BucketController());
  }
}