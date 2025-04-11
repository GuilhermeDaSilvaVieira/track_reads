import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_reads/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:track_reads/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:track_reads/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:track_reads/firebase_options.dart';
import 'package:track_reads/core/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  di.setupInjections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthBloc(
            signInWithEmail: di.sl(),
            signUpWithEmail: di.sl(),
            signOut: di.sl(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'TrackReads',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/signin',
        routes: {
          '/signin': (_) => const SignInScreen(),
          '/signup': (_) => const SignUpScreen(),
          '/home': (_) => const Text('Home'),
        },
      ),
    );
  }
}
