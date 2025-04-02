import 'package:flutter/material.dart';
import 'package:poc/theme/generated_tokens/kp_color.dart';
import 'package:poc/theme/generated_tokens/kp_font.dart';

class AppAppbar {
  static const appbar = AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    shadowColor: KpColor.primaryLight,
    centerTitle: true,
    iconTheme: IconThemeData(color: KpColor.secondaryLight, size: 20),
    actionsIconTheme: IconThemeData(size: 25),
    titleTextStyle: TextStyle(
      color: KpColor.textPrimaryLight,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: KpFont.familyBase,
    ),
  );
}
