import 'package:track_reads/features/book/domain/entities/book.dart';
import 'package:track_reads/features/book/domain/repositories/book_repository.dart';

class CreateBook {
  final BookRepository repository;

  CreateBook(this.repository);

  Future<void> call(Book book) => repository.createBook(book);
}
