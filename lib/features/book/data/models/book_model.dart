import '../../domain/entities/book.dart';
import '../../domain/entities/book_status.dart';

class BookModel extends Book {
  const BookModel({
    required super.id,
    required super.title,
    required super.author,
    required super.status,
    required super.coverImageUrl,
    required super.creator,
    required super.rating,
    required super.review,
  });

  BookModel copyWith({
    String? id,
    String? title,
    String? author,
    BookStatus? status,
    String? coverImageUrl,
    double? rating,
    String? review,
    String? creator,
  }) {
    return BookModel(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      status: status ?? this.status,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      rating: rating ?? this.rating,
      review: review ?? this.review,
      creator: creator ?? this.creator,
    );
  }

  factory BookModel.fromEntity(Book book) {
    return BookModel(
      id: book.id,
      title: book.title,
      author: book.author,
      status: book.status,
      coverImageUrl: book.coverImageUrl,
      rating: book.rating,
      review: book.review,
      creator: book.creator,
    );
  }

  Book toEntity() => Book(
        id: id,
        title: title,
        author: author,
        status: status,
        coverImageUrl: coverImageUrl,
        rating: rating,
        review: review,
        creator: creator,
      );

  factory BookModel.fromMap(Map<String, dynamic> map, String id) {
    return BookModel(
      id: id,
      title: map['title'],
      author: map['author'],
      status: BookStatus.values.firstWhere(
        (e) => e.name == map['status'],
      ),
      coverImageUrl: map['coverImageUrl'],
      rating: map['rating'],
      review: map['review'],
      creator: map['creator'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'status': status.name,
      'coverImageUrl': coverImageUrl,
      'rating': rating,
      'review': review,
      'creator': creator,
    };
  }
}
