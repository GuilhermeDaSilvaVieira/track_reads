import 'package:track_reads/features/auth/domain/entities/user.dart';
import 'package:track_reads/features/auth/domain/repositories/auth_repository.dart';

class SignUpWithEmail {
  final AuthRepository repository;

  SignUpWithEmail(this.repository);

  Future<User> call(String email, String password) {
    return repository.signUpWithEmail(email, password);
  }
}
