import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_starter/utils/color_scheme.dart';
import 'package:riverpod_starter/utils/ui.dart';

ThemeData themeLight = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.lightBlue,
    error: Colors.red.shade400,
    errorContainer: Colors.red.shade200,
    brightness: Brightness.light,
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  extensions: <ThemeExtension<dynamic>>[
    AppColorScheme.light,
  ],
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppUi.radius),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppUi.radius),
      ),
    ),
  ),
);

ThemeData themeDark = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.lightBlue,
    error: Colors.red.shade300,
    errorContainer: Colors.red.shade100,
    brightness: Brightness.dark,
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  extensions: <ThemeExtension<dynamic>>[
    AppColorScheme.dark,
  ],
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppUi.radius),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppUi.radius),
      ),
    ),
  ),
);
