
import 'package:get/get.dart';
import '../controllers/subscription_controller.dart';


class SubscriptionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubscriptionController>(() => SubscriptionController());
        // Get.put<SubscriptionController>(SubscriptionController());
  }
}