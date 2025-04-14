import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/book.dart';

class BookListItem extends StatelessWidget {
  final Book book;

  const BookListItem({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: book.coverImageUrl != null
            ? CachedNetworkImage(
                imageUrl: book.coverImageUrl!,
                width: 50,
                fit: BoxFit.contain,
              )
            : const Icon(Icons.book),
        title: Text(
          book.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          book.author,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        onTap: () {
          Navigator.of(context).pushNamed(
            '/books/edit',
            arguments: {
              'book': book,
              'isFromSearch': true,
            },
          );
        },
      ),
    );
  }
}
