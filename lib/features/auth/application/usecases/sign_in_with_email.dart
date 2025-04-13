import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class SignInWithEmail {
  final AuthRepository repository;

  SignInWithEmail(this.repository);

  Future<User> call(String email, String password) {
    return repository.signInWithEmail(email, password);
  }
}
