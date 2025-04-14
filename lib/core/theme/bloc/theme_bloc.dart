import 'package:flutter_bloc/flutter_bloc.dart';

sealed class ThemeEvent {}

final class ThemeLoad extends ThemeEvent {}

final class ThemeToggle extends ThemeEvent {}

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  ThemeBloc() : super(false) {
    on<ThemeLoad>(_loadTheme);
    on<ThemeToggle>(_toggleTheme);
  }

  void _loadTheme(ThemeLoad event, Emitter<bool> emit) {
    final isDark = false;

    emit(isDark);
  }

  void _toggleTheme(ThemeToggle event, Emitter<bool> emit) async {
    emit(!state);
  }
}
