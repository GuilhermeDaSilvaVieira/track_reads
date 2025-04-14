import '../../domain/entities/book.dart';
import '../../domain/repositories/book_repository.dart';

class SearchBooks {
  final BookRepository repository;

  SearchBooks(this.repository);

  Future<List<Book>> call(String query) => repository.searchBooks(query);
}
