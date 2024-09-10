import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wandabook/app/data/models/book_new_model.dart';

class BookService extends GetxService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  Future<List<Book>> searchBooks(String query) async {

      final response = await http.get(Uri.parse('$_baseUrl?q=$query'));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return (data['items'] as List<dynamic>).map((item) {
          return Book.fromJson(item);
        }).toList();
      //  return volumes ?? [];
      } else {
        throw Exception('Failed to load books');
      }
  }
}