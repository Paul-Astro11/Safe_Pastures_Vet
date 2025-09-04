import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryBlue = Color(0xFF2563EB); // Blue primary
  static const Color primaryBlueLight = Color(0xFF3B82F6); // Lighter blue
  static const Color primaryBlueDark = Color(0xFF1D4ED8); // Darker blue
  static const Color backgroundLight = Color(0xFF1D4ED8); // Light blue-tinted background
  static const Color backgroundDark = Color(0xFF2563EB); // Dark background

  static const Color cardLight = Color(0xFFFFFFFF); // ✅ Pure white for cards
  static const Color mutedLight = Color(0xFF4CAF50); // Light blue-gray

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: primaryBlue,
        secondary: mutedLight,
        surface: cardLight,
        background: backgroundLight,
        error: Color(0xFFDC2626),
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: Colors.black, // ✅ Black text on surfaces
        onBackground: Colors.black, // ✅ Black text on background
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: backgroundLight,
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundLight,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: cardLight,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlueDark,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Color(0xFFD1D5DB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: primaryBlue, width: 2),
        ),
        filled: true,
        fillColor: cardLight,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: primaryBlueLight,
        secondary: Color(0xFF9CA3AF),
        surface: backgroundDark,
        background: backgroundDark,
        error: Color(0xFFEF4444),
        onPrimary: backgroundDark,
        onSecondary: backgroundDark,
        onSurface: Colors.white,
        onBackground: Colors.white,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: backgroundDark,
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundDark,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1E293B),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
