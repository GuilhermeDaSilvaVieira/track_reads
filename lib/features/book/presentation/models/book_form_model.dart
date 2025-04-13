import 'package:track_reads/features/book/domain/entities/book.dart';
import 'package:track_reads/features/book/domain/entities/book_status.dart';

class BookFormModel {
  final String title;
  final String author;
  final BookStatus status;
  final String? coverImageUrl;
  final double? rating;
  final String? review;

  BookFormModel({
    required this.title,
    required this.author,
    required this.status,
    required this.coverImageUrl,
    required this.rating,
    required this.review,
  });

  // Convert the form data into a domain-level Book entity
  Book toDomainEntity() {
    return Book(
      id: '',
      title: title,
      author: author,
      status: status,
      coverImageUrl: coverImageUrl,
      rating: rating,
      review: review,
      creator: '',
    );
  }
}
