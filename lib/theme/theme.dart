import 'package:flutter/material.dart';

class Pallete {
  static const accentGrey = Color(0xFFF8F8F8);
  static const cardBackground = Color(0xFFFCF6EF);
  static const primaryColor = Color(0xFFFC9D11);
  static const secondaryColor = Color(0xFF232220);
  static const accentColor = Color(0xFFA4957E);

  static var lightModeTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Pallete.accentGrey,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    cardColor: cardBackground,
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme: const TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'Nunito',
        color: secondaryColor,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Nunito',
        color: secondaryColor,
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
