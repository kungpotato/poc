import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/theme/generated_tokens/kp_color.dart';

class AppAppbar {
  static final appbar = AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    shadowColor: KpColor.primaryLight,
    centerTitle: true,
    iconTheme: const IconThemeData(color: KpColor.secondaryLight, size: 20),
    actionsIconTheme: const IconThemeData(size: 25),
    titleTextStyle: GoogleFonts.prompt(
      color: KpColor.textPrimaryLight,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  );
}
