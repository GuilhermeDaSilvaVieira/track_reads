import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/usecases/create_book.dart';
import '../../../application/usecases/delete_book.dart';
import '../../../application/usecases/read_book.dart';
import '../../../application/usecases/read_books.dart';
import '../../../application/usecases/update_book.dart';
import '../../../domain/entities/book.dart';

part 'book_event.dart';
part 'book_state.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final CreateBook createBook;
  final ReadBooks readBooks;
  final ReadBook readBook;
  final UpdateBook updateBook;
  final DeleteBook deleteBook;

  BookBloc({
    required this.createBook,
    required this.readBooks,
    required this.readBook,
    required this.updateBook,
    required this.deleteBook,
  }) : super(BookInitial()) {
    on<BookCreateRequested>(_onBookCreateRequested);
    on<BooksLoadRequested>(_onBooksLoadRequested);
    on<BookReadRequested>(_onBookReadRequested);
    on<BookUpdateRequested>(_onBookUpdateRequested);
    on<BookDeleteRequested>(_onBookDeleteRequested);
  }
  Future<void> _onBookCreateRequested(
      BookCreateRequested event, Emitter<BookState> emit) async {
    try {
      emit(BookLoadInProgress());
      await createBook(event.book);
      final books = await readBooks();
      emit(BookLoadSuccess(books));
    } catch (e) {
      emit(BookOperationFailure(e.toString()));
    }
  }

  Future<void> _onBooksLoadRequested(
      BooksLoadRequested event, Emitter<BookState> emit) async {
    try {
      emit(BookLoadInProgress());
      final books = await readBooks();
      emit(BookLoadSuccess(books));
    } catch (e) {
      emit(BookOperationFailure(e.toString()));
    }
  }

  Future<void> _onBookReadRequested(
      BookReadRequested event, Emitter<BookState> emit) async {
    try {
      emit(BookLoadInProgress());
      final book = await readBook(event.id);
      emit(BookReadSuccess(book));
    } catch (e) {
      emit(BookOperationFailure(e.toString()));
    }
  }

  Future<void> _onBookUpdateRequested(
      BookUpdateRequested event, Emitter<BookState> emit) async {
    try {
      emit(BookLoadInProgress());
      await updateBook(event.book);
      final book = await readBook(event.book.id);
      emit(BookReadSuccess(book));
    } catch (e) {
      emit(BookOperationFailure(e.toString()));
    }
  }

  Future<void> _onBookDeleteRequested(
      BookDeleteRequested event, Emitter<BookState> emit) async {
    try {
      emit(BookLoadInProgress());
      await deleteBook(event.id);
      final books = await readBooks();
      emit(BookLoadSuccess(books));
    } catch (e) {
      emit(BookOperationFailure(e.toString()));
    }
  }
}
