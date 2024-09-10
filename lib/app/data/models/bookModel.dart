import 'dart:convert';

class BookModel {
  final String title;
  final String author;
  final String picture;
  final double price;
  final int rice;
  final bool picked;

  BookModel({
    required this.title,
    required this.author,
    required this.price,
    required this.rice,
    required this.picked,
    required this.picture
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      title: json['title'] as String,
      author: json['author'] as String,
      price: json['price'] as double,
      rice: json['rice'] as int,
      picked: json['picked'] as bool,
        picture:json['picture'] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'price': price,
      'rice': rice,
      'picked': picked,
      "picture":picture
    };
  }
}

class BookList {
  final List<BookModel> books;

  BookList({required this.books});

  factory BookList.fromJson(List<dynamic> json) {
    return BookList(
      books: json.map((bookJson) => BookModel.fromJson(bookJson)).toList(),
    );
  }

  List<dynamic> toJson() {
    return books.map((book) => book.toJson()).toList();
  }
}
