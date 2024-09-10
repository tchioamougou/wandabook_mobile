
import 'package:get/get.dart';
import '../controllers/sigin_controller.dart';


class SiginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SiginController>(() => SiginController());
        // Get.put<SiginController>(SiginController());
  }
}