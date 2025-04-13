import 'package:track_reads/features/book/domain/entities/book.dart';
import 'package:track_reads/features/book/domain/repositories/book_repository.dart';

class ReadBook {
  final BookRepository repository;

  ReadBook(this.repository);

  Future<Book> call(String id) => repository.readBook(id);
}
