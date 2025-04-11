import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:track_reads/features/auth/application/usecases/sign_in_with_email.dart';
import 'package:track_reads/features/auth/application/usecases/sign_out.dart';
import 'package:track_reads/features/auth/application/usecases/sign_up_with_email.dart';
import 'package:track_reads/features/auth/data/datasources/firebase_auth_datasource.dart';
import 'package:track_reads/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:track_reads/features/auth/domain/repositories/auth_repository.dart';

final sl = GetIt.instance;

Future<void> setupAuthenticationLocator() async {
  // Firebase instance
  sl.registerLazySingleton(() => FirebaseAuth.instance);

  // Data source
  sl.registerLazySingleton(() => FirebaseAuthDataSource(sl()));

  // Repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use cases
  sl.registerLazySingleton(() => SignInWithEmail(sl()));
  sl.registerLazySingleton(() => SignUpWithEmail(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));
}
