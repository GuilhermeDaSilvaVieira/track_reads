import 'package:get_it/get_it.dart';
import 'package:track_reads/features/auth/injection.dart' as auth_injection;

final sl = GetIt.instance;

Future<void> setupInjections() async {
  await auth_injection.setupAuthenticationLocator();
}
