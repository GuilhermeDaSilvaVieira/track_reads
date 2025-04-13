import 'package:track_reads/features/book/domain/entities/book.dart';
import 'package:track_reads/features/book/domain/repositories/book_repository.dart';

class ReadBooks {
  final BookRepository repository;

  ReadBooks(this.repository);

  Future<List<Book>> call() => repository.readBooks();
}
