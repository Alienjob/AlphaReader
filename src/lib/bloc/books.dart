import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Event being processed by [BooksBloc].
abstract class BooksEvent {}

/// Notifies bloc to change page.
class CarouselPageChangedEvent extends BooksEvent {
  final int index;
  CarouselPageChangedEvent(this.index);
}

/// {@template books_bloc}
/// A simple [Bloc] that manages an `int` index of current book as its state.
/// {@endtemplate}
class BooksBloc extends Bloc<BooksEvent, int> {
  /// {@macro books_bloc}
  BooksBloc() : super(0) {
    on<CarouselPageChangedEvent>((event, emit) => emit(state + 1));
  }
}

/// {@template brightness_cubit}
/// A simple [Cubit] that manages the [ThemeData] as its state.
/// {@endtemplate}
class ThemeCubit extends Cubit<ThemeData> {
  /// {@macro brightness_cubit}
  ThemeCubit() : super(_lightTheme);

  static final _lightTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
    ),
    brightness: Brightness.light,
  );

  static final _darkTheme = ThemeData(
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.black,
    ),
    brightness: Brightness.dark,
  );

  /// Toggles the current brightness between light and dark.
  void toggleTheme() {
    emit(state.brightness == Brightness.dark ? _lightTheme : _darkTheme);
  }
}
