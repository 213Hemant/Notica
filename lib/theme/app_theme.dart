import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

// Elevated button style for dark mode.
final ButtonStyle elevatedButtonStyleDark = ElevatedButton.styleFrom(
  backgroundColor: const Color(0xFF00BCD4), // Vibrant Teal
  foregroundColor: Colors.white,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
);

// Elevated button style for light mode.
final ButtonStyle elevatedButtonStyleLight = ElevatedButton.styleFrom(
  backgroundColor: const Color(0xFF009688), // Teal shade for light mode
  foregroundColor: Colors.white,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
);

// Input border styles for dark and light themes.
final OutlineInputBorder inputBorderDark = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: const BorderSide(color: Colors.white24),
);
final OutlineInputBorder inputBorderLight = OutlineInputBorder(
  borderRadius: BorderRadius.circular(8.0),
  borderSide: const BorderSide(color: Colors.black26),
);

class AppTheme {
  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF1F1F3E), // Dark indigo
    scaffoldBackgroundColor: const Color(0xFF121212),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF1F1F3E),
      secondary: Color(0xFF00BCD4), // Vibrant Teal
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lora(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
      bodyLarge: GoogleFonts.nunito(fontSize: 16, color: Colors.white),
      bodyMedium: GoogleFonts.nunito(fontSize: 14, color: Colors.white70),
    ),
    appBarTheme: AppBarTheme(
      color: const Color(0xFF1E3A8A),
      iconTheme: const IconThemeData(color: Colors.white),
      elevation: 2,
      titleTextStyle: GoogleFonts.lora(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyleDark),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF00BCD4),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: const Color(0xFF2C2C2C),
      filled: true,
      labelStyle: GoogleFonts.nunito(fontSize: 16, color: Colors.white70),
      hintStyle: GoogleFonts.nunito(fontSize: 14, color: Colors.white54),
      border: inputBorderDark,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.white,
      selectionColor: Colors.white24,
      selectionHandleColor: Colors.white,
    ),
    dividerColor: Colors.white30,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF1F1F3E),
      selectedItemColor: Color(0xFF00BCD4),
      unselectedItemColor: Colors.white70,
      type: BottomNavigationBarType.fixed,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(const Color(0xFF00BCD4)),
      trackColor: MaterialStateProperty.all(Colors.white24),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: const Color(0xFF2C2C2C),
      titleTextStyle: GoogleFonts.lora(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 201, 201, 201),
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFF5F5F5),
      secondary: Color(0xFF009688), // Teal accent for light mode
    ),
    textTheme: TextTheme(
      displayLarge: GoogleFonts.lora(
          fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
      bodyLarge: GoogleFonts.nunito(fontSize: 16, color: Colors.black87),
      bodyMedium: GoogleFonts.nunito(fontSize: 14, color: Colors.black54),
    ),
    appBarTheme: AppBarTheme(
      color: const Color(0xFF009688),
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 2,
      titleTextStyle: GoogleFonts.lora(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(style: elevatedButtonStyleLight),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF009688),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.white,
      filled: true,
      labelStyle: GoogleFonts.nunito(fontSize: 16, color: Colors.black87),
      hintStyle: GoogleFonts.nunito(fontSize: 14, color: Colors.black54),
      border: inputBorderLight,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Colors.black12,
      selectionHandleColor: Colors.black,
    ),
    dividerColor: Colors.black26,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFF5F5F5),
      selectedItemColor: Color(0xFF009688),
      unselectedItemColor: Colors.black54,
      type: BottomNavigationBarType.fixed,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(const Color(0xFF009688)),
      trackColor: MaterialStateProperty.all(Colors.black26),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: Colors.white,
      titleTextStyle: GoogleFonts.lora(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
    ),
  );

  // System UI Overlay Styles for each theme
  static SystemUiOverlayStyle get systemUiOverlayStyleDark {
    return const SystemUiOverlayStyle(
      statusBarColor: Color(0xFF1F1F3E),
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF1F1F3E),
      systemNavigationBarIconBrightness: Brightness.light,
    );
  }

  static SystemUiOverlayStyle get systemUiOverlayStyleLight {
    return const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFF5F5F5),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFF5F5F5),
      systemNavigationBarIconBrightness: Brightness.dark,
    );
  }
}
