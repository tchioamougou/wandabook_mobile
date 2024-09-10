import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:wandabook/app/data/models/bookModel.dart';
import 'package:wandabook/app/data/models/book_new_model.dart';
import 'package:wandabook/app/data/services/bookService.dart';
class SearchPageController extends GetxController {
  RxList<String> bookCategories= ['All Genre','Comedy',"Fiction","Romance",'Mangas',"cartoon"].obs;
  TextEditingController searchController =TextEditingController(text: 'book');
  RxString selectCat = 'All Genre'.obs;
  String jsonString = '[{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true},{"picture": "https://cdn1.booknode.com/book_cover/1410/full/power-les-48-lois-du-pouvoir-1410491.jpg", "title": "The Great Gatsby", "author": "F. Scott Fitzgerald", "price": 19.99, "rice": 3, "picked": true}]';
  Rx<BookList> bookList = BookList(books: []).obs;

  RxList<Book> books = <Book>[].obs;
  RxBool isLoading = false.obs;

  BookService bookService = BookService();

  Future<void> searchCategory(String cat) async {
    isLoading.value = true;
    final results = await bookService.searchBooks(cat);
    books.value = results;
    isLoading.value = false;
  }
  Future<void> searchBooks() async {
    isLoading.value = true;
    final results = await bookService.searchBooks(searchController.value.text);
    books.value = results;
    isLoading.value = false;
  }
  void findBooks (){
    searchBooks();
  }
  void selectCategory(item){
    selectCat.value = item;
    searchCategory(item);
  }
  @override
  void onInit() {
    // TODO: implement onInit
    searchBooks();
    super.onInit();
  }
}