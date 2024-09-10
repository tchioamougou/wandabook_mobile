
import 'package:get/get.dart';
import 'package:wandabook/app/controllers/bucket_controller.dart';
import 'package:wandabook/app/data/models/book_new_model.dart';
class BookDetailController extends GetxController {

  final  BucketController bucketController =  Get.find<BucketController>();
   late Book book;
   bool isInit = true;
   RxBool inCart = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void addBook(Book book){
    book = book;
    bucketController.addBookToBucket(book);
  }
}