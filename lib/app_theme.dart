import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zodiac_sky_finder/core/constants.dart';

class AppTheme {
  static ThemeData light() {
    final base = ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.deepPurple,
      brightness: Brightness.light,
    );

    return base.copyWith(
      textTheme: GoogleFonts.urbanistTextTheme(base.textTheme),
      cardTheme: base.cardTheme.copyWith(
        elevation: 0,
        margin: const EdgeInsets.all(12),
        shape: kRoundedRectangleBorder.copyWith(borderRadius: BorderRadius.circular(20)),
      ),
      chipTheme: base.chipTheme.copyWith(
        shape: kRoundedRectangleBorder.copyWith(borderRadius: BorderRadius.circular(16)),
      ),
      appBarTheme: base.appBarTheme.copyWith(
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.urbanist(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: base.colorScheme.onSurface,
        ),
      ),
    );
  }
}