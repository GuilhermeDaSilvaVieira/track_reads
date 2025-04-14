import '../datasources/book_firebase_datasource.dart';
import '../datasources/open_library_api_datasource.dart';
import '../models/book_model.dart';
import '../../domain/entities/book.dart';
import '../../domain/repositories/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookFirebaseDataSource dataSource;
  final OpenLibraryAPIDataSource openLibraryAPIDataSource;

  BookRepositoryImpl(this.dataSource, this.openLibraryAPIDataSource);

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

  @override
  Future<List<Book>> searchBooks(String query) async {
    final bookModels = await openLibraryAPIDataSource.fetchBooks(query);
    return bookModels;
  }
}
