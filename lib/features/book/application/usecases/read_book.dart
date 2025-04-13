import '../../domain/entities/book.dart';
import '../../domain/repositories/book_repository.dart';

class ReadBook {
  final BookRepository repository;

  ReadBook(this.repository);

  Future<Book> call(String id) => repository.readBook(id);
}
