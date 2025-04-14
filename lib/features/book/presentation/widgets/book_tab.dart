import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/book_status.dart';
import '../bloc/book/book_bloc.dart';
import 'book_card.dart';

class BookTab extends StatelessWidget {
  final BookStatus status;

  const BookTab({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookLoadInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BookLoadSuccess) {
          final books =
              state.books.where((book) => book.status == status).toList();
          if (books.isEmpty) {
            return Center(
              child: Text(
                'This list is currently empty.\nClick the + button below to add a new book',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.only(bottom: 88),
            itemCount: books.length,
            itemBuilder: (context, index) {
              final book = books[index];
              return BookCard(
                id: book.id,
                title: book.title,
                author: book.author,
                coverImageUrl: book.coverImageUrl,
                status: book.status,
                rating: book.rating,
                review: book.review,
              );
            },
          );
        } else if (state is BookOperationFailure) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return Center(
          child: Text(
            'This list is currently empty.\nClick the + button below to add a new book',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        );
      },
    );
  }
}
