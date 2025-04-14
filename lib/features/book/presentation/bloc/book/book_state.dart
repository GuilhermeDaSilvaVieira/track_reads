part of 'book_bloc.dart';

/// Base class for all book states.
sealed class BookState extends Equatable {
  const BookState();

  @override
  List<Object?> get props => [];
}

/// The initial state before any events have been processed.
class BookInitial extends BookState {}

/// State indicating that a book-related operation is in progress.
class BookLoadInProgress extends BookState {}

/// State when books have been successfully loaded.
class BookLoadSuccess extends BookState {
  final List<Book> books;

  const BookLoadSuccess(this.books);

  @override
  List<Object?> get props => [books];
}

/// State when a book have been successfully loaded.
class BookReadSuccess extends BookState {
  final Book book;

  const BookReadSuccess(this.book);

  @override
  List<Object?> get props => [book];
}

/// State when a book operation has failed.
class BookOperationFailure extends BookState {
  final String error;

  const BookOperationFailure(this.error);

  @override
  List<Object?> get props => [error];
}
