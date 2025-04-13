import '../../domain/entities/book.dart';
import '../../domain/repositories/book_repository.dart';

class CreateBook {
  final BookRepository repository;

  CreateBook(this.repository);

  Future<void> call(Book book) => repository.createBook(book);
}
