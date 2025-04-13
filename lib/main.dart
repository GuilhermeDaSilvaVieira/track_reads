import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_reads/core/bloc/app_bloc_observer.dart';
import 'package:track_reads/core/presentation/screens/not_found_screen.dart';
import 'package:track_reads/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:track_reads/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:track_reads/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:track_reads/features/book/data/models/book_model.dart';
import 'package:track_reads/features/book/presentation/bloc/book_bloc.dart';
import 'package:track_reads/features/book/presentation/screens/book_detail_screen.dart';
import 'package:track_reads/features/book/presentation/screens/book_modify_screen.dart';
import 'package:track_reads/features/book/presentation/screens/book_screen.dart';
import 'package:track_reads/firebase_options.dart';
import 'package:track_reads/core/service_locator.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
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
        BlocProvider(
          create: (_) => BookBloc(
            createBook: di.sl(),
            readBooks: di.sl(),
            updateBook: di.sl(),
            deleteBook: di.sl(),
            readBook: di.sl(),
          )..add(const BooksLoadRequested()),
        ),
      ],
      child: MaterialApp(
        title: 'TrackReads',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: '/signin',
        onGenerateRoute: (settings) {
          // Handle static routes
          if (settings.name == '/signin') {
            return MaterialPageRoute(builder: (_) => const SignInScreen());
          } else if (settings.name == '/signup') {
            return MaterialPageRoute(builder: (_) => const SignUpScreen());
          } else if (settings.name == '/books') {
            return MaterialPageRoute(builder: (_) => const BookScreen());
          } else if (settings.name == '/books/add') {
            return MaterialPageRoute(builder: (_) => const BookModifyScreen());
          } else if (settings.name == '/books/details') {
            return MaterialPageRoute(builder: (_) => const BookDetailScreen());
          } else if (settings.name == '/books/edit') {
            final book = settings.arguments as BookModel?;
            return MaterialPageRoute(
                builder: (_) => BookModifyScreen(book: book));
          }

          return null;
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (_) => const NotFoundScreen(),
        ),
      ),
    );
  }
}
