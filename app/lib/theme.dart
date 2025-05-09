import 'package:flutter/material.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  surfaceTint: Color(0xFF6750A4),
  onErrorContainer: Color(0xFF410E0B),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFF9DEDC),
  onTertiaryContainer: Color(0xFF31111D),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD8E4),
  tertiary: Color(0xFF7D5260),
  shadow: Color(0xFF000000),
  error: Color(0xFFB3261E),
  outline: Color(0xFF79747E),
  onBackground: Color(0xFF1C1B1F),
  background: Color(0xFFFFFBFE),
  onInverseSurface: Color(0xFFF4EFF4),
  inverseSurface: Color(0xFF313033),
  onSurfaceVariant: Color(0xFF49454F),
  onSurface: Color(0xFF1C1B1F),
  surfaceVariant: Color(0xFFE7E0EC),
  surface: Color(0xFFFFFBFE),
  onSecondaryContainer: Color(0xFF1D192B),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE8DEF8),
  secondary: Color(0xFF625B71),
  inversePrimary: Color(0xFFD0BCFF),
  onPrimaryContainer: Color(0xFF21005D),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFEADDFF),
  primary: Color(0xFF6750A4),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  surfaceTint: Color.fromARGB(255, 90, 55, 172),
  onErrorContainer: Color(0xFFF2B8B5),
  onError: Color(0xFF601410),
  errorContainer: Color(0xFF8C1D18),
  onTertiaryContainer: Color(0xFFFFD8E4),
  onTertiary: Color(0xFF492532),
  tertiaryContainer: Color(0xFF633B48),
  tertiary: Color(0xFFEFB8C8),
  shadow: Color(0xFF000000),
  error: Color.fromARGB(255, 161, 65, 60),
  outline: Color.fromARGB(255, 97, 67, 142),
  onBackground: Color.fromARGB(255, 125, 60, 112),
  background: Color.fromARGB(255, 46, 66, 106),
  onInverseSurface: Color(0xFF313033),
  inverseSurface: Color(0xFFE6E1E5),
  onSurfaceVariant: Color(0xFFCAC4D0),
  onSurface: Color(0xFFE6E1E5),
  surfaceVariant: Color(0xFF49454F),
  surface: Color(0xFF1C1B1F),
  onSecondaryContainer: Color.fromARGB(255, 126, 112, 148),
  onSecondary: Color.fromARGB(255, 92, 71, 142),
  secondaryContainer: Color(0xFF4A4458),
  secondary: Color(0xFFCCC2DC),
  inversePrimary: Color(0xFF6750A4),
  onPrimaryContainer: Color(0xFFEADDFF),
  onPrimary: Color(0xFF381E72),
  primaryContainer: Color(0xFF4F378B),
  primary: Color(0xFFD0BCFF),
);

class LiquidTheme {
  Map<int, Color> mFocus = {
    50: const Color(0xffffffff),
    100: const Color(0xffffffff),
    200: const Color(0xff1f8efa),
    300: const Color(0xff1f8efa),
    400: const Color(0xff1f8efa),
    500: const Color(0xff2166ad),
    600: const Color(0xff2166ad),
    700: const Color(0xff2166ad),
    800: const Color(0xff2166ad),
    900: const Color(0xff2166ad),
  };

  Map<int, Color> mDark = {
    50: const Color(0xffffffff),
    100: const Color(0xffc7d0d8),
    200: const Color(0xffc7d0d8),
    300: const Color(0xffc7d0d8),
    400: const Color(0xff7b8aa4),
    500: const Color(0xff3c4c69),
    600: const Color(0xff284263),
    700: const Color(0xff294263),
    800: const Color(0xff242e42),
    900: const Color(0xff141f36),
  };

  ThemeData darkSchemeData() {
    MaterialColor darkColor = MaterialColor(0xff3c4c69, mDark);
    return ThemeData(
      dialogBackgroundColor: darkColor.shade900,
      canvasColor: darkColor.shade600,
      primaryColor: darkColor.shade500,
      cardColor: darkColor.shade400,
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          color: darkColor.shade400,
        ),
        bodyLarge: TextStyle(
          color: darkColor.shade200,
        ),
      ),
      primarySwatch: MaterialColor(darkColor.shade500.value, mDark),
      scaffoldBackgroundColor: darkColor.shade800,
      shadowColor: darkColor.shade700,
      highlightColor: darkColor.shade100,
      focusColor: mFocus[500],
      hintColor: const Color(0xffDB9800), //  Colors.orange,
      // hintColor: Color(0xff99C5FF), //  Colors.orange,
      // hintColor: Color(0xff99C5FF), //  Colors.orange,
      // hintColor: Color(0xffFEAA0A), //  Colors.orange,
    );
  }
}
