import 'package:track_reads/features/book/data/datasources/book_firebase_datasource.dart';
import 'package:track_reads/features/book/data/models/book_model.dart';
import 'package:track_reads/features/book/domain/entities/book.dart';
import 'package:track_reads/features/book/domain/repositories/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookFirebaseDataSource dataSource;

  BookRepositoryImpl(this.dataSource);

  @override
  Future<void> createBook(Book book) async {
    final bookModel = BookModel.fromEntity(book);
    await dataSource.createBook(bookModel);
  }

  @override
  Future<List<Book>> readBooks() async {
    final bookModels = await dataSource.readBooks();
    return bookModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<Book> readBook(String id) async {
    final bookModel = await dataSource.readBook(id);
    return bookModel.toEntity();
  }

  @override
  Future<void> updateBook(Book book) async {
    final bookModel = BookModel.fromEntity(book);
    await dataSource.updateBook(bookModel);
  }

  @override
  Future<void> deleteBook(String id) async {
    await dataSource.deleteBook(id);
  }
}
