import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/debouncer.dart';
import '../bloc/search/search_bloc.dart';
import '../widgets/book_list_item.dart';

class BookSearchScreen extends StatefulWidget {
  const BookSearchScreen({super.key});

  @override
  State<BookSearchScreen> createState() => _BookSearchScreenState();
}

class _BookSearchScreenState extends State<BookSearchScreen> {
  final _debouncer = Debouncer(milliseconds: 500);
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          context.read<SearchBloc>().add(SearchReset());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Open Library Search'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _searchController,
                onChanged: (query) {
                  _debouncer.run(() {
                    context.read<SearchBloc>().add(SearchQueryChanged(query));
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Search for books...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<SearchBloc, SearchState>(
                builder: (context, state) {
                  if (state is SearchLoadInProgress) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is SearchLoadSuccess) {
                    if (state.books.isEmpty) {
                      return const Center(
                        child: Text('No books found.'),
                      );
                    }
                    return ListView.builder(
                      itemCount: state.books.length,
                      itemBuilder: (context, index) {
                        return BookListItem(book: state.books[index]);
                      },
                    );
                  } else if (state is SearchOperationFailure) {
                    return Center(
                      child: Text(state.error),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
