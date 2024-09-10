import 'dart:convert';

import 'package:get/get.dart';
import 'package:wandabook/app/data/models/bookModel.dart';
import 'package:wandabook/app/data/models/book_new_model.dart';
import 'package:wandabook/app/data/services/bookService.dart';

class InitController extends GetxController {
  RxList<String> headerItems = ['data'].obs;
  RxList<String> bookCategories =
      ['All Genre', 'Comedy', "Fiction", "Romance", 'Mangas', "cartoon"].obs;
  RxString selectCat = 'All Genre'.obs;
  // Example usage to convert a JSON string to a BookList object
  String jsonString =
      '[{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true}]';
  Rx<BookList> bookList = BookList(books: []).obs;
  RxString searchText = 'book'.obs;
  RxList<Book> books = <Book>[].obs;
  RxBool isLoading = false.obs;

  BookService bookService = BookService();

  void selectCategory(item) {
    selectCat.value = item;
    if(item=="All Genre"){
      searchText.value="book";
    }else{
      searchText.value = item;
    }
    searchBooks();
  }

  Future<void> searchBooks() async {
    isLoading.value = true;
    final results = await bookService.searchBooks(searchText.value);
    books.value = results;
    isLoading.value = false;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    bookList.value = BookList.fromJson(jsonDecode(jsonString));
    searchBooks();
    super.onInit();
  }
}
