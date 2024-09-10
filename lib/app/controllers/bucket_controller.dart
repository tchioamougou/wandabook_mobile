import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/data/models/book_new_model.dart';

class BucketController extends GetxController {
  String jsonString = '[]';
  RxList<Book> selectBooks = <Book>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  void addBookToBucket(Book book) {
    if(selectBooks.length >= 4){
      Fluttertoast.showToast(
          msg: "You can't add more thant 4 books",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.yellow,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }else{
      selectBooks.add(book);
      selectBooks = selectBooks;
      Fluttertoast.showToast(
          msg: "Book added to bucket",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.TOP,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }

  }
  void removeBookFromBucket(Book book){
    selectBooks.removeWhere((element) => element.id==book.id);
    Fluttertoast.showToast(
        msg: "Book remove to bucket",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  bool checkCart(Book book) {
    List<Book> filter = selectBooks.where(
      (bk) {
        return bk.id == book.id;
      },
    ).toList();
    return filter.isNotEmpty;
  }
}
