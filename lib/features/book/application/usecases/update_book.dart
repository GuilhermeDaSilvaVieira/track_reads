import 'package:track_reads/features/book/domain/entities/book.dart';
import 'package:track_reads/features/book/domain/repositories/book_repository.dart';

class UpdateBook {
  final BookRepository repository;

  UpdateBook(this.repository);

  Future<void> call(Book book) => repository.updateBook(book);
}
