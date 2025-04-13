import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:track_reads/features/book/application/usecases/create_book.dart';
import 'package:track_reads/features/book/application/usecases/delete_book.dart';
import 'package:track_reads/features/book/application/usecases/read_book.dart';
import 'package:track_reads/features/book/application/usecases/read_books.dart';
import 'package:track_reads/features/book/application/usecases/update_book.dart';
import 'package:track_reads/features/book/data/datasources/book_firebase_datasource.dart';
import 'package:track_reads/features/book/data/repositories/book_repository_impl.dart';
import 'package:track_reads/features/book/domain/repositories/book_repository.dart';

final sl = GetIt.instance;

Future<void> setupBookLocator() async {
  // Firebase instance
  sl.registerLazySingleton(() => FirebaseFirestore.instance);

  // Data source
  sl.registerLazySingleton(() => BookFirebaseDataSource(sl()));

  // Repository
  sl.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => CreateBook(sl()));
  sl.registerLazySingleton(() => ReadBooks(sl()));
  sl.registerLazySingleton(() => ReadBook(sl()));
  sl.registerLazySingleton(() => UpdateBook(sl()));
  sl.registerLazySingleton(() => DeleteBook(sl()));
}
