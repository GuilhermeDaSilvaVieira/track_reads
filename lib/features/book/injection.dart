import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'application/usecases/create_book.dart';
import 'application/usecases/delete_book.dart';
import 'application/usecases/read_book.dart';
import 'application/usecases/read_books.dart';
import 'application/usecases/search_books.dart';
import 'application/usecases/update_book.dart';
import 'data/datasources/book_firebase_datasource.dart';
import 'data/datasources/open_library_api_datasource.dart';
import 'data/repositories/book_repository_impl.dart';
import 'domain/repositories/book_repository.dart';

final sl = GetIt.instance;

Future<void> setupBookLocator() async {
  // Firebase instance
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Data source
  sl.registerLazySingleton(() => BookFirebaseDataSource(sl()));
  sl.registerLazySingleton(() => OpenLibraryAPIDataSource());

  // Repository
  sl.registerLazySingleton<BookRepository>(
      () => BookRepositoryImpl(sl(), sl()));

  // Use cases
  sl.registerLazySingleton(() => CreateBook(sl()));
  sl.registerLazySingleton(() => ReadBooks(sl()));
  sl.registerLazySingleton(() => SearchBooks(sl()));
  sl.registerLazySingleton(() => ReadBook(sl()));
  sl.registerLazySingleton(() => UpdateBook(sl()));
  sl.registerLazySingleton(() => DeleteBook(sl()));
}
