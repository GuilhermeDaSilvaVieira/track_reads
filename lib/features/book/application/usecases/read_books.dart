import '../../domain/entities/book.dart';
import '../../domain/repositories/book_repository.dart';

class ReadBooks {
  final BookRepository repository;

  ReadBooks(this.repository);

  Future<List<Book>> call() => repository.readBooks();
}
