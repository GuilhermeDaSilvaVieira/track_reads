import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

sealed class ThemeEvent {}

final class ThemeLoad extends ThemeEvent {}

final class ThemeToggle extends ThemeEvent {}

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  final SharedPreferences prefs;

  ThemeBloc({required this.prefs}) : super(false) {
    on<ThemeLoad>(_loadTheme);
    on<ThemeToggle>(_toggleTheme);
  }

  void _loadTheme(ThemeLoad event, Emitter<bool> emit) {
    final isDark = (prefs.getBool('isDark') ?? false);

    emit(isDark);
  }

  void _toggleTheme(ThemeToggle event, Emitter<bool> emit) async {
    final isDark = !state;
    await prefs.setBool('isDark', isDark);

    emit(isDark);
  }
}
