import 'package:equatable/equatable.dart';
import 'package:track_reads/features/book/domain/entities/book_status.dart';

class Book extends Equatable {
  final String id;
  final String title;
  final String author;
  final BookStatus status;
  final String? coverImageUrl;
  final double? rating;
  final String? review;
  final String creator;

  const Book({
    required this.id,
    required this.title,
    required this.author,
    required this.status,
    required this.coverImageUrl,
    required this.rating,
    required this.review,
    required this.creator,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        author,
        status,
        coverImageUrl,
        rating,
        review,
        creator,
      ];
}
