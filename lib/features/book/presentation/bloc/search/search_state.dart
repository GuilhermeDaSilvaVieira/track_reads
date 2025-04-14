part of 'search_bloc.dart';

/// Base class for all search states.
sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object?> get props => [];
}

/// The initial state before any events have been processed.
class SearchInitial extends SearchState {}

/// State indicating that a search-related operation is in progress.
class SearchLoadInProgress extends SearchState {}

/// State when search has been successfully loaded.
class SearchLoadSuccess extends SearchState {
  final List<Book> books;

  const SearchLoadSuccess(this.books);

  @override
  List<Object?> get props => [books];
}

/// State when a search operation has failed.
class SearchOperationFailure extends SearchState {
  final String error;

  const SearchOperationFailure(this.error);

  @override
  List<Object?> get props => [error];
}
