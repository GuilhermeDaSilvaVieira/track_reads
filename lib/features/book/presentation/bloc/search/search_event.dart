part of 'search_bloc.dart';

/// Base class for all search events.
sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object?> get props => [];
}

/// Event to search whenever a query changes.
class SearchQueryChanged extends SearchEvent {
  final String query;

  const SearchQueryChanged(this.query);

  @override
  List<Object?> get props => [query];
}

/// Event to reset search
class SearchReset extends SearchEvent {}
