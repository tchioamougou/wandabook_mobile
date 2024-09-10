
import 'package:get/get.dart';
import '../controllers/book_detail_controller.dart';


class BookDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookDetailController>(() => BookDetailController());
        // Get.put<BookDetailController>(BookDetailController());
  }
}