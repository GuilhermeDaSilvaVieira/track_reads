import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/book_model.dart';

class BookFirebaseDataSource {
  final FirebaseFirestore firestore;

  BookFirebaseDataSource(this.firestore);

  Future<void> createBook(BookModel book) async {
    await firestore.collection('books').add(
          book
              .copyWith(creator: FirebaseAuth.instance.currentUser!.uid)
              .toMap(),
        );
  }

  Future<List<BookModel>> readBooks() async {
    final snapshot = await firestore
        .collection('books')
        .where('creator', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    return snapshot.docs
        .map((doc) => BookModel.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<BookModel> readBook(String id) async {
    final docSnapshot = await firestore.collection('books').doc(id).get();
    if (docSnapshot.exists && docSnapshot.data() != null) {
      return BookModel.fromMap(docSnapshot.data()!, docSnapshot.id);
    } else {
      throw Exception('Book not found');
    }
  }

  Future<void> updateBook(BookModel book) async {
    await firestore.collection('books').doc(book.id).update(book.toMap());
  }

  Future<void> deleteBook(String id) async {
    await firestore.collection('books').doc(id).delete();
  }
}
