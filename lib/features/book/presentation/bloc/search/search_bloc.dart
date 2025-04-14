import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../application/usecases/search_books.dart';
import '../../../domain/entities/book.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchBooks searchBooks;

  SearchBloc({
    required this.searchBooks,
  }) : super(SearchInitial()) {
    on<SearchQueryChanged>(_onSearchQueryChanged);
    on<SearchReset>(_onSearchReset);
  }

  Future<void> _onSearchQueryChanged(
      SearchQueryChanged event, Emitter<SearchState> emit) async {
    if (event.query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoadInProgress());
    try {
      final books = await searchBooks(event.query);
      emit(SearchLoadSuccess(books));
    } catch (e) {
      emit(SearchOperationFailure(e.toString()));
    }
  }

  Future<void> _onSearchReset(
      SearchReset event, Emitter<SearchState> emit) async {
    emit(SearchInitial());
  }
}
