import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFFFFFFF);
  static const Color textColor = Color(0xFF000000);
  static const Color secondaryColor = Color(0xFF000000);
  static const Color cardColor = Color(0xFFFFA500);

  static ThemeData theme() {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: primaryColor,
      appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: textColor, fontSize: 16),
        titleLarge: TextStyle(
          color: primaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
