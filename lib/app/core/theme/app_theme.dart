import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppTheme {
  /// for getting light theme
  ThemeData get lightTheme {
    // TODO: add light theme here
    return ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
  }

  /// for getting dark theme
  ThemeData get darkTheme {
    // TODO: add dark theme here
    return ThemeData(
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
  }
}

/// for providing app theme [AppTheme]
final appThemeProvider = Provider<AppTheme>((_) => AppTheme());
