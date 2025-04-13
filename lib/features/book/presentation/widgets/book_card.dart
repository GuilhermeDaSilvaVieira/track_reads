import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/book_status.dart';
import '../bloc/book_bloc.dart';
import 'star_rating.dart';

class BookCard extends StatelessWidget {
  final String id;
  final String title;
  final String author;
  final BookStatus status;
  final String? coverImageUrl;
  final double? rating;
  final String? review;

  const BookCard({
    super.key,
    required this.id,
    required this.title,
    required this.author,
    required this.status,
    required this.coverImageUrl,
    required this.rating,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 4,
        vertical: 2,
      ),
      child: GestureDetector(
        onTap: () {
          context.read<BookBloc>().add(
                BookReadRequested(id),
              );
          Navigator.of(context).pushNamed('/books/details');
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (coverImageUrl != null) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CachedNetworkImage(
                      imageUrl: coverImageUrl!,
                      height: 120,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        author,
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      rating != null
                          ? StarRating(rating: rating!)
                          : Container(),
                      review != null
                          ? const Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.sticky_note_2_outlined),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
