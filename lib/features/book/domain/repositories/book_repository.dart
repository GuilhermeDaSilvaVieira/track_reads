import 'package:track_reads/features/book/domain/entities/book.dart';

abstract class BookRepository {
  Future<void> createBook(Book book);
  Future<List<Book>> readBooks();
  Future<Book> readBook(String id);
  Future<void> updateBook(Book book);
  Future<void> deleteBook(String id);
}
