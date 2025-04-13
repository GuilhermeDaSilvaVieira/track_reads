import 'package:get_it/get_it.dart';
import '../features/auth/injection.dart' as auth_injection;
import '../features/book/injection.dart' as book_injection;

final sl = GetIt.instance;

Future<void> setupInjections() async {
  await auth_injection.setupAuthenticationLocator();
  await book_injection.setupBookLocator();
}
