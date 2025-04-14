import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/book_model.dart';

class OpenLibraryAPIDataSource {
  Future<List<BookModel>> fetchBooks(String query) async {
    final response = await http.get(
      Uri.parse('https://openlibrary.org/search.json?q=$query'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List docs = data['docs'];
      return docs.map((json) => BookModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
