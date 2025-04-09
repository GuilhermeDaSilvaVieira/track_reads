import 'package:track_reads/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> signInWithEmail(String email, String password);
  Future<User> signUpWithEmail(String email, String password);
  Future<void> signOut();
}
