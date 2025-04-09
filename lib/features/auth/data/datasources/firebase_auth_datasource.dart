import 'package:firebase_auth/firebase_auth.dart' as fb_auth;

class FirebaseAuthDatasource {
  final fb_auth.FirebaseAuth firebaseAuth;

  FirebaseAuthDatasource(this.firebaseAuth);

  Future<fb_auth.User> signInWithEmail(String email, String password) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user!;
  }

  Future<fb_auth.User> signUpWithEmail(String email, String password) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user!;
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }
}
