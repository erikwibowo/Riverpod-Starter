import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_starter/utils/color_scheme.dart';

ThemeData themeLight = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.lightBlue,
    error: Colors.red.shade400,
    brightness: Brightness.light,
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  extensions: <ThemeExtension<dynamic>>[
    AppColorScheme.light,
  ],
);

ThemeData themeDark = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.lightBlue,
    error: Colors.red.shade300,
    brightness: Brightness.dark,
  ),
  fontFamily: GoogleFonts.poppins().fontFamily,
  extensions: <ThemeExtension<dynamic>>[
    AppColorScheme.dark,
  ],
);
