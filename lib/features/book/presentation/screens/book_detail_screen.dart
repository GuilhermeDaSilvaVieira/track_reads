import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/book_model.dart';
import '../../domain/entities/book_status.dart';
import '../bloc/book_bloc.dart';
import '../widgets/details_popup_menu.dart';
import '../widgets/star_rating.dart';

class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({super.key});

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookBloc, BookState>(
      builder: (context, state) {
        if (state is BookLoadInProgress) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is BookReadSuccess) {
          final book = state.book;
          return PopScope(
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                context.read<BookBloc>().add(const BooksLoadRequested());
              }
            },
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  DetailsPopupMenu(
                    book: BookModel.fromEntity(book),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.labelLarge,
                              children: [
                                const TextSpan(
                                  text: 'Title: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: book.title,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: RichText(
                            text: TextSpan(
                              style: Theme.of(context).textTheme.labelLarge,
                              children: [
                                const TextSpan(
                                  text: 'Author: ',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: book.author,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      if (book.coverImageUrl != null) ...[
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: SizedBox(
                              height: 240,
                              width: 150,
                              child: CachedNetworkImage(
                                imageUrl: book.coverImageUrl!,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ],
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.labelLarge,
                                  children: [
                                    const TextSpan(
                                      text: 'Status: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: book.status.readable,
                                    ),
                                  ],
                                ),
                              ),
                              book.rating != null
                                  ? StarRating(rating: book.rating!)
                                  : Container()
                            ],
                          ),
                        ),
                      ),
                      book.review != null
                          ? Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Text(
                                      'My review',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(book.review!),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state is BookOperationFailure) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return const Center(
          child: Text('This book is empty'),
        );
      },
    );
  }
}
