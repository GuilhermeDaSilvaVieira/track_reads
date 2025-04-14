part of 'book_bloc.dart';

/// Base class for all book events.
sealed class BookEvent extends Equatable {
  const BookEvent();

  @override
  List<Object?> get props => [];
}

/// Event to request the creation of a new book.
class BookCreateRequested extends BookEvent {
  final Book book;

  const BookCreateRequested(this.book);

  @override
  List<Object?> get props => [book];
}

/// Event to request loading (reading) of all books.
class BooksLoadRequested extends BookEvent {
  const BooksLoadRequested();
}

/// Event to request loading (reading) of a specific book.
class BookReadRequested extends BookEvent {
  final String id;

  const BookReadRequested(this.id);

  @override
  List<Object?> get props => [id];
}

/// Event to request updating an existing book.
class BookUpdateRequested extends BookEvent {
  final Book book;

  const BookUpdateRequested(this.book);

  @override
  List<Object?> get props => [book];
}

/// Event to request deletion of a book.
class BookDeleteRequested extends BookEvent {
  final String id;

  const BookDeleteRequested(this.id);

  @override
  List<Object?> get props => [id];
}
