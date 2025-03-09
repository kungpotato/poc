import 'package:flutter/material.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:poc/theme/app_color.dart';

class AppAppbar {
  static final appbar = AppBarTheme(
    backgroundColor: GFColors.WHITE,
    elevation: 0,
    shadowColor: KpColorSeed.instance.primary,
    centerTitle: true,
    iconTheme: IconThemeData(color: KpColorSeed.instance.tertiary, size: 20),
    actionsIconTheme: const IconThemeData(size: 25),
    titleTextStyle: TextStyle(
      color: KpColorSeed.instance.front,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: GoogleFonts.prompt(fontStyle: FontStyle.normal).fontFamily,
    ),
  );
}
