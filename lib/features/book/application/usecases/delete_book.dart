import '../../domain/repositories/book_repository.dart';

class DeleteBook {
  final BookRepository repository;

  DeleteBook(this.repository);

  Future<void> call(String id) => repository.deleteBook(id);
}
