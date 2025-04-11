import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:track_reads/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:track_reads/features/auth/data/utils/firebase_error_mapper.dart';
import 'package:track_reads/features/auth/domain/entities/user.dart';
import 'package:track_reads/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthDataSource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<User> signInWithEmail(String email, String password) async {
    try {
      final fb_auth.User fbUser =
          await datasource.signInWithEmail(email, password);
      return User(uid: fbUser.uid, email: fbUser.email ?? '');
    } on fb_auth.FirebaseAuthException catch (e) {
      throw Exception(mapFirebaseAuthError(e.code));
    }
  }

  @override
  Future<User> signUpWithEmail(String email, String password) async {
    try {
      final fb_auth.User fbUser =
          await datasource.signUpWithEmail(email, password);
      return User(uid: fbUser.uid, email: fbUser.email ?? '');
    } on fb_auth.FirebaseAuthException catch (e) {
      throw Exception(mapFirebaseAuthError(e.code));
    }
  }

  @override
  Future<void> signOut() => datasource.signOut();
}
